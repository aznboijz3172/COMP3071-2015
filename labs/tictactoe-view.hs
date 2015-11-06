import Model
-- import is just like Java, but you can give modules (akin to Java packages) their own local name
import qualified Graphics.Gloss.Interface.Pure.Game as Gloss
import qualified Graphics.Gloss.Data.Bitmap as Bitmap
import qualified Data.Map as Map

-- Translate mouse clicks (Gloss.Event) into turns
handleMouse :: Gloss.Event -> Game -> Game
handleMouse (Gloss.EventKey (Gloss.MouseButton Gloss.LeftButton) Gloss.Down _ (x, y)) game@(Game board player)
    | gameOver board = game
    | otherwise = takeTurn game (i, j)
 where i = round $ (y+160) / 160 -- translate pixel coordinates into grid coordinates
       j = round $ (x+240) / 160

-- don't care about the other events
handleMouse _ game = game

main = do
    oPicture <- Bitmap.loadBMP "O.bmp"
    xPicture <- Bitmap.loadBMP "X.bmp"
    _Picture <- Bitmap.loadBMP "_.bmp"
    xwin <- Bitmap.loadBMP "xwin.bmp"
    owin <- Bitmap.loadBMP "owin.bmp"
    tie <- Bitmap.loadBMP "tie.bmp"
    
    let cellPicture = Map.fromList [(O,oPicture), (X, xPicture), (Blank, _Picture)]
    let outcomePicture = Map.fromList [(O,owin), (X, xwin), (Blank, tie)]
    let displayCell (i,j) cell = Gloss.translate ((fromIntegral j :: Float)*160-240) ((fromIntegral i :: Float)*160-160) $ cellPicture Map.! cell
    let displayBoard (Game board _) = Gloss.Pictures $ Map.elems $ Map.mapWithKey displayCell board
    let displayOutcome game = Gloss.translate (230) (0) (outcomePicture Map.! (outcome game))
    let display game@(Game board player) = if gameOver board then Gloss.Pictures [displayOutcome game, displayBoard game] else displayBoard game

    Gloss.play
        (Gloss.InWindow "Tic-Tac-Toe" (640,480) (0,0))
        Gloss.black
        10
        initialGame
        display
        handleMouse
        (\f g -> g)
