module Lib
    ( someFunc, myFunc, readzhengma, process, result
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
import System.IO.Unsafe

someFunc :: IO ()
someFunc = putStrLn "someFunc"

myFunc :: String
myFunc = "myFunc"


result = do
  content <- readzhengma
  let semiresult = process content
  return semiresult

readzhengma :: IO String
readzhengma = do
        handle <- openFile "src/resources/zz201906_test.txt" ReadMode
        contents <- hGetContents handle
        return contents

process :: String -> String
process a = head $ endBy "\n" a




-- slut