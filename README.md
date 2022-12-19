# Peano database

This database provides the necessary predicates in order to do some basic arithmetic with Peano numbers in Prolog.


## 🔹 Example queries for the Peano database 

🔸 *query: what is the decimal representation of s(s(0)) ?*

```prolog
?- dec(s(s(0)),Dec).
Dec = 2.
```

🔸 *query: what is s(s(s(s(s(0))))) minus s(s(0)) ?*

```prolog
?- X=s(s(s(s(s(0))))),Y=s(s(0)),subtract(X,Y,Diff).  
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

🔸 *query: what is (s(s(s(s(s(s(s(0))))))) divided by s(s(s(0))) ?*  

```prolog
?- divide(s(s(s(s(s(s(s(0))))))),s(s(s(0))),Quotient).
Quotient = s(s(0)).
```

🔸 *query: what is the sum of s(s(s(s(s(0))))) and s(s(s(0))), in peano and in decimal notation ?*  

```prolog
?- add(s(s(s(s(s(0))))),s(s(s(0))),Sum),dec(Sum,Dec). 
Sum = s(s(s(s(s(s(s(s(0)))))))),
Dec = 8.
```

🔸 *query: what is s(0) minus s(s(0)) ?*  

```prolog
?- subtract(s(0),s(s(0)),Diff).
false. % undefined, peano numbers are non-negative
```

🔸 *query: what is the remainder of s(s(s(s(s(s(s(s(0)))))))) divided by s(s(s(0))) ?*

```prolog
?- mod(s(s(s(s(s(s(s(s(0)))))))),s(s(s(0))),Mod).
Mod = s(s(0)).
```

## 🔹 Usage

- To load the database:  
  ```?- [peano].```      
  or:      
  ```?- consult(peano).```
- To get the full, unabbreviated answer to a query:  hit key   `w`

