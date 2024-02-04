{-# LANGUAGE OverloadedStrings #-}
module Main (main) where


import App
import Network.Wai.Handler.Warp (run)


main :: IO ()
main = do
    putStrLn $ "http://localhost:8080/"
    run 8080 keyshare
