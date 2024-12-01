import Data.List
import qualified Data.Map as Map
import Data.Map (findWithDefault)

countFrequency :: (Ord a) => [a] -> Map.Map a Int
countFrequency = foldl (\frequencyMap fm -> Map.insertWith (+) fm 1 frequencyMap) Map.empty

main :: IO ()
main = do
    input <- readFile "01.txt"
    let (listOne, listTwo) = unzip $ map ((\[x, y] -> (read x, read y)) . words) (lines input)
        frequencyMap = countFrequency listTwo
        similarityScore = sum $ map (\x -> x * findWithDefault 0 x frequencyMap) listOne
    print similarityScore