import System.Environment

-- do a dance to take the first CLI arg, read the file at that path, and pass
-- the contents to whatInstruction
main = do
  args <- getArgs
  let inputfilename = head args
  contents <- readFile inputfilename
  let result = whatInstruction (-1) contents 
  print result

-- What floor do we end up on if we start at floor 0?
whatFloor :: String -> Int
whatFloor [] = 0
whatFloor (x:xs) = direction x + whatFloor xs
-- or
-- whatFloor instructions = foldl (+) 0 directions
--   where directions = map direction instructions

-- '(' means go up one floor and ')' means go down one
direction :: Char -> Int
direction '(' = 1
direction ')' = -1

-- Given instructions, return a list of what floor we end up on after each
-- individual move. 
-- The list starts with 0 to signal that we are on floor 0 before applying any
-- moves.
floors :: String -> [Int]
floors insts = scanl (+) 0 moves
  where moves = map direction insts

-- returns what instruction causes santa to enter the given floor
whatInstruction :: Int -> String -> Int
whatInstruction floor insts = length $ takeWhile (/= floor) (floors insts)
