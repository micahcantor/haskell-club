# Meeting Outlines

## Meeting 1: Introduction and basics (Jan 29)

**Reading** (optional): Learn You A Haskell (free, online book) chapters 1-2

**Outline**:

    What is Haskell? (purely functional? statically typed? lazy?)
    Why Haskell? (what makes one language "better" than another?)
    Getting started (installing, editor support, etc)
    Basic syntax in ghci​

## Meeting 2: Types and typeclasses (Feb 5)

**Reading**: Learn You a Haskell chapters 2-3

**Outline**:

    Why use static typing? (safety, correctness, documentation)
    Basic types
    Polymorphic types (examples with [a]​ and (a, b))​
    Intro to Typeclasses (Eq​, Num​, Ord​, Show​, etc)

## Meeting 3: Algebraic data types and pattern matching (Feb 12)

**Reading**: Learn You a Haskell chapters 4-5

**Outline**:

    Algebraic Data Types (examples with lists, Maybe​, Either​, trees)
    Pattern matching
    Destructuring
    let​ and where​ expressions

## Meeting 4: Functional programming (Feb 19)

**Reading**: Learn You a Haskell chapter 6

**Outline**:

    Recursion (examples with lists, trees)
    Automatic currying and partial application
    Higher order functions
    Application with $​
    Lambdas

## Meeting 5: Laziness and custom data types (Feb 26)

**Reading**:

    Learn You a Haskell chapter 8
    Names are not type safety by Alexis King (optional/advanced)

**Outline**:

    Lazy evaluation (reasoning about efficiency, uses)
    Records (advantages, common language extensions)
    Custom polymorphic types
    Derived instances
    Type synonyms (type and newtype​)

## Meeting 6: Functors, applicative functors, and monoids (Mar 5)

**Reading**: Learn You a Haskell chapter 11

**Outline**:

    Functors (generalizing map​)
    Applicative Functors
    Monoids (generalizing append​)

## Meeting 7: Monads and data vs. computation (Mar 12)

**Reading**:

    Learn You a Haskell chapter 12
    Monad confusion and the blurry line between data and computation by me

**Outline**

    Computations as data types
    Sequencing computations (examples with State​ and IO​)
    The Monad typeclass
    Data monads (Monad instances for Maybe​ and [a])​
    do​ notation

## Advanced Topics

After spring break, we could cover select advanced topics or applications of Haskell to compilers. Topics and readings could include:

    Functional data structures/algorithms (Purely Functional Data Structures by Chris Okasaki)
    Type-driven design (Parse, don't validate by Alexis King)
    Parser combinators (Parser Combinators in Haskell by Serokell)
    Type-level programming (An Introduction to typeclass metaprogramming by Alexis King)
    Monad transformers and functional design patterns
    Production Haskell (cabal​, stack​, Text​, language extensions)
    Algebraic effect systems
    Tree-walking interpreters
    Type system implementation