# Meeting 1: January 29

First, you should install Haskell on your laptop or on MathLAN by following the [instructions](./installing-haskell.md). Once that is installed, start a REPL with `ghci`. Let's now take a quick tour of Haskell and its syntax in the REPL.

Let's start with basic arithmetic:

```
ghci> 2 + 2
4
ghci> 4 - 2
2
```

We also have booleans and conditionals:

```
ghci> 5 == 5
True
ghci> 5 == 4
False
ghci> if 5 == 5 then "yes" else "no"
"yes"
```

Unlike in Scheme, the condition of an `if` expression can only be either `True` or `False`. There is no concept of "truthy" in Haskell. The following produces an error:

```
ghci> if "string" then True else False

<interactive>:8:4: error:
    • Couldn't match type ‘[Char]’ with ‘Bool’
      Expected: Bool
        Actual: String
    • In the expression: "string"
      In the expression: if "string" then True else False
```

This error message means that the Haskell type-checker expected a boolean but found a string instead.

Haskell has syntax for creating lists like in Scheme:

```
ghci> [1, 2, 3]
[1, 2, 3]
ghci> head [1, 2, 3]
1
ghci> tail [1, 2, 3]
[2, 3]
```

Elements of a list are enclosed in square brackets and separated by commas. There are many built-in functions that operate on lists, such as `head`, which returns the first element of a list, and `tail` which returns everything except the first element.

This also demonstrates the syntax for function application in Haskell, which is simply to separate the function and its argument with spaces. In Scheme, we wrapped function calls in a pair of parentheses `()`, and we can do that in Haskell too:

```
ghci> (head [1, 2, 3])
1
```

However, this is usually not necessary unless we are chaining function applications.

In fact, the arithmetic and equality operators we used earlier were also just ordinary functions. We can apply them like we would in Scheme like this:

```
ghci> (+) 1 2
3
ghci> (==) 4 4
True
```

When a function has exactly two arguments, it can be applied as an infix operator in Haskell.

We can also define our own fucntions in the REPL:

```
ghci> add1 x = x + 1
ghi> add1 5
6
```

Here you see the syntax for defining a function in Haskell which is just `name param1 ... = body`. Here the name of the function is `add1` and the only parameter is named `x`. 

Try playing around with creating your own functions, seeing what works and what doesn't. You can find all the functions in the standard library in [the documentation](https://hackage.haskell.org/package/base-4.17.0.0/docs/Prelude.html).