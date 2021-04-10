
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
      
  describe "Decode the Morse code 6 kyu" $ do
    it ".... . -.--   .--- ..- -.. . should return HEY JUDE" $ do
      decodeMorse ".... . -.--   .--- ..- -.. ." `shouldBe` "HEY JUDE"    
    
    it ".... . -.--   .--- ..- -.. . should return HEY JUDE" $ do
          decodeMorse ".... . -.--   .--- ..- -.. ." `shouldBe` "HEY JUDE"     
  