2026-02-18-22:00
# Keywords
- PostgreSQL
- Database
# Links
[[PostgreSQL Courses]]
prima [[create table]]
dopo [[Generate 1000 Rows with Mockaroo]] 

---------------


![[Pasted image 20260218220221.png]]

first insert
```
INSERT INTO person (
	first_name,
	last_name,
	gender,
	date_of_birth)
VALUES ('Anne', 'Smith', 'FEMALE', DATE '1988-01-09');
```

second insert
```
INSERT INTO person (
	first_name,
	last_name,
	gender,
	date_of_birth,
	email)
VALUES ('Jake', 'Jones', 'MALE', DATE '1990-01-10', 'jake@gmail.com');
```

la stessa sintassi si può farre su una riga:

```
test=# INSERT INTO person (first_name, last_name, gender, date_of_birth, email)  
test-# VALUES ('Bob', 'Dylan', 'MALE', '1943-05-24', 'bob.dylan@gmail.com');
```

```
test=# SELECT * FROM person;  
id | first_name |   last_name   | gender | date_of_birth |        email           
----+------------+---------------+--------+---------------+---------------------  
 1 | Anne       | Smith         | FEMALE | 1988-01-09    |    
 2 | Jake       | Jones         | MALE   | 1990-01-10    | jake@gmail.com  
 3 | Bob        | Dylan         | MALE   | 1943-05-24    | bob.dylan@gmail.com  
 4 | Rita       | Laspagnoletta | FEMALE | 1979-06-04    | rita@gmail.com  
(4 rows)
```
### NB il `BIGSERIAL` cresce automaticamente
(vedi [[create table]])

Vedi ora come [[Generate 1000 Rows with Mockaroo]] 

Comandi per conoscere il numero delle righe e delle colonne di una tabelle (es. "clienti")

```
SELECT
    (SELECT COUNT(*) FROM clienti) AS numero_righe,
    (SELECT COUNT(*) FROM information_schema.columns WHERE table_name = 'clienti') AS numero_colonne;

```


Con il comando 
```
SELECT FROM nomeTabella;
```

si ottiene anche il numero di righe della tabella