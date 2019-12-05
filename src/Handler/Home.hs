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
import Database.Persist.Types (PersistValue(PersistInt64))


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
        toWidgetHead [hamlet|
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
              <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
              <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
              <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
        |] 
        $(whamletFile "templates/footer.hamlet")
        -- randomPhrase -> select "frase" from "frases" ORDER BY random() limit 1;
        -- let randomKey = randomR (1,16 :: Int)
        -- frase <- get $ Key $ PersistInt64 (fromIntegral randomKey)
        -- [whamlet|
        --     <p>#{frase}
        -- |]
        
        -- 8aQZvtkO
        
                
        
        