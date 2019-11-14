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

getTimeR :: Handler Html
getTimeR = do
    defaultLayout $ do
        addStylesheet (StaticR css_bootstrap_css)
        addStylesheet (StaticR css_main_css)
        addScript $ StaticR js_jquery_min_js
        addScript $ StaticR js_bootstrap_js
        toWidgetHead $(luciusFile "templates/adCSS.lucius")
        toWidgetHead $(juliusFile "templates/adScript.julius")
        --toWidgetHead $(luciusFile "templates/main.lucius")
        

        
        [whamlet|
            <meta charset="UTF-8">
            <meta name="description" content="Site Haskellmilgrau">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Haskellmilgrau
        |]
        $(whamletFile "templates/header.hamlet")
        $(whamletFile "templates/time.hamlet")

getContatoR :: Handler Html
getContatoR = do
    defaultLayout $ do
        addStylesheet (StaticR css_bootstrap_css)
        addStylesheet (StaticR css_main_css)
        addScript $ StaticR js_jquery_min_js
        addScript $ StaticR js_bootstrap_js
        toWidgetHead $(luciusFile "templates/adCSS.lucius")
        toWidgetHead $(juliusFile "templates/adScript.julius")
        --toWidgetHead $(luciusFile "templates/main.lucius")

        
        [whamlet|
            <meta charset="UTF-8">
            <meta name="description" content="Site Haskellmilgrau">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Haskellmilgrau
        |]
        $(whamletFile "templates/header.hamlet")
        $(whamletFile "templates/contato.hamlet")

getGaleriaR :: Handler Html
getGaleriaR = do
    defaultLayout $ do
        addStylesheet (StaticR css_bootstrap_css)
        addStylesheet (StaticR css_main_css)
        addScript $ StaticR js_jquery_min_js
        addScript $ StaticR js_bootstrap_js
        toWidgetHead $(luciusFile "templates/adCSS.lucius")
        toWidgetHead $(juliusFile "templates/adScript.julius")
        --toWidgetHead $(luciusFile "templates/main.lucius")

        
        [whamlet|
            <meta charset="UTF-8">
            <meta name="description" content="Site Haskellmilgrau">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Haskellmilgrau
        |]
        $(whamletFile "templates/header.hamlet")
        $(whamletFile "templates/galeria.hamlet")

getSobreR :: Handler Html
getSobreR = do
    defaultLayout $ do
        addStylesheet (StaticR css_bootstrap_css)
        addStylesheet (StaticR css_main_css)
        addScript $ StaticR js_jquery_min_js
        addScript $ StaticR js_bootstrap_js
        toWidgetHead $(luciusFile "templates/adCSS.lucius")
        toWidgetHead $(juliusFile "templates/adScript.julius")
        --toWidgetHead $(luciusFile "templates/main.lucius")

        
        [whamlet|
            <meta charset="UTF-8">
            <meta name="description" content="Site Haskellmilgrau">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Haskellmilgrau
        |]
        $(whamletFile "templates/header.hamlet")
        $(whamletFile "templates/sobre.hamlet")
        

getAdsR :: Handler TypedContent
getAdsR = return $ TypedContent "text/plain"
    $ toContent $(embedFile "static/ads.txt")

getHomeR :: Handler Html
getHomeR = do
    -- defaultLayout $ do
    --     sess <- lookupSession "_NOME"
    --     -- addScript (Static script_js) -> js interno
    --     -- 8aQZvtkO
    --     addStylesheet (StaticR css_bootstrap_css)
    --     addStylesheet (StaticR css_main_css)
    --     addScript $ StaticR js_jquery_min_js
    --     addScript $ StaticR js_bootstrap_js
    --     toWidgetHead $(luciusFile "templates/adCSS.lucius")
    --     toWidgetHead $(juliusFile "templates/adScript.julius")
    --     --toWidgetHead $(luciusFile "templates/main.lucius")

        
    --     [whamlet|
    --         <meta charset="UTF-8">
    --         <meta name="description" content="Site Haskellmilgrau">
    --         <meta name="viewport" content="width=device-width, initial-scale=1">
    --         <title>Haskellmilgrau
    --     |]
    --     $(whamletFile "templates/header.hamlet")
    --     $(whamletFile "templates/home.hamlet")
    defaultLayout $ do 
        -- remoto
        addScriptRemote "https://code.jquery.com/jquery-3.4.1.min.js"
        -- esta no projeto
        addStylesheet (StaticR css_bootstrap_css)
        sess <- lookupSession "_NOME"
        toWidgetHead [julius|
            function ola(){
                alert("OLA MUNDO");
            }
        |]
        toWidgetHead [lucius|
            h1 {
                color : red;
            }
            
            ul {
                display: inline;
                list-style: none;
            }
        |]
        [whamlet|
            <div>
                <h1>
                    OLA MUNDO
            
            <ul>
                <li>
                    <a href=@{Page1R}>
                        Pagina 1
                
                <li>
                    <a href=@{Page2R}>
                        Pagina 2
                
                $maybe nome <- sess
                    <li>
                        <div>
                            Ola #{nome}
                        <form method=post action=@{SairR}>
                            <input type="submit" value="Sair">
                $nothing
                    <li>
                        <div>
                            convidado
            
            <img src=@{StaticR citeg_jpg}>
            
            <button class="btn btn-danger" onclick="ola()">
                OK
        |]
        
                
        
        