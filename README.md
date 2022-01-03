# Peano database

This database provides the necessary predicates in order to do some basic arithmetic with Peano numbers in Prolog.


## 🔹 Example queries for the Peano database 

🔸 *query: what is the decimal representation of s(s(0)) ?*   
```
?- dec(s(s(0)),Dec).
Dec = 2.
```

🔸 *query: what is the difference of the two given Peano numbers?*  
```
?- subtract(s(s(s(s(s(0))))),s(s(0)),Diff).  
Diff = s(s(s(0))).
```

🔸 *query: what is the Peano representation of the integer 3?*  
```
?- peano(3,Peano).
Peano = s(s(s(0))).
```

🔸 *query: is the given argument s(s(s(0))) a Peano number?*  
```
?- p(s(s(s(0)))).
true.
```

🔸 *query: what is s(s(0)) to the power s(s(s(0))) ?*  
```
?- power(s(s(0)), s(s(s(0))), Power).
Power = s(s(s(s(s(s(s(s(0)))))))).
```

🔸 *query: what is s(s(s(s(0)))) divided by s(s(0)) ?*  
```
?- divide(s(s(s(s(0)))),s(s(0)),Quotient).
Quotient = s(s(0)).
``` 

🔸 *query: what is the sum of s(s(s(s(s(0))))) and s(0) ?*  
```
?- add(s(s(s(s(s(0))))),s(0),Sum).
Sum = s(s(s(s(s(s(0)))))).
``` 

🔸 *query: what is s(0) minus s(s(0)) ?*  
```
?- subtract(s(0),s(s(0)),Diff).
false. % undefined
``` 


## 🔹 Usage

- To load the database:  
  ```?- [peano].```      
  or:      
  ```?- consult(peano).```
- To get the full, unabbreviated answer to a query:  hit key   `w`

