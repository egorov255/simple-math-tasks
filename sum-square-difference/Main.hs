import Data.List

main = let range = [1..100] in putStrLn $ show $ sum [ x*y | x <- range, y <- range, x /= y ]
