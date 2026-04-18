# E-commerce Database – Oracle SQL

**Projekt portfolio** – pełna baza danych sklepu internetowego stworzona pod stanowisko **Junior Oracle Developer / SQL Developer**.

### Technologie
- Microsoft SQL Server (lokalnie)
- Zapytania w **100% kompatybilne z Oracle SQL** (testowane na Oracle Live SQL)
- Window functions, CTE, rankingi, procedury PL/SQL

### Co zawiera projekt
- 8 tabel (klienci, produkty, zamówienia, pozycje, płatności, recenzje, kategorie, inventory)
- ~60 zamówień + ~49 pozycji + dane testowe
- Klucze obce, constraints, indeksy

### Kluczowe zapytania biznesowe
- Top 10 klientów według wydatków
- Przychody miesięczne + szacowana marża
- Analiza porzuconych koszyków (CTE)
- Ranking produktów w kategoriach (PARTITION BY)
- Procedura PL/SQL generująca raport miesięczny
- Wykrywanie anomalii w danych

### Jak uruchomić
1. Uruchom `01_schema.sql`
2. Wstaw dane z `02_insert_data.sql`
3. Uruchom zapytania z `03_queries.sql`

### Screeny z wyników
→ folder `screenshots`
