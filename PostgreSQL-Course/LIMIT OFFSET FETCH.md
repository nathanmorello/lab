2026-02-20-09:17
# Keywords
- PostgreSQL
# Links
[[PostgreSQL Courses]]
prima [[Operators in PosgtreSQL]]
dopo [[IN and BETWEEN]]

---------------

# LIMIT
Letteralmente limita il numero di risultati 
#### SELECT * FROM person LIMIT 10;
```
test=# select * from person limit 10;  
id | first_name | last_name  | gender | date_of_birth |           email           | country_of_birth    
----+------------+------------+--------+---------------+---------------------------+------------------  
 1 | Noah       | Gauthorpp  | Male   | 2025-10-02    |                           | Russia  
 2 | Jorry      | Janway     | Female | 2025-04-21    | jjanway1@shareasale.com   | Russia  
 3 | Nicolette  | Murrell    | Female | 2025-03-20    | nmurrell2@newyorker.com   | China  
 4 | Albina     | Cops       | Female | 2025-11-17    | acops3@clickbank.net      | Chad  
 5 | Kiley      | Oliffe     | Male   | 2025-08-30    | koliffe4@biblegateway.com | Indonesia  
 6 | Marmaduke  | McBeith    | Male   | 2025-11-18    | mmcbeith5@walmart.com     | Czech Republic  
 7 | Kristoforo | Persehouse | Male   | 2025-09-21    |                           | Liberia  
 8 | Delano     | Shakle     | Male   | 2025-07-05    | dshakle7@sciencedaily.com | Indonesia  
 9 | Veronika   | Paprotny   | Female | 2025-07-19    | vpaprotny8@amazon.com     | Russia  
10 | Loydie     | Gerge      | Male   | 2025-07-21    | lgerge9@illinois.edu      | Russia
```
# OFFSET
Offset indica la riga da cui parte; limit sarà il numero di righe _a partire da_ offset

```
test=# select * from person offset 5 limit 5;  
id | first_name | last_name  | gender | date_of_birth |           email           | country_of_birth    
----+------------+------------+--------+---------------+---------------------------+------------------  
 6 | Marmaduke  | McBeith    | Male   | 2025-11-18    | mmcbeith5@walmart.com     | Czech Republic  
 7 | Kristoforo | Persehouse | Male   | 2025-09-21    |                           | Liberia  
 8 | Delano     | Shakle     | Male   | 2025-07-05    | dshakle7@sciencedaily.com | Indonesia  
 9 | Veronika   | Paprotny   | Female | 2025-07-19    | vpaprotny8@amazon.com     | Russia  
10 | Loydie     | Gerge      | Male   | 2025-07-21    | lgerge9@illinois.edu      | Russia  
(5 rows)
```

# FETCH
Fetch ha la stessa funzione di LIMIT, ma rappresenta lo standard ufficiale di SQL
```
test=# SELECT * FROM person OFFSET 5 FETCH FIRST 5 ROW ONLY;  
id | first_name | last_name  | gender | date_of_birth |           email           | country_of_birth    
----+------------+------------+--------+---------------+---------------------------+------------------  
 6 | Marmaduke  | McBeith    | Male   | 2025-11-18    | mmcbeith5@walmart.com     | Czech Republic  
 7 | Kristoforo | Persehouse | Male   | 2025-09-21    |                           | Liberia  
 8 | Delano     | Shakle     | Male   | 2025-07-05    | dshakle7@sciencedaily.com | Indonesia  
 9 | Veronika   | Paprotny   | Female | 2025-07-19    | vpaprotny8@amazon.com     | Russia  
10 | Loydie     | Gerge      | Male   | 2025-07-21    | lgerge9@illinois.edu      | Russia  
(5 rows)
```