2026-02-20-14:16
# Keywords
- PostgreSQL
# Links
[[PostgreSQL Courses]]
prima [[Arithmetic Operators]]
dopo [[Coalesce]]

---------------
Le funzioni possono essere rinominate con alias

```
test=# select id, animal, color, quantity, country, ROUND(quantity * .10), ROUND(quantity - (quantity * .10)) fr  
om animals limit 5;  
id |              animal              |   color    | quantity |  country  | round | round    
----+----------------------------------+------------+----------+-----------+-------+-------  
 1 | Tortoise, burmese brown mountain | Green      |       66 | Cameroon  |     7 |    59  
 2 | Thomson's gazelle                | Aquamarine |       87 | China     |     9 |    78  
 3 | Squirrel, malabar                | Crimson    |       20 | China     |     2 |    18  
 4 | Vine snake (unidentified)        | Teal       |       88 | Albania   |     9 |    79  
 5 | Jacana, african                  | Maroon     |       62 | Indonesia |     6 |    56  
(5 rows)
```

### Con ALIAS
```
test=# select id, animal, color, quantity, country, ROUND(quantity * .10) AS ten_percent, ROUND(quantity - (quan  
tity * .10)) AS new_total from animals limit 5;  
id |              animal              |   color    | quantity |  country  | ten_percent | new_total    
----+----------------------------------+------------+----------+-----------+-------------+-----------  
 1 | Tortoise, burmese brown mountain | Green      |       66 | Cameroon  |           7 |        59  
 2 | Thomson's gazelle                | Aquamarine |       87 | China     |           9 |        78  
 3 | Squirrel, malabar                | Crimson    |       20 | China     |           2 |        18  
 4 | Vine snake (unidentified)        | Teal       |       88 | Albania   |           9 |        79  
 5 | Jacana, african                  | Maroon     |       62 | Indonesia |           6 |        56  
(5 rows)
```

### Gli ALIAS possono essere usati per sovrascrivere temporaneamente qualunque nome di colonna
