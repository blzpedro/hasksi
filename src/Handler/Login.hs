{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Login where

import Import
import Data.FileEmbed(embedFile)
import Text.Lucius
import Text.Julius
import Database.Persist.Postgresql

postSairR :: Handler Html
postSairR = do
    deleteSession "_NOME"
    redirect HomeR