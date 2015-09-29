example x = foo * 2 + 32 * doopydo
    where -- define local constants
        foo = 42
        doopydo = 2

another_example x =
    let
        something = 2
    in
        something * 21

-- foo :: [[Char]], akin to String[] in Java
-- foo = ["hello","cruel","world"]
-- this is like foo[2] in Java
-- foo !! 2 == "world"
