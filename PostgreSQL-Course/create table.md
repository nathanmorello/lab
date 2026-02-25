2026-02-18-21:33
# Keywords
- PostgreSQL
- Table
# Links
Content of Course at [[Amigoscode PostgreSQL Course]]

prima [[PostgreSQL First Steps]]
dopo [[insert into table]]
### External links
[psql docs data type](https://www.postgresql.org/docs/16/datatype.html)

---------------


# Create a Table without Constraints

```
CREATE TABLE table_name (
	Column name + data type + constraints if any
);
```

```
CREATE TABLE person (
	id int,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	gender VARCHAR(6),
	date_of_birth DATE );
```

show table
```
test=# \d  
        List of relations  
Schema |  Name  | Type  |  Owner      
--------+--------+-------+----------  
public | person | table | postgres
```

il comando `\t nomeTabella` restituisce le caratteristiche configurate della tabella

```
test=# \d person  
                        Table "public.person"  
   Column     |         Type          | Collation | Nullable | Default    
---------------+-----------------------+-----------+----------+---------  
id            | integer               |           |          |    
first_name    | character varying(50) |           |          |    
last_name     | character varying(50) |           |          |    
gender        | character varying(7)  |           |          |    
date_of_birth | date                  |           |          |
```

# Create a Table with Constraints

Una tabella con vincoli assicura che un dato non possa essere inserito se non rispetta alcune caratteristiche definite nella tabella stessa.

```
	CREATE TABLE person (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR(6) NOT NULL,
	date_of_birth DATE NOT NULL,
	email VARCHAR(150) );
```

output
```
test=# \d  
             List of relations  
Schema |     Name      |   Type   |  Owner      
--------+---------------+----------+----------  
public | person        | table    | postgres  
public | person_id_seq | sequence | postgres  
(2 rows)
```

```
test=# \d person  
                                      Table "public.person"  
   Column     |          Type          | Collation | Nullable |              Default                  
---------------+------------------------+-----------+----------+------------------------------------  
id            | bigint                 |           | not null | nextval('person_id_seq'::regclass)  
first_name    | character varying(50)  |           | not null |    
last_name     | character varying(50)  |           | not null |    
gender        | character varying(6)   |           | not null |    
date_of_birth | date                   |           | not null |    
email         | character varying(150) |           |          |    
Indexes:  
   "person_pkey" PRIMARY KEY, btree (id)
```