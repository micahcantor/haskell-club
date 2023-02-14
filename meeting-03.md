# Meeting 3 Notes

Last time we began to discuss the concept of *algebraic data types* (ADT) in Haskell. In particular, we looked at an example of representing points in Haskell:

```hs
data Point 
  = Cartesian Float Float -- x, y
  | Polar Float Float     -- r, theta
  deriving (Show, Eq)
```

We declare a datatype called `Point` that has two *constructors*: `Cartesian` and `Polar`. Each constructor can contain data within it: here a cartesian point contains x and y coordinates while a polar point contains values for the radius and angle. 

With this representation, we can write functions that operate over the data type via *pattern matching*. One example is a `distance` function:

```hs
distance :: Point -> Point -> Float
distance p1 p2 = case (p1, p2) of
  (Cartesian x1 y1, Cartesian x2 y2) ->
      sqrt ((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
  (Polar r1 t1, Polar r2 t2) -> 
    sqrt (r1^2 + r2^2 - 2 * r1 * r2 * cos (t2 - t1))
  _ -> undefined
```

Here we define the distance between two cartesian points or two polar points. We could also define the distance between a polar and cartesian point by converting one representation to the other. I'll leave that as an exercise. 

For now we leave the two remaining patterns as `undefined` meaning this function throws a runtime error when it reaches that point of the code. In Haskell, we try to eliminate runtime exceptions whenever possible, so this would be bad style in a larger program. Functions like this that do not account for all possible input patterns are called *partial functions*.

## Lists

We looked at another ADT last time, one that represents lists. The definition looks like this:

```hs
data List a = Empty | Cons a (List a)
  deriving (Eq, Show)
```

So a list is defined recursively as either `Empty` or a `Cons` containing the first element and the rest of the list. This definition follows exactly how we worked with lists in Scheme. The importance of Haskell's list definition, however, is we can determine whether a function that operates on lists is partial, and thus would cause a runtime error when called incorrectly. 

For example, we looked at the definition of `first` in Haskell, which returns the first element of a list:

```hs
first :: List a -> a
first lst = case lst of
  Cons x _ -> x
  Empty -> error "empty list"
```

Again, this is a partial function, except its not one that we could ever write correctly without changing the type signature of `first`. There is simply nothing we could return in the case we are given an empty list. Because of that, a better type signature for `first` looks like this:

```hs
first :: List a -> Maybe a
first lst = case lst of
  Cons x _ -> Just x
  Empty -> Nothing
```

Here we are using another important ADT called `Maybe`. The `Maybe` data type is defined like this:

```hs
data Maybe a = Nothing | Just a
```

Similar to the definition of `List`, a value of type `Maybe` is either `Nothing` or present and wrapped in the `Just` constructor. The importance of this change is it allows us to understand how `first` works solely from its type signature. By returning a `Maybe` value, we are encoding the fact that the function could fail, and forcing the user of the function to deal with this failure.

In practice, say we wanted a function that takes the first element of a list and adds one to it. If the list is empty, we'll return zero. It looks like this:

```hs
firstPlusOne :: Num a => List a -> a
firstPlusOne lst = case first lst of
  Just x -> x + 1
  Nothing -> 0
```

Here we pattern match on the result of `first lst`. If it returns a value `Just x`, we unwrap that and add one to it. If it returns `Nothing`, we just return zero. 

Compare that to a similar function in Scheme:

```scm
(define (first-plus-one lst)
  (if (null? lst)
    0
    (+ 1 (car lst))))
```

At first glance, the two language's definitions seem basically equivalent, except there's an important difference. In the Scheme version, we check if the list is `null` before calling `car`. However, we could have just as easily forgotten to check that case and written the definition like this:

```scm
(define (first-plus-one lst)
  (+ 1 (car lst)))
```

The Scheme language does not force us to deal with the fact that `car` may fail, whereas with our Haskell definition of `first`, we do. This means Haskell programs can be made significantly safer and less likely to crash than equivalent programs in other languages, which is great for developer productivity. 