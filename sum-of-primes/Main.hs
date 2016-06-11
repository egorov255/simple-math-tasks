import Data.List

readMaybe :: Read a => String -> Maybe a
readMaybe s = case reads s of
                  [(val, "")] -> Just val
                  _           -> Nothing

f :: Int -> [Int] -> Int -> Int
f maxNumber sieve n
    | n == maxNumber = sum sieve
    | otherwise = if isPrime n
                  then f maxNumber (n:sieve) (succ n)
                  else f maxNumber sieve (succ n)
    where isPrime = \n -> not $ any (\x -> n `mod` x == 0) sieve

main = do
    putStrLn "Enter the max number:"

    line <- getLine

    let maybeInt = readMaybe line :: Maybe Int

    case maybeInt of
         Just n  -> if n > 1 && n <= 10^7
             then putStrLn $ show $ f n [] 2
             else tryAgain
         Nothing -> tryAgain
         where tryAgain = putStrLn "Please try again." >> main
