{-# LANGUAGE OverloadedStrings #-}
module App ( 
  keyshare
  ) where


import Http
import Data.Text
import Network.Wai


foo :: Application
foo _ = textOk "Hello, foo!"


foobar :: Application
foobar _ = textOk "Hello, foo bar!"


root :: Application
root _ = textOk "Hello, root!"


route :: [Text] -> Application
route ("foo":"bar":_) = foobar
route ("foo":_) = foo
route _ = root


keyshare :: Application
keyshare req = route (pathInfo req) req
