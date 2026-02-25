2026-02-20-14:20
# Keywords
- PostgreSQL
- Handling NULLS
# Links
[[PostgreSQL Courses]]
prima [[ALIAS in PostgreSQL]]
dopo [[NULLIF]]

---------------

La Keyword COALESCE genera un valore di default nel caso il valore richiesto non sia presente.

### Senza Coalesce:
```
test=# select email from person limit 15;  
          email              
---------------------------  
   
jjanway1@shareasale.com  
nmurrell2@newyorker.com  
acops3@clickbank.net  
koliffe4@biblegateway.com  
mmcbeith5@walmart.com  
   
dshakle7@sciencedaily.com  
vpaprotny8@amazon.com  
lgerge9@illinois.edu  
jconiama@google.co.uk  
ewheelerb@sitemeter.com  
oluffc@4shared.com  
sswannickd@redcross.org  
bclinte@ezinearticles.com  
(15 rows)
```

### Con COALESCE:
```
test=# select coalesce(email, 'NOT PROVIDED') from person limit 15;  
        coalesce             
---------------------------  
NOT PROVIDED  
jjanway1@shareasale.com  
nmurrell2@newyorker.com  
acops3@clickbank.net  
koliffe4@biblegateway.com  
mmcbeith5@walmart.com  
NOT PROVIDED  
dshakle7@sciencedaily.com  
vpaprotny8@amazon.com  
lgerge9@illinois.edu  
jconiama@google.co.uk  
ewheelerb@sitemeter.com  
oluffc@4shared.com  
sswannickd@redcross.org  
bclinte@ezinearticles.com  
(15 rows)
```