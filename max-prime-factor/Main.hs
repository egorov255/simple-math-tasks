import Data.List

readMaybe :: Read a => String -> Maybe a
readMaybe s = case reads s of
                  [(val, "")] -> Just val
                  _           -> Nothing

f :: Int -> Int -> Int -> Int
f bigNumber currentMaxFactor i
    | i >= bigNumber = currentMaxFactor
    | bigNumber `mod` i == 0 = f (quot bigNumber i) i i
    | otherwise = f bigNumber currentMaxFactor (i + 1)

main = do
    putStrLn "Enter the number of results (1 to 100) to show:"

    line <- getLine

    let maybeInt = readMaybe line :: Maybe Int

    case maybeInt of
         Just n  -> if n > 0 && n <= 10^6
             then putStrLn $ show (if maxPrimeFactor == 1 then n else maxPrimeFactor)
             else tryAgain
             where maxPrimeFactor = f n 1 2
         Nothing -> tryAgain
         where tryAgain = putStrLn "Please try again." >> main

