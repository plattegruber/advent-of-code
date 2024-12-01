import Data.List


main :: IO ()
main = do
    input <- readFile "01.txt"
    let (listOne, listTwo) = unzip $ map ((\[x, y] -> (read x, read y)) . words) (lines input)
        sortedOne = sort listOne
        sortedTwo = sort listTwo
        totalDistance = sum $ zipWith (\x y -> abs(x - y)) sortedOne sortedTwo
    print totalDistance