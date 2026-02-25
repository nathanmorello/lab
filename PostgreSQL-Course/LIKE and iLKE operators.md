2026-02-20-10:13
# Keywords
- PostgreSQL
# Links
[[PostgreSQL Courses]]
prima [[IN and BETWEEN]]
dopo [[Group By in PostgreSQL]]

---------------

# LIKE
LIKE svolge le funzioni di grep con wildcards. Le wildcards sono specifiche di sql.

#### % = * any character

```
test=# SELECT * FROM person  
WHERE email  
LIKE '%dropbox.com';  
id  | first_name | last_name  |   gender   | date_of_birth |           email           | country_of_birth    
-----+------------+------------+------------+---------------+---------------------------+------------------  
190 | Donica     | Brushfield | Non-binary | 2000-11-20    | dbrushfield13@dropbox.com | Brazil  
(1 row)

test=# SELECT * FROM person  
WHERE last_name  
LIKE '%llo';  
id  | first_name | last_name | gender | date_of_birth |         email         | country_of_birth    
-----+------------+-----------+--------+---------------+-----------------------+------------------  
629 | Dareen     | Pattullo  | Female | 2014-09-18    | dpattulloda@weibo.com | Tunisia  
(1 row)
```

### _ _ _ _ Underscore = number of characters
```
test=# SELECT * FROM person  
WHERE email  
LIKE '_ _ _ _ _ _@%';  
 id  | first_name | last_name | gender | date_of_birth |         email          | country_of_birth    
------+------------+-----------+--------+---------------+------------------------+------------------  
   4 | Albina     | Cops      | Female | 2025-11-17    | acops3@clickbank.net   | Chad  
  13 | Othilia    | Luff      | Female | 2025-07-26    | oluffc@4shared.com     | China  
  17 | Inglebert  | Murt      | Male   | 2026-01-20    | imurtg@nydailynews.com | Croatia
```


### ILIKE è come LIKE ma Ignore case

#### LIKE
```
test=# SELECT * FROM person  
WHERE country_of_birth  
LIKE 'p%';  
id | first_name | last_name | gender | date_of_birth | email | country_of_birth    
----+------------+-----------+--------+---------------+-------+------------------  
(0 rows)  
```
#### ILIKE
```
test=# SELECT * FROM person  
WHERE country_of_birth  
ILIKE 'p%';  
test=# SELECT * FROM person  
WHERE country_of_birth  
ILIKE 'p%' LIMIT 5;  
id | first_name | last_name |  gender  | date_of_birth |          email           | country_of_birth    
----+------------+-----------+----------+---------------+--------------------------+------------------  
23 | Danya      | Orteaux   | Male     | 2025-04-29    | dorteauxm@g.co           | Philippines  
28 | Claiborn   | Stormouth | Male     | 2025-08-21    | cstormouthr@gravatar.com | Philippines  
45 | Hulda      | Zini      | Female   | 2025-07-30    | hzini18@shutterfly.com   | Pakistan  
46 | Brianne    | Tonner    | Female   | 2025-10-23    |                          | Poland  
48 | Allsun     | Lazer     | Bigender | 2026-02-12    |                          | Poland  
(5 rows)
```

