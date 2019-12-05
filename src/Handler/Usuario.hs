{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Usuario where

import Import
import Data.FileEmbed(embedFile)
import Text.Lucius
import Text.Julius
import Database.Persist.Postgresql

formUsu :: Form (Usuario, Text)
formUsu = renderBootstrap $ (,)
    <$> (Usuario 
        <$> areq textField "Nome: " Nothing
        <*> areq emailField "E-mail: " Nothing
        <*> areq passwordField "Senha: " Nothing)
    <*> areq passwordField "Digite Novamente: " Nothing
    
getUsuarioR :: Handler Html
getUsuarioR = do 
    (widget,_) <- generateFormPost formUsu
    msg <- getMessage
    defaultLayout $ do
        sess <- lookupSession "_NOME"
        setTitle "HaskellMilGrau"
        $(whamletFile "templates/header.hamlet")
        addStylesheet (StaticR css_bootstrap_css)
        addStylesheet (StaticR css_main_css)
        $(whamletFile "templates/usuario.hamlet")
        $(whamletFile "templates/footer.hamlet")
        
postUsuarioR :: Handler Html
postUsuarioR = do 
    ((result,_),_) <- runFormPost formUsu
    case result of 
        FormSuccess (usuario,veri) -> do 
            if (usuarioSenha usuario == veri) then do 
                runDB $ insert usuario 
                setMessage [shamlet|
                    <div>
                        Usuário incluído
                |]
                redirect UsuarioR
            else do 
                setMessage [shamlet|
                    <div>
                        Senhas não estão iguais
                |]
                redirect UsuarioR
        _ -> redirect HomeR
