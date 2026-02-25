2026-02-20-10:45
# Keywords
- PostgreSQL
# Links
[[PostgreSQL Courses]]
prima [[LIKE and iLKE operators]]
dopo [[Arithmetic Operators]]

[[funzioni di aggregazione SQL]]
#### External Links
[PostgreSQL Docs: Aggergate Functions](https://www.postgresql.org/docs/16/functions-aggregate.html)
[Funzioni di aggregazione in SQL](https://www.youtube.com/watch?v=AnX-RNg5jzY)

---------------

Permette di applicare **[[funzioni di aggregazione SQL]]** basati su un valore di una colonna
Ad esempio vediamo come scoprire quante persone sono presenti per ciascun paese di nascita in una tabella di esempio.
# COUNT ()

Il comando GROUP BY funziona indicando innanzi tutto la colonna di riferimento più la funzione COUNT() che letteralmente "conteggia" il numero di valori nelle colonne indicate fra parentesi rispetto ai valri nella colonna di riferimento

### SELECT country_of_birth, COUNT(\*) FROM person GROUP BY country_of_birth;
Questo comando quindi calcola il numero di righe presenti nel database per ciascun valore indicato nella colonna country_of_birth. In questo caso: sulla base di qualunque altra colonna.
Se fra parentesi si inserisce il nome di una colonna che non abbia restrizioni "NO NULL", come la colonna "email" della nostra tabella di esempio, il risultato dei conteggi sarà diverso.


# Group by Having
La keyword HAVING funziona da ulteriore filtro di GROUP BY:
#### SELECT country_of_birth, COUNT(\*) FROM person GROUP BY country_of_birth HAVING COUNT(\*) >= 5 ORDER BY country_of_birth;

Filtra i risultati per quantità minima di dati