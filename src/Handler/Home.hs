{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Home where

import Import
import Data.FileEmbed(embedFile)
import Text.Lucius
import Text.Julius
--import Network.HTTP.Types.Status
import Database.Persist.Postgresql
import Database.Persist.Sql (rawSql)


-- randomPhrase -> select "frase" from "frases" ORDER BY random() limit 1;

getHomeR :: Handler Html
getHomeR = do
    defaultLayout $ do
        sess <- lookupSession "_NOME"
        addStylesheet (StaticR css_bootstrap_css)
        addStylesheet (StaticR css_main_css)
        addScript $ StaticR js_jquery_min_js
        addScript $ StaticR js_bootstrap_js
        setTitle "HaskellMilGrau"
        $(whamletFile "templates/header.hamlet")
        $(whamletFile "templates/home.hamlet")
        toWidget $(juliusFile "templates/home.julius")
    -- addScript (Static script_js) -> js interno
    -- 8aQZvtkO
    -- defaultLayout $ do 
    --     -- remoto
    --     addScriptRemote "https://code.jquery.com/jquery-3.4.1.min.js"
    --     -- esta no projeto
    --     addStylesheet (StaticR css_bootstrap_css)
    --     sess <- lookupSession "_NOME"
    --     toWidgetHead [julius|
    --         function ola(){
    --             alert("OLA MUNDO");
    --         }
    --     |]
    --     toWidgetHead [lucius|
    --         h1 {
    --             color : red;
    --         }
            
    --         ul {
    --             display: inline;
    --             list-style: none;
    --         }
    --     |]
    --     [whamlet|
    --         <div>
    --             <h1>
    --                 OLA MUNDO
                
    --             $maybe nome <- sess
    --                 <li>
    --                     <div>
    --                         Ola #{nome}
    --                     <form method=post action=@{SairR}>
    --                         <input type="submit" value="Sair">
    --             $nothing
    --                 <li>
    --                     <div>
    --                         convidado
            
    --         <h1> CUUUUUUUUUUUU
            
    --         <button class="btn btn-danger" onclick="ola()">
    --             OK
    --     |]
        
                
        
        