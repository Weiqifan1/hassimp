module Lib
    ( someFunc, myFunc, readzhengma,
    process, result, ycontainsx, myNub, removexfromy, simpelflatten,
    getRelevantLines, getLetToHan, listOfSameKeys, listOfSameValues, getLetterKeys, getUniqueLettersHan, getUniqueHanLetters, getUniqueLettersHanFromFile, getUniqueHanLettersFromFile
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

-- content <- readzhengma
-- getLetToHan content
-- simpelflatten $ map (\x -> (endBy ",<" x)) $ getRelevantLines content


getUniqueHanLettersFromFile :: IO [[String]]
getUniqueHanLettersFromFile = do
  content <- readzhengma
  let result = getUniqueHanLetters $ getLetToHan content
  return result

-- get UniqueLettersTohan
getUniqueLettersHanFromFile :: IO [[String]]
getUniqueLettersHanFromFile = do
  content <- readzhengma
  let result = getUniqueLettersHan $ getLetToHan content
  return result

getUniqueHanLetters :: [[String]] -> [[String]]
getUniqueHanLetters letToHanNested = myNub $ map (\x -> (listOfSameValues x letToHanNested)) (getHanValues letToHanNested)

-- myNub $ map (\x -> (listOfSameValues x letTohan)) (getLetterKeys letTohan)
getUniqueLettersHan :: [[String]] -> [[String]]
getUniqueLettersHan letToHanNested = myNub $ map (\x -> (listOfSameKeys x letToHanNested)) (getLetterKeys letToHanNested)

getHanValues :: [[String]] -> [String]
getHanValues letToHanNested = map (\x -> (last x)) letToHanNested

-- create list of unique letterKeys from zhengma nested string (letter, character)
getLetterKeys :: [[String]] -> [String]
getLetterKeys letToHanNested = map (\x -> (head x)) letToHanNested

--listOfSameValues :: String -> [[String]] -> [String]
--  ("\19968" :) $ map (\x -> (head x)) $ filter (\x -> ("\19968" == last x)) $ getLetToHan content
listOfSameValues :: String -> [[String]] -> [String]
listOfSameValues hanValue letToHanNested = (hanValue :) $ map (\x -> (head x)) $ filter (\x -> (hanValue == last x)) $ letToHanNested

-- create list of items that has x in first position
-- example: (listOfSameValues "aatt") $ getLetToHan content
listOfSameKeys :: String -> [[String]] -> [String]
listOfSameKeys letterKey letToHanNested = (letterKey :) $ simpelflatten $ map (\x -> (tail x)) $ filter (\x -> (letterKey == head x)) $ letToHanNested

-- get nested String (letter, characters) from a zhengmaFileContent String
getLetToHan :: String -> [[String]]
getLetToHan zhengmaFile = map (\x -> endBy "=" x) $
                          map (\x -> removexfromy "\"" x) $
                          map (\x -> removexfromy ">" x) $
                          simpelflatten $
                          map (\x -> (endBy ",<" x)) $
                          getRelevantLines zhengmaFile

-- get lines from a raw zhengma file that actually contains letter to character mappings
getRelevantLines :: String -> [String]
getRelevantLines zhengmafilecontent = filter (\x -> (ycontainsx "\"=\"" x)) $ endBy "\n" zhengmafilecontent

-- helperfunction remove dublicates from list
myNub :: (Eq a) => [a] -> [a]
myNub (x:xs) = x : myNub (filter (/= x) xs)
myNub [] = []

-- helperfunction remove substring x from y
removexfromy :: String -> String -> String
removexfromy w "" = ""
removexfromy w s@(c:cs)
  | w `isPrefixOf` s = removexfromy w (drop (length w) s)
  | otherwise = c : removexfromy w cs

-- helperfunction flatten list of list
simpelflatten :: [[a]] -> [a]
simpelflatten xs = (\z n -> foldr (\x y -> foldr z y x) n xs) (:) []

-- helperfunction ycontainsx checks if x exists in y
ycontainsx :: String -> String -> Bool
ycontainsx (_:_) [] = False
ycontainsx xs ys
    | prefix xs ys = True
    | ycontainsx xs (tail ys) = True
    | otherwise = False

prefix :: String -> String -> Bool
prefix [] _ = True
prefix (_:_) [] = False
prefix (x:xs) (y:ys) = (x == y) && prefix xs ys



-- slut