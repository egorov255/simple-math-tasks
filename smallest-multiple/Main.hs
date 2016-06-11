import Data.List

f :: [Int] -> [Int] -> Int
f range factors = if null range then product factors else f newRange $ currentFactor:factors
    where newRange = filter ((/=) 1) $ map (divideIfDivisible currentFactor) range
          divideIfDivisible = \divisor n -> if n `mod` divisor == 0 then n `quot` divisor else n
          currentFactor = head range

main = putStrLn $ show $ f [2..20] []
