2026-02-20-09:06
# Keywords
- PostgreSQL
# Links
[[PostgreSQL Courses]]
prima [[WHERE clause and AND and OR]]
dopo [[LIMIT OFFSET FETCH]]

---------------


- comparison operators
- arithmetic operators
-  logic operators

#### Comparison Operators
- It allows logical operations in the program
	- = > < >= <= 
	- not is <>
- it gives a true/false result
- it is usable on different data types 
```
test=# select 1 = 1;  
?column?    
----------  
t    [<-------TRUE]
(1 row)

test=# select 'ciao' <> 'CIAO';  
?column?    
----------  
t  
(1 row)  
  
test=# select 'ciao' = 'CIAO';  
?column?    
----------  
f    [<-------FALSE]
(1 row)
```
