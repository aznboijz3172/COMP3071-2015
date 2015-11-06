
-- Let's play war

data Suit = Spades | Hearts | Clubs | Diamonds deriving (Show, Eq)

-- Implement our own interface, making sure all suits are the same
instance Ord Suit where
	x <= y = False
	
data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace deriving (Show, Eq, Ord)

data Card = Card {
	rank :: Rank,
	suit :: Suit
	} deriving (Show, Eq, Ord)

-- Card Ace Spades
data Node a = Tree (Node a) (Node a) | Leaf a deriving(Show)

-- Tree (Tree ( Leaf "hi") (Leaf "world")) (Leaf "bye")