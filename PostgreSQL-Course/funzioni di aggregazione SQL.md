2026-02-20-11:42
# Keywords
- 
# Links
[[Group By in PostgreSQL]]
[Funzioni di aggregazione in SQL](https://www.youtube.com/watch?v=AnX-RNg5jzY)

---------------


Le funzioni di aggregazioni sono una serie di funzioni predefinite in SQL per esegure calcoli su insimi di dati, ad esempio:
- COUNT(): congteggi
- SUM(): funzioni
- AVG(): medie
- MIN() e MAX(): valori minimi e massimi

## COUNT()
Count permette di conteggiare il numero di righe in un insieme di dati su una colonna o un insieme di colonne:
```
test=# select count(first_name) from person;  
count    
-------  
 1150  
(1 row)  
  
test=# select count(email) from person;  
count    
-------  
  895  
(1 row)
```

- Il confronto mostra come i valori nulli siano esclusi dal conteggio.
- È possibile dare un nome al risultato con il comando AS

```
test=# select count(email) AS EmailCount from person;  
emailcount    
------------  
       895  
(1 row)
```
- è possibile usare DISTINCT all'interno della funzione count per evitare i valori doppi
##### COUNT(country_of_birth) vs COUNT(DISTINCT country_of_birth)
```
test=# select count(country_of_birth) from person;  
count    
-------  
 1150  
(1 row)  
  
test=# select count(distinct country_of_birth) from person;  
count    
-------  
  132  
(1 row)
```

## SUM()
Sommare numeri da una colonna di una tabella.
Ad esempio, per la tabella "animals"
```
test=# select * from animals limit 5;  
id |              animal              |   color    | quantity |  country     
----+----------------------------------+------------+----------+-----------  
 1 | Tortoise, burmese brown mountain | Green      |       66 | Cameroon  
 2 | Thomson's gazelle                | Aquamarine |       87 | China  
 3 | Squirrel, malabar                | Crimson    |       20 | China  
 4 | Vine snake (unidentified)        | Teal       |       88 | Albania  
 5 | Jacana, african                  | Maroon     |       62 | Indonesia  
(5 rows)
```

posso sommare i valori della colonna "quantity" con
SELECT SUM(quantity) FROM animals;
```
test=# select sum(quantity) from animals;  
 sum     
-------  
50472  
(1 row)

o

test=# select sum(quantity) as totalAnimals from animals;  
totalanimals    
--------------  
       50472  
(1 row)
```

## SUM(), MIN(), MAX(), AVG()
Esempi di uso di funzioni aggreganti con filtro
Somma, numero minimo/massimo e media delle quantità di animali presenti nella tabella animals, paese Bangladesh
```
test=# select * from animals where country = 'Bangladesh';  
id  |       animal       | color  | quantity |  country      
-----+--------------------+--------+----------+------------  
828 | Bear, grizzly      | Blue   |       77 | Bangladesh  
898 | Ant (unidentified) | Violet |       80 | Bangladesh  
977 | Buttermilk snake   | Yellow |       40 | Bangladesh

test=# select sum(quantity) from animals where country = 'Bangladesh';  
sum    
-----  
197  
(1 row)  
  
test=# select min(quantity) from animals where country = 'Bangladesh';  
min    
-----  
 40  
(1 row)  
  
test=# select max(quantity) from animals where country = 'Bangladesh';  
max    
-----  
 80  
(1 row)  
  
test=# select avg(quantity) from animals where country = 'Bangladesh';  
        avg            
---------------------  
65.6666666666666667  
(1 row)
```