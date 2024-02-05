{-# OPTIONS_GHC -F -pgmF htfpp #-}
module Main ( main ) where


import Test.Framework 
import {-@ HTF_TESTS @-} Json


main :: IO ()
main = htfMain htf_importedTests
-- main = htfMain htf_thisModulesTests
