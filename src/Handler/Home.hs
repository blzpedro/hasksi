{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Home where

import Import
--import Network.HTTP.Types.Status
import Database.Persist.Postgresql

getAdsR :: Handler TypedContent
getAdsR = return $ TypedContent "text/plain"
    $ toContent $(embedFile "static/ads.txt")

getHomeR :: Handler Html
getHomeR = do
    defaultLayout $ do
        -- addScriptRemote "url" -> js cdn
        -- addScript (Static script_js) -> js interno
        -- 8aQZvtkO
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
            <img src=@{StaticR santos_png}>
            
            <button onclick="ola()" class="btn btn-danger">Clickar
        |]
