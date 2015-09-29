
--main = do
--    name <- getLine
--    putStr ("Hello, " ++ name ++ "! How are you?\n")

-- This is a comment
-- This is using a fold (aka a reduce)
-- sum x = foldl (+) 0 x
-- summation x = foldl (\y z -> y + z) 0 x

-- Implement average
-- average :: [numbers] -> number
average x = (sum x) / (fromIntegral (length x))

-- Implement min (least element)
-- minimum :: [comparable things] -> one thing (the minimum, hence the name)
-- minimum x = foldl1 min x

-- Implement max (maximum element)
-- maximum :: [comparable things] -> one thing (the minimum, hence the name)
-- maximum x = foldl1 max x

