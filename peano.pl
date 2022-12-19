/*
    ┌─────────────────────────────────────────────────────────────────┐
    │  File name: peano.pl                                            │
    │  Author: David De Potter, pl3onasm@gmail.com                    │
    │  License: refer to the license file in this repository          │
    │  Description: Peano arithmetic in Prolog                        │
    │  Note: predicates are tail-recursive when applicable so as to   │
    │        keep the stack size to a minimum and enhance efficiency  │
    └─────────────────────────────────────────────────────────────────┘
*/

/* Takes two Peano numbers x,y and computes their sum x+y
   Formula: (x+1) + y = (s+1)  if  x + y = s 		
*/
add(0,Y,Y).  % base case: y + 0 = y

add(s(X),Y,s(Sum)) :- add(X,Y,Sum). 

/* Takes two Peano numbers x,y and computes their product x*y
   The key idea is that multiplication is just repeated addition
   Formula: (x+1)*y = p  if  y + x*y = p 		
*/
multiply(0,_,Product,Product). % Base case: the resulting product is the accumulated sum  

multiply(s(X),Y,Acc,Product) :- 
  add(Y,Acc,Sum), 
  multiply(X,Y,Sum,Product).

multiply(X,Y,Product) :- multiply(X,Y,0,Product). % wrapper

/* Takes two Peano numbers x,y and computes the difference x-y
   Note that the result must be a Peano number, otherwise it is undefined.
   Formula: (x+1) - (y+1) = d  if  x - y = d 		
*/
subtract(X,0,X). % base case: the subtrahend equals zero

subtract(s(X),s(Y),Difference) :- subtract(X,Y,Difference).

/* Takes two Peano numbers x,y and computes x div y
   The key idea is that division is just repeated subtraction
   Note that this is integer division, so the result is 
   rounded down to the nearest integer and the remainder is discarded.
   Also, the predicate fails if the divisor is zero.
   Formula: x div y = q  if  x - y*q = r  where r < y
*/
divide(_,0,_) :- fail.    % division by zero is undefined	

divide(X,Y,0) :- less_than(X,Y).  % base case: the dividend is less than the divisor

divide(X,Y,s(Quotient)) :- 
  subtract(X,Y,Difference), 
  divide(Difference,Y,Quotient).

/* Takes two Peano numbers x,y and computes the exponentiation x^y 
   The key idea is that exponentiation is just repeated multiplication
   Formula: x^(y+1) = z  if  x * (x^y) = z			
*/
power(_,0,Power,Power).  % Base case: the resulting power is the accumulated product

power(X,s(Y),Acc,Power) :- 
  multiply(X,Acc,Product), 
  power(X,Y,Product,Power).

power(X,Y,Power) :- power(X,Y,s(0),Power).  % wrapper

/* Takes two Peano numbers x,y and computes the remainder, x mod y
   This is the remainder after integer division
   So x = y*q + r where r < y
   We can use the divide predicate and only change the base case
*/  
mod(_,0,_) :- fail.  % division by zero is undefined

mod(X,Y,X) :- less_than(X,Y).  % base case: the dividend is less than the divisor

mod(X,Y,Rem) :- 
  subtract(X,Y,Difference), 
  mod(Difference,Y,Rem).

/* Takes a peano number x and determines if x is even
   Formula: x is even  if  x mod 2 = 0
*/

even(X) :- mod(X,s(s(0)),0).

/* Takes a peano number x and determines if x is odd
   Formula: x is odd  if  x mod 2 = 1
*/

odd(X) :- mod(X,s(s(0)),s(0)).

/* Takes two Peano numbers x,y and determines if x<y
   Formula: (x+1) < (y+1)  if  x < y 				
*/
less_than(0,s(_)).

less_than(s(X),s(Y)) :- less_than(X,Y).

/* Takes two Peano numbers x,y and determines if x>y
   Formula: (x+1) > (y+1)  if  x > y 				
*/
greater_than(s(_),0).

greater_than(s(X),s(Y)) :- greater_than(X,Y).

/* Takes two Peano numbers x,y and determines if x=y
   Formula: (x+1) = (y+1)  if  x = y 				
*/
equals(X,X).

/* Converts a Peano number into its decimal representation */
dec(0,Dec,Dec).   % Base case: the resulting decimal is the accumulated sum

dec(s(X),N,Dec) :- New is 1+N, dec(X,New,Dec). 

dec(X,Dec) :- p(X), dec(X,0,Dec).  % wrapper

/* Converts a non-negative integer into a Peano number */
peano(0,0) :- !.

peano(Int,s(X)) :- 
  number(Int), Int > 0, 
  New is Int-1, 
  peano(New,X).

/* Defines a Peano number */
p(0).              % 0 is a Peano number

p(s(X)) :- p(X).   % the successor of X is a Peano number if X is one



