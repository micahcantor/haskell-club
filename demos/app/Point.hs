module Point where

data Point 
  = Cartesian Float Float -- x, y
  | Polar Float Float     -- r, theta
  deriving (Show, Eq)

distance :: Point -> Point -> Float
distance p1 p2 = case (p1, p2) of
  (Cartesian x1 y1, Cartesian x2 y2) ->
    sqrt ((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
  (Polar r1 t1, Polar r2 t2) -> 
    sqrt (r1^2 + r2^2 - 2 * r1 * r2 * cos (t2 - t1))
  _ -> undefined -- TODO: complete this partial definition by covering the cases of Cartesian/Polar mixes