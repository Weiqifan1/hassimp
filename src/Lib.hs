module Lib
    ( someFunc, myFunc, remove, exist, difference
    ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

myFunc :: String
myFunc = "myFunc"

difference :: Eq a => [a] -> [a] -> [a]
difference (x:xs) [] = (x:xs)
difference [] _ = []
difference (x:xs) (y:ys) | (exist y (x:xs)) == True = difference (remove y (x:xs)) ys
                         | (exist y (x:xs)) == False = difference (x:xs) ys

exist :: Eq a => a -> [a] -> Bool
exist _ [] = False
exist a (x : xs) | a == x = True
                 | a /= x = exist a xs

remove :: Eq a => a -> [a] -> [a]
remove _ [] = []
remove x (y:ys) | x == y = remove x ys
                | otherwise = y : remove x ys




-- slut