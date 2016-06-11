import Data.List

f :: Int -> [Int] -> Int -> Int
f ordinal sieve n = case ordinal of 1001 -> head sieve
                                    _  -> if isPrime n
                                          then f (succ ordinal) (n:sieve) (succ n)
                                          else f ordinal sieve (succ n)
    where isPrime = \n -> not $ any (\x -> n `mod` x == 0) sieve

main = putStrLn $ show $ f 0 [] 2

