-- Putting it all together: Tic Tac Toe
-- cabal update
-- cabal install gloss
-- ghc tictactoe.hs
-- tictactoe.exe

module Model (Cell (Blank, X, O), Game (Game), initialBoard, validMove, initialGame, rows,
diagonals, winner, win, switch, takeTurn, gameOver, outcome ) where

import qualified Data.Map as Map
import Data.List

-- A tic-tac-toe cell is either blank, X, or O
data Cell = Blank | X | O deriving (Eq, Ord)

-- To encode game state: 
-- we have the board (a map from a pair of ints to a Cell)
-- and the current "player" (either X or O)
data Game = Game {
    board :: Map.Map (Int, Int) Cell,
    player :: Cell
}

-- Initially, the board is a 3x3 grid of blank cells
initialBoard = Map.fromList [((i,j), Blank) | i <- [0..2], j <- [0..2]]

-- Given a game board, and two coordinates, is the move legit?
validMove :: Map.Map (Int, Int) Cell -> Int -> Int -> Bool
validMove board i j
    | i < 0 || i >= 3 || j < 0 || j >= 3 = False
    | otherwise = Blank == board Map.! (i,j)

{-
validMove board i j = 
    if i < 0 || i >= 3 || j < 0 || j >= 3 then False
    else Blank == board Map.! (i,j)
-}

-- X starts the game
initialGame = Game initialBoard X

-- List the rows in the game board
rows :: Map.Map (Int, Int) Cell -> [[Cell]]
rows board = map (map snd) $ groupBy (\((i,j),_) ((k,l),_) -> i == k) $ Map.assocs board

-- List the diagonals in the game board
diagonals :: Map.Map (Int, Int) Cell -> [[Cell]]
diagonals board = [[board Map.! (0,0), board Map.! (1,1), board Map.! (2,2)],
    [board Map.! (2,0), board Map.! (1,1), board Map.! (0,2)]]


-- Players switch when taking turns
switch :: Cell -> Cell
switch O = X
switch X = O

-- Given a game board, and a move, get the new game board state
takeTurn :: Game -> (Int, Int) -> Game
takeTurn game@Game { board=b, player=p } (i, j)
    | validMove b i j = newGame
    | otherwise = game
 where
     newGame = Game {
         board = Map.adjust (\_ -> p) (i,j) b, -- board[(i,j}] = p (it doesn't change the map, it replaces it)
         player = switch p
    }

-- Did anybody win?
winner :: Map.Map (Int, Int) Cell -> Bool
winner board = any win slices
 where
    slices = ((rows board) ++ (diagonals board) ++ (transpose $ rows board))

-- Given a slice (row, column, diagonal), are they all the same?
win slice = foldl1 (\x y -> if x == y then x else Blank) slice /= Blank

-- is the game over? either somebody won, or there's no blanks left
gameOver :: Map.Map (Int, Int) Cell -> Bool
gameOver board = winner board  || (not $ any (== Blank) $ Map.elems board)

-- So, who won, if anybody?
outcome (Game board player)
    | winner board = switch player
    | otherwise = Blank
