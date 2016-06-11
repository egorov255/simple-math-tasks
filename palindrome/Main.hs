import Data.List

main = putStrLn $ if null palindromesList then "No palindromes" else show $ maximum palindromesList
    where palindromesList = filter ((\s -> s == reverse s) . show) [ x*y | x <- range, y <- range ]
          range = (\a b -> [a,(a - 1)..b]) 999 100
