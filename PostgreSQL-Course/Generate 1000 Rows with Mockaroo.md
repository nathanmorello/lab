2026-02-19-15:32
# Keywords
- PostgreSQL
# Links
[[PostgreSQL Courses]]
prima [[insert into table]]
dopo [[SELECT FROM - ORDER BY - DISTINCT]]
### External links
[Mockaroo](https://www.mockaroo.com/)

---------------
![[Pasted image 20260219153923.png]]


Mockaroo è un sito che ti permette di creare righe e colonne con dati dummies generati automaticamente nel formato preferito.

il pulsante preview ti permette di genereare un elenco in SQL che puoi copiare e editare in un file locale:

```
create table person (  
       id BIGSERIAL NOT NULL PRIMARY KEY,  
       first_name VARCHAR(50) NOT NULL,  
       last_name VARCHAR(50) NOT NULL,,  
       gender VARCHAR(10) NOT NULL,,  
       date_of_birth DATE NOT NULL,,  
       email VARCHAR(50),  
       country_of_birth VARCHAR(50) NOT NULL);  
insert into person (first_name, last_name, gender, date_of_birth, email, country_of  
_birth) values ('Noah', 'Gauthorpp', 'Male', '2025-10-02', null, 'Russia');  
insert into person (first_name, last_name, gender, date_of_birth, email, country_of  
_birth) values ('Jorry', 'Janway', 'Female', '2025-04-21', 'jjanway1@shareasale.com  
', 'Russia');  
insert into person (first_name, last_name, gender, date_of_birth, email, country_of  
_birth) values ('Nicolette', 'Murrell', 'Female', '2025-03-20', 'nmurrell2@newyorke  
r.com', 'China');  
insert into person (first_name, last_name, gender, date_of_birth, email, country_of  
_birth) values ('Albina', 'Cops', 'Female', '2025-11-17', 'acops3@clickbank.net', '  
Chad');  
insert into person (first_name, last_name, gender, date_of_birth, email, country_of  
_birth) values ('Kiley', 'Oliffe', 'Male', '2025-08-30', 'koliffe4@biblegateway.com  
', 'Indonesia');

(...)
```

Infine il comando `\i` in postgres ti permette di usare quel file come input per la creazione della tabella

