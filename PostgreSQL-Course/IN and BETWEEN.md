2026-02-20-09:25
# Keywords
- PostgreSQL
# Links
[[PostgreSQL Courses]]
prima [[LIMIT OFFSET FETCH]]
dopo [[LIKE and iLKE operators]]

---------------
# IN
Questa query:
### SELECT * FROM person WHERE country_of_birth = 'China' OR country_of_birth = 'Brazil' OR country_of_birth = 'France' ;

può essere realizzata in modo più produttivo con 

### SELECT * FROM person WHERE country_of_birth IN ('China', 'Brazil', 'France');

Questo sistema è anche più facile da implementare

# BETWEEN

### SELECT * FROM person WHERE date_of_birth BETWEEN DATE '2000-01-01' AND '2002-01-01';