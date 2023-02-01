# Peano database

This database provides the necessary predicates in order to do some basic arithmetic with Peano numbers in Prolog. It uses important techniques such as tail-recursion, accumulator-passing, wrapper predicates, and the use of the is/2 predicate, and so may serve as a good example when studying these techniques in a course on Logic Programming. Obviously, this is just meant as a theoretical exercise, and certainly not as a practical way to do arithmetic in Prolog.

## 🔹 Example queries for the Peano database

🔸 *query: what is the decimal representation of s(s(0)) ?*

```prolog
?- dec(s(s(0)),Dec).
Dec = 2.
```

🔸 *query: what is s(s(s(s(s(0))))) minus s(s(0)) ?*

```prolog
?- subtract(s(s(s(s(s(0))))),s(s(0)),Diff).  
Diff = s(s(s(0))).
```

🔸 *query: what is the Peano representation of the integer 3?*  

```prolog
?- peano(3,Peano).
Peano = s(s(s(0))).
```

🔸 *query: is s(s(s(0))) a Peano number?*  

```prolog
?- p(s(s(s(0)))).
true.
```

🔸 *query: what is s(s(0)) to the power s(s(s(0))) ?*  

```prolog
?- power(s(s(0)), s(s(s(0))), Power).
Power = s(s(s(s(s(s(s(s(0)))))))).
```

🔸 *query: what is 12 divided by 3 in peano notation ?*  

```prolog
?-  peano(12,X),peano(3,Y),divide(X,Y,Quotient).
X = s(s(s(s(s(s(s(s(s(s(s(s(0)))))))))))),
Y = s(s(s(0))),
Quotient = s(s(s(s(0)))) .
```

🔸 *query: what is the sum of s(s(s(s(s(0))))) and s(s(s(0))), in peano and in decimal notation ?*  

```prolog
?- add(s(s(s(s(s(0))))),s(s(s(0))),Sum),dec(Sum,Decim). 
Sum = s(s(s(s(s(s(s(s(0)))))))),
Decim = 8.
```

🔸 *query: what is s(0) minus s(s(0)) ?*  

```prolog
?- subtract(s(0),s(s(0)),Diff).
false. % undefined, peano numbers are non-negative
```

🔸 *query: what is the remainder of s(s(s(s(s(s(s(s(0)))))))) divided by s(s(s(0))) ?*

```prolog
?- mod(s(s(s(s(s(s(s(s(0)))))))),s(s(s(0))),Remainder).
Remainder = s(s(0)).
```

🔸 *query: is s(s(s(s(s(0))))) even ?*  

```prolog
?- even(s(s(s(s(s(0)))))).
false.
```

## 🔹 Usage

- Start the Prolog interpreter in the directory where the database is located:  ```swipl```

- Load the database into the Prolog interpreter:  
  ```?- [peano].```      
  or:      
  ```?- consult(peano).```
- To get the full, unabbreviated answer to a query:  hit key   `w`  after the query has been answered.
