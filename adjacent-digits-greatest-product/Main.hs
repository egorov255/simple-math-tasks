import Data.List
import Data.Char

slice :: Int -> Int -> [a] -> [a]
slice from to xs = take (to - from + 1) (drop from xs)

main = putStrLn $ show $ maximum $ map (product . (map digitToInt) . getAdjacentDigits) [0..maxShift]
    where adjacentDigitsNumber = 3
          bigNumber = "1234567898"
          maxShift = (length bigNumber) - adjacentDigitsNumber
          rightBorder = \n -> n + adjacentDigitsNumber - 1
          getAdjacentDigits = \n -> slice n (rightBorder n) bigNumber
