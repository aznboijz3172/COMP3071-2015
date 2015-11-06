import Control.Monad

-- add :: Maybe Int -> Maybe Int -> Maybe Int
-- add mx my =
  -- case mx of  -- like switch (mx) {
    -- Nothing -> Nothing -- case Nothing: return Nothing
    -- Just x  -> case my of -- case Just x: switch (my) {
                 -- Nothing -> Nothing -- case Nothing: return Nothing
                 -- Just y  -> Just (x + y) -- this is ridiculous!!!


-- add :: Maybe Int -> Maybe Int -> Maybe Int
-- add mx my =             -- Adds two values of type (Maybe Int), where each input value can be Nothing
  -- mx >>= (\x ->         -- Extracts value x if mx is not Nothing
    -- my >>= (\y ->       -- Extracts value y if my is not Nothing
      -- return (x + y)))  -- Wraps value (x+y), returning the sum as a value of type (Maybe Int)

-- add :: Maybe Int -> Maybe Int -> Maybe Int
-- add mx my = do
  -- x <- mx
  -- y <- my
  -- return (x + y)

add :: Maybe Int -> Maybe Int -> Maybe Int
add = liftM2 (+)
