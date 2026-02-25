2026-02-18-16:52
# Keywords
- PostgreSQL
# Links
Content of Course at [[Amigoscode PostgreSQL Course]]

prima [[PostgreSQL intro]]
dopo [[create table]]

---------------
## Get into PosgreSQL

```
psql
```

\q --> quit
help
- \h --> help with SQL commands
- \\? --> help with psql commands
- \g or terminate with colon --> execute query
- \q --> quit
- \l --> list of databases

### Create a new database

```
CREATE DATABASE name;
```

## Connect to database

```
psql -d databaseName

-h database server host
-p database server port
-U database user name
-w no password
-W force password prompt
```

```
\c databaseName
```

# A Very Dangerous Command

To delete a database you simply do 
```
DROP DATABASE databaseName;
```

## This is dangerous because it doesn't matter how big or old that database is, when you type the `DROP` command you lose it in a matter of seconds


