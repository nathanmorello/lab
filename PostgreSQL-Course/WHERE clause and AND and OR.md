2026-02-19-17:01
# Keywords
- PostgreSQL
# Links
[[PostgreSQL Courses]]
prima [[SELECT FROM - ORDER BY - DISTINCT]]
dopo [[Operators in PosgtreSQL]]

---------------


# WHERE Clause
La formula WHERE permette di filtrare i dati sulla base di **condizioni**.

- #### SELECT * FROM nomeTabella WHERE gender = 'FEMALE';
	- Restituisce i valori della tabella quando una colonna risponde a certi criteri
	- Restituisce il numero di righe corrispondenti

# AND and OR
Viene usato con WHERE per aggiungere condizioni di filtro
- #### SELECT * FROM nomeTabella WHERE gender = 'Female' AND country_of_birth = 'Poland' ;
	- Restituisce i valori della tabella quando una colonna risponde a certi criteri
	- Restituisce il numero di righe corrispondenti
- SELECT * FROM nomeTabella WHERE gender = 'Female' AND (country_of_birth = 'Poland' OR country_of_birth = 'China') ;
	- **Allarga** il filtro a due possibili valori
	- Restituisce il numero di righe corrispondenti
