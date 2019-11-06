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


getContatoR :: Handler Html
getContatoR = do
    defaultLayout $ do
        addScriptRemote "https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"
        addScriptRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        $(whamletFile "templates/nav-header.hamlet")
        $(whamletFile "templates/header.hamlet")
        toWidgetHead $(luciusFile "templates/adCSS.lucius")
        toWidgetHead $(juliusFile "templates/adScript.julius")
        addStylesheet (StaticR css_bootstrap_css)

getGaleriaR :: Handler Html
getGaleriaR = do
    defaultLayout $ do
        addScriptRemote "https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"
        addScriptRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        $(whamletFile "templates/nav-header.hamlet")
        $(whamletFile "templates/header.hamlet")
        toWidgetHead $(luciusFile "templates/adCSS.lucius")
        toWidgetHead $(juliusFile "templates/adScript.julius")
        addStylesheet (StaticR css_bootstrap_css)


getAdsR :: Handler TypedContent
getAdsR = return $ TypedContent "text/plain"
    $ toContent $(embedFile "static/ads.txt")

getHomeR :: Handler Html
getHomeR = do
    defaultLayout $ do
        addScriptRemote "https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"
        addScriptRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        -- addScript (Static script_js) -> js interno
        -- 8aQZvtkO
        $(whamletFile "templates/nav-header.hamlet")
        $(whamletFile "templates/header.hamlet")
        toWidgetHead $(luciusFile "templates/adCSS.lucius")
        toWidgetHead $(juliusFile "templates/adScript.julius")
        addStylesheet (StaticR css_bootstrap_css)
        toWidgetHead [julius|
            function ola(){
                alert("ola mundo");
            }
            
        |]
        toWidgetHead [lucius|
            h1{
                color: red;
            }
        |]
        [whamlet|
            <h1>Olá mundo
        |]
