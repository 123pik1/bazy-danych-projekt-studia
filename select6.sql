/*3.Wyświetl wydawców i liczbe książek która jest w bibliotece od danego wydawcy. 5
wydawców z największą ilością książek, posortowaną malejąco
Dla każdego wydawcy w bazie danych zlicz liczbę książek przypisanych do tego wydawcy.
Zestawienie posortuj malejąco według liczby książek i wyświetl 5 rekordów*/

SELECT
    Ksiazki.Wydawca,
    COUNT(Ksiazki.ISBN) AS Liczba_ksiazek
FROM
Ksiazki
GROUP BY Ksiazki.Wydawca
ORDER BY Liczba_ksiazek DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;