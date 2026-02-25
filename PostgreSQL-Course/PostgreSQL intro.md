2026-02-18-16:24
# Keywords
- PostgreSQL
# Links
Content of Course at [[Amigoscode PostgreSQL Course]]

---------------

# SQL= Srtuctured Query Language

SQL è un linguaggio di programmazione che permette di gestire database relazionali

`SELECT first_name FROM person`

- easy to learn
- very powerful
- 1974
- Widely used over the internet

Data is stored in tables
- columns
- rows

### Relational database  

| id  | first_name | last_name | gender | age | car_id  | person |
| --- | ---------- | --------- | ------ | --- | ------- | ------ |
| 1   | Anne       | Smith     | f      | 44  |         |        |
| 2   | Jake       | Jones     | m      | 21  | **24**  |        |
| 3   | Bob        | Rudd      | m      | 13  |         |        |
| 4   | Laura      | Sinn      | f      | 54  | **221** |        |

| id      | first_name | last_name | gender | age | car |
| ------- | ---------- | --------- | ------ | --- | --- |
| **24**  | Jake       | Jones     | m      | 21  |     |
| **221** | Laura      | Sinn      | f      | 54  |     |


# Install

```
apt install postgresql
```
