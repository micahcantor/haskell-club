module BinaryTree where

-- the canonical definition of binary trees
data BinaryTree a
  = Empty
  | Node a (BinaryTree a) (BinaryTree a) 
  deriving (Eq, Show)

-- helper function to create a node with a single element
leaf :: a -> BinaryTree a
leaf x = Node x Empty Empty

-- apply a function to each element of a binary tree
treeMap :: (a -> b) -> BinaryTree a -> BinaryTree b
treeMap f tree = undefined -- TODO: complete this definition... is this a Functor (!)

-- add one to every element in a tree
addOneTree :: Num a => BinaryTree a -> BinaryTree a
addOneTree tree = treeMap (+ 1) tree

-- combine two binary trees into one
combine :: BinaryTree a -> BinaryTree a -> BinaryTree a
combine t1 t2 = undefined -- TODO: complete this definition

-- find the first element in a tree that is True for a given predicate
treeFind :: (a -> Bool) -> BinaryTree a -> Maybe a
treeFind f tree = undefined