{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.GeraFrase where

import Import
import Data.FileEmbed(embedFile)
import Text.Lucius
import Text.Julius
--import Network.HTTP.Types.Status
import Database.Persist.Postgresql
import Database.Persist.Types (PersistValue(PersistInt64))

-- randomPhrase -> select "frase" from "frases" ORDER BY random() limit 1;

getGeraFraseR :: Handler Html
getGeraFraseR = do
    defaultLayout $ do
        sess <- lookupSession "_NOME"
        addStylesheet (StaticR css_bootstrap_css)
        addStylesheet (StaticR css_main_css)
        addScript $ StaticR js_jquery_min_js
        addScript $ StaticR js_bootstrap_js
        setTitle "HaskellMilGrau"
        toWidget $(juliusFile "templates/home.julius")
        $(whamletFile "templates/header.hamlet")
        toWidgetHead [hamlet|
              <meta name="viewport" content="width=device-width, initial-scale=1.0">
              <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
              <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
              <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
        |] 
        [whamlet|
        <header class="masthead">
            <div class="container h-100">
              <div class="row h-100">
                <div class="col-lg-10 my-auto m-auto">
                    <h1 .title>HaskellMilGrau - só frase top!
                    <button #btn-random .btn-danger>Clique aqui e<br> gere sua frase!
                    <div .string-field .col-lg-12 .m-auto>
                        <span>
        |]
        $(whamletFile "templates/footer.hamlet")
        -- let randomKey = randomR (1,16 :: Int)
        -- frase <- get $ Key $ PersistInt64 (fromIntegral randomKey)
        -- [whamlet|
        --     <p>#{frase}
        -- |]
    
        
                
        
        