{-# LANGUAGE OverloadedStrings #-}
module Http (
    RespWriter,
    textOk,
  ) where


import Data.ByteString.Lazy.Internal (ByteString)
import Network.Wai
import Network.HTTP.Types


type RespWriter = Response -> IO ResponseReceived


textOk :: ByteString -> RespWriter -> IO ResponseReceived
textOk body respond = respond $ responseLBS 
  status200 
  [("Content-Type", "text/plain")] 
  (body <> "\r\n")
