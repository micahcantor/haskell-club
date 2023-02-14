module List where

data List a = Empty | Cons a (List a)
  deriving (Eq, Show)

first :: List a -> Maybe a
first list = case list of
    Cons x _ -> Just x
    Empty -> Nothing

{- Play around with some more list definitions here! Try writing `map`, `filter` and `fold`! -}