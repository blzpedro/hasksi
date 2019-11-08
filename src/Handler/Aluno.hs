{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Aluno where

import Import
import Data.FileEmbed(embedFile)
import Text.Lucius
import Text.Julius
--import Network.HTTP.Types.Status
import Database.Persist.Postgresql


formAluno :: Form Aluno
formAluno = renderBootstrap $ Aluno
    <$> areq textField "Nome: " Nothing
    <*> areq textField "RA: " Nothing
    <*> areq dayField "Data: " Nothing


getAlunoR :: Handler Html
getAlunoR = do
    (widget, enctype) <- generateFormPost formAluno
    msg <- getMessage
    defaultLayout $ do
    addSylesheet (StaticR css_bootstrap_css)
        [whamlet |
              $maybe mensa < - msg
              <div>
                    ^{mensa}
             
            <h1>
            CADASTRO DE ALUNO 
            
            <form method=post action=@{AlunoR}>
                ^{widget}
                <button>
                    Cadastrar
        |]


getListAlunoR :: Handler Html
getListAlunoR = do
    --select * from aluno order by aluno.nome
        alunos <- runDB $ selectList [] [Asc AlunoNome]
        defaultLayout $ do 
        $(whamletFile "templates/alunos.hamlet")



postAlunoR :: Handler Html
postAlunoR = do
    ((result,_),_) <- runFormPost formAluno
    case result of
        FormSucess aluno -> do
        runDB $ insert aluno
        setMessage [shamlet|
            <h2>
                Registro Incluido
        ]
        redirect AlunoR    
    _ -> redirect HomeR

postApagarAlunoR :: AlunoId -> Handler Html
postApagarAlunoR aid = do
    _ <- runDB $ get404 aid
    runDB $ delete aid
    redirect ListarAlunoR
