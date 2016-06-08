import Data.List

type Pair = (Int, Int)

readMaybe :: Read a => String -> Maybe a
readMaybe s = case reads s of
                  [(val, "")] -> Just val
                  _           -> Nothing

f :: Pair -> Maybe (Int, Pair)
f pair = Just (previous, (previous, current))
    where previous = snd pair
          current = uncurry (+) pair

main = do
    putStrLn "Enter the number of results (1 to 100) to show:"

    line <- getLine

    let maybeInt = readMaybe line :: Maybe Int

    case maybeInt of
         Just n  -> if n > 1 && n <= 100
             then putStrLn $ show $ take n $ filter even $ unfoldr f (0, 1)
             else putStrLn "Please try again." >> main -- todo DRY
         Nothing -> putStrLn "Please try again." >> main
