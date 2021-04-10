module Lib
    ( someFunc, myFunc, decodeMorse, morseOrSpace, reverse
    ) where

import Data.List.Split
import Data.List
-- regex tdfa
-- https://williamyaoh.com/posts/2019-04-11-cheatsheet-to-regexes-in-haskell.html
-- https://hackage.haskell.org/package/regex-tdfa
import Text.Regex.TDFA
import Text.Regex.TDFA.Text ()
  
someFunc :: IO ()
someFunc = putStrLn "someFunc"

myFunc :: String
myFunc = "myFunc"

-- it should be able to handle whitespace
-- morse to ordinary string (capital letters only)

--import Data.List
--import Data.List.Split
decodeMorse :: String -> String
decodeMorse a = intercalate " " $
                words $
                intercalate "" $
                map morseOrSpace $
                endBy " " a

morseOrSpace code = case code of
  ".-" -> "A"
  "-..." -> "B"
  "-.-." -> "C"
  "-.." -> "D"
  "." -> "E"
  "..-." -> "F"
  "--." -> "G"
  "...." -> "H"
  ".." -> "I"
  ".---" -> "J"
  "-.-" -> "K"
  ".-.." -> "L"
  "--" -> "M"
  "-." -> "N"
  "---" -> "O"
  ".--." -> "P"
  "--.-" -> "Q"
  ".-." -> "R"
  "..." -> "S"
  "-" -> "T"
  "..-" -> "U"
  "...-" -> "V"
  ".--" -> "W"
  "-..-" -> "X"
  "-.--" -> "Y"
  "--.." -> "Z"
  ".-.-.-" -> "."
  "--..--" -> ","
  "..--.." -> "?"
  ".----." -> "'"
  "-.-.--" -> "!"
  "-..-." -> "/"
  _ -> " "






-- slut