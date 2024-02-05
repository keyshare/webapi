{-# LANGUAGE OverloadedStrings #-}
module App ( 
    keyshare
    ) where


import Data.Text
import Data.ByteString.Lazy.Internal (ByteString)
import Network.Wai
import Network.HTTP.Types


okText :: ByteString -> (Response -> IO ResponseReceived) -> IO ResponseReceived
okText body respond = respond $ responseLBS 
  status200 
  [("Content-Type", "text/plain")] 
  (body <> "\r\n")


foo :: Application
foo _ = okText "Hello, foo!"


foobar :: Application
foobar _ = okText "Hello, foo bar!"


root :: Application
root _ = okText "Hello, root!"


route :: [Text] -> Application
route ("foo":[]) = foo
route ("foo":"bar":_) = foobar
route _ = root


keyshare :: Application
keyshare req = route (pathInfo req) req
