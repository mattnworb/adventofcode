import System.Environment

main = do
  args <- getArgs
  let inputfilename = head args
  contents <- readFile inputfilename
  let result = whatInstruction (-1) contents 
  print result

whatFloor :: String -> Int
whatFloor [] = 0
whatFloor (x:xs) = direction x + whatFloor xs
-- or
-- whatFloor instructions = foldl (+) 0 directions
--   where directions = map direction instructions

direction :: Char -> Int
direction '(' = 1
direction ')' = -1

floors insts = scanl (+) 0 moves
  where moves = map direction insts

-- returns what instruction causes santa to enter the given floor
whatInstruction :: Int -> String -> Int
whatInstruction floor insts = length $ takeWhile (/= floor) (floors insts)
