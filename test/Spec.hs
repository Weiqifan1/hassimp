
import Lib
--import Test.Tasty.Hspec

--main :: IO ()
--main = putStrLn "Test suite not yet implemented"

import Test.Tasty.Hspec
import Test.Tasty.QuickCheck
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
  describe "Prelude.head" $ do
    it "returns the first element of a list" $ do
      head [23 ..] `shouldBe` (23 :: Int)

    it "returns the first element of an *arbitrary* list" $
      property $ \x xs -> head (x:xs) == (x :: Int)

    it "throws an exception if used with an empty list" $ do
      evaluate (head []) `shouldThrow` anyException
  
  describe "someFunc shoud return text" $ do
    it "retrun string" $ do
      myFunc `shouldBe` "myFunc" 
       
  -- difference :: Eq a => [a] -> [a] -> [a]      
  describe "function difference" $ do
    it "difference [1,2] [1] == [2]" $ do
      difference [1,2] [1] `shouldBe` [2]
    it "difference [1,2,2,2,3] [2] == [1,3]" $ do
      difference [1,2,2,2,3] [2] `shouldBe` [1,3]   