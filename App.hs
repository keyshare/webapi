{-# LANGUAGE OverloadedStrings #-}
module App ( 
    keyshare
    ) where


import Network.Wai
import Network.HTTP.Types


keyshare :: Application
keyshare _ respond = do
    putStrLn "I've done some IO here"
    respond $ responseLBS
        status200
        [("Content-Type", "text/plain")]
        "Hello, Web!"
