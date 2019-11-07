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
        addScript $ StaticR js_jquery_min_js
        addScript $ StaticR js_bootstrap_js
        toWidgetHead $(luciusFile "templates/adCSS.lucius")
        toWidgetHead $(juliusFile "templates/adScript.julius")
        toWidgetHead $(luciusFile "templates/main.lucius")
        toWidgetHead $(juliusFile "templates/main.julius")
        
        [whamlet|
            <meta charset="UTF-8">
            <meta name="description" content="Site Haskellmilgrau">
            <meta name="viewport" content="width=device-width, initial-scale=1">
        |]
        $(whamletFile "templates/header.hamlet")
        $(whamletFile "templates/time.hamlet")

getContatoR :: Handler Html
getContatoR = do
    defaultLayout $ do
        addStylesheet (StaticR css_bootstrap_css)
        addScript $ StaticR js_jquery_min_js
        addScript $ StaticR js_bootstrap_js
        toWidgetHead $(luciusFile "templates/adCSS.lucius")
        toWidgetHead $(juliusFile "templates/adScript.julius")
        toWidgetHead $(luciusFile "templates/main.lucius")
        toWidgetHead $(juliusFile "templates/main.julius")
        
        [whamlet|
            <meta charset="UTF-8">
            <meta name="description" content="Site Haskellmilgrau">
            <meta name="viewport" content="width=device-width, initial-scale=1">
        |]
        $(whamletFile "templates/header.hamlet")
        $(whamletFile "templates/contato.hamlet")

getGaleriaR :: Handler Html
getGaleriaR = do
    defaultLayout $ do
        addStylesheet (StaticR css_bootstrap_css)
        addScript $ StaticR js_jquery_min_js
        addScript $ StaticR js_bootstrap_js
        toWidgetHead $(luciusFile "templates/adCSS.lucius")
        toWidgetHead $(juliusFile "templates/adScript.julius")
        toWidgetHead $(luciusFile "templates/main.lucius")
        toWidgetHead $(juliusFile "templates/main.julius")
        
        [whamlet|
            <meta charset="UTF-8">
            <meta name="description" content="Site Haskellmilgrau">
            <meta name="viewport" content="width=device-width, initial-scale=1">
        |]
        $(whamletFile "templates/header.hamlet")
        $(whamletFile "templates/galeria.hamlet")

getSobreR :: Handler Html
getSobreR = do
    defaultLayout $ do
        addStylesheet (StaticR css_bootstrap_css)
        addScript $ StaticR js_jquery_min_js
        addScript $ StaticR js_bootstrap_js
        toWidgetHead $(luciusFile "templates/adCSS.lucius")
        toWidgetHead $(juliusFile "templates/adScript.julius")
        toWidgetHead $(luciusFile "templates/main.lucius")
        toWidgetHead $(juliusFile "templates/main.julius")
        
        [whamlet|
            <meta charset="UTF-8">
            <meta name="description" content="Site Haskellmilgrau">
            <meta name="viewport" content="width=device-width, initial-scale=1">
        |]
        $(whamletFile "templates/header.hamlet")
        $(whamletFile "templates/sobre.hamlet")
        

getAdsR :: Handler TypedContent
getAdsR = return $ TypedContent "text/plain"
    $ toContent $(embedFile "static/ads.txt")

getHomeR :: Handler Html
getHomeR = do
    defaultLayout $ do
        -- addScript (Static script_js) -> js interno
        -- 8aQZvtkO
        addStylesheet (StaticR css_bootstrap_css)
        addScript $ StaticR js_jquery_min_js
        addScript $ StaticR js_bootstrap_js
        toWidgetHead $(luciusFile "templates/adCSS.lucius")
        toWidgetHead $(juliusFile "templates/adScript.julius")
        toWidgetHead $(luciusFile "templates/main.lucius")
        toWidgetHead $(juliusFile "templates/main.julius")

        [whamlet|
            <meta charset="UTF-8">
            <meta name="description" content="Site Haskellmilgrau">
            <meta name="viewport" content="width=device-width, initial-scale=1">
        |]
        $(whamletFile "templates/header.hamlet")
        $(whamletFile "templates/home.hamlet")