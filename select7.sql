/*4. Klient chce wyświetlić dostępne do wypożyczenia książki przygodowe posortowane od tych, których jest najmniej
aby klient zobaczył, które książki przygodowe są najrzadziej dostępne.
Zapytanie: Wyświetl dostępne do wypożyczenia książki przygodowe posortuj od tych których jest najmniej*/

SELECT Ksiazki.Tytul_ksiazki AS Tytul_ksiazki, Ksiazki.Liczba_ksiazek-Wyp.Liczba_ksiazek AS Dostepne_ksiazki
FROM Ksiazki
JOIN Przypisanie_gatunkow ON Ksiazki.ISBN = Przypisanie_gatunkow.ISBN
JOIN (SELECT R.ISBN,COUNT(*) AS Liczba_ksiazek
     FROM Wypozyczenia AS W
     JOIN
            Rezerwacje AS R ON W.ID_rezerwacji = R.ID_rezerwacji 
        JOIN Ksiazki ON R.ISBN = Ksiazki.ISBN
     WHERE GETDATE() < W.Termin_oddania AND W.Data_oddania IS NULL
       AND R.ISBN = Ksiazki.ISBN
       GROUP BY R.ISBN) AS Wyp ON Ksiazki.ISBN = Wyp.ISBN
WHERE Przypisanie_gatunkow.Nazwa_gatunku = 'Przygodowe' AND Ksiazki.Liczba_ksiazek > Wyp.Liczba_ksiazek AND Ksiazki.Mozliwosc_wypozyczenia = 1
ORDER BY Dostepne_ksiazki ASC;