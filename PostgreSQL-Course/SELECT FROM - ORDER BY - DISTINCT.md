2026-02-19-16:25
# Keywords
- PostgreSQL
# Links
[[PostgreSQL Courses]]
prima [[insert into table]] and  [[Generate 1000 Rows with Mockaroo]]
dopo [[WHERE clause and AND and OR]]

---------------
# SELECT FROM

- #### SELECT * FROM nomeTabella;
	- Restituisce tutti i valori contenuti nella tabella
- #### SELECT FROM nomeTabella;
	- Si ottiene uan tabella vuota con impresso il numero totale delle sue righe
- #### SELECT nome_colonna FROM nomeTabella;
	- Si ottengono tutti i valori di quella colonna
- #### SELECT nome_colonna, nome_altra_colonna FROM nomeTabella;
	- Si ottengono tutti i valori di quelle due colonna

Quando si seleziona una colonna vengono restituiti i valori in quella colonna e il numero delle righe totali (comprese le righe vuote).

# ORDER BY

- #### SELECT * FROM person ORDER BY country_of_birth ASC;
	- ascendente (default)
- #### SELECT * FROM person ORDER BY country_of_birth DESC;
	- discendente

> In caso di una colonna con elementi mancanti i campi vuoti vengono _dopo_ quelli pieni (perciò con DESC vengono per primi) 

# DISTINCT
Distinct fa la stessa cosa che fa uniq in bash: restituisce un valore per ciascun valore ripetuto. E l'output dà io numero di righe senza ripetizioni.