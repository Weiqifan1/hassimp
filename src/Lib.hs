module Lib
    ( someFunc, myFunc, readzz
    ) where

import Data.List.Split
import Data.List
import Control.Monad
-- regex tdfa
-- https://williamyaoh.com/posts/2019-04-11-cheatsheet-to-regexes-in-haskell.html
-- https://hackage.haskell.org/package/regex-tdfa
import Text.Regex.TDFA
import Text.Regex.TDFA.Text ()
import System.IO

someFunc :: IO ()
someFunc = putStrLn "someFunc"

myFunc :: String
myFunc = "myFunc"

readzz :: IO String
readzz = do
        let list = []
        handle <- openFile "src/resources/zz201906_test.txt" ReadMode
        contents <- hGetContents handle
        return contents






-- slut