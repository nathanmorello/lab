2026-02-20-13:27
# Keywords
- PostgreSQL
# Links
[[PostgreSQL Courses]]
prima [[Group By in PostgreSQL]]
dopo [[ALIAS in PostgreSQL]]

---------------
### Operators
- + somma
- - sottrazione
- * moltiplicazione
* / divisione
* ^ potenza
* ! fattoriale
* % modulo

```
test=# SELECT 10 + 2;  
?column?    
----------  
      12  
(1 row)
```

## Arithmetic Round

Da questa tabella
```
test=# select * from animals limit 5;  
id |              animal              |   color    | quantity |  country     
----+----------------------------------+------------+----------+-----------  
 1 | Tortoise, burmese brown mountain | Green      |       66 | Cameroon  
 2 | Thomson's gazelle                | Aquamarine |       87 | China  
 3 | Squirrel, malabar                | Crimson    |       20 | China  
 4 | Vine snake (unidentified)        | Teal       |       88 | Albania  
 5 | Jacana, african                  | Maroon     |       62 | Indonesia
```

vogliamo creare una colonna che indichi il 10% di ciascun valore.
La semplice operazione matematica però non dà risultati realistici:
```
  
test=# select id, animal, color, quantity, country, quantity * .10 from animals limit 5;  
id |              animal              |   color    | quantity |  country  | ?column?    
----+----------------------------------+------------+----------+-----------+----------  
 1 | Tortoise, burmese brown mountain | Green      |       66 | Cameroon  |     6.60  
 2 | Thomson's gazelle                | Aquamarine |       87 | China     |     8.70  
 3 | Squirrel, malabar                | Crimson    |       20 | China     |     2.00  
 4 | Vine snake (unidentified)        | Teal       |       88 | Albania   |     8.80  
 5 | Jacana, african                  | Maroon     |       62 | Indonesia |     6.20  
(5 rows)
```
Con la funziona ROUND() possiamo arrotondare i risultati 
```
test=# select id, animal, color, quantity, country, ROUND(quantity * .10) from animals limit 5;  
id |              animal              |   color    | quantity |  country  | round    
----+----------------------------------+------------+----------+-----------+-------  
 1 | Tortoise, burmese brown mountain | Green      |       66 | Cameroon  |     7  
 2 | Thomson's gazelle                | Aquamarine |       87 | China     |     9  
 3 | Squirrel, malabar                | Crimson    |       20 | China     |     2  
 4 | Vine snake (unidentified)        | Teal       |       88 | Albania   |     9  
 5 | Jacana, african                  | Maroon     |       62 | Indonesia |     6  
(5 rows)
```