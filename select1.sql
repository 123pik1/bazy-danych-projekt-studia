/* Pracownik chce sprawdzić, jakich gatunków książek wypożyczają najczęściej ludzie poniżej 18 roku
życia.
Zapytanie: Podaj liczbę książek poszczególnych gatunków wypożyczonych przez osoby, które nie
skończyły 18 roku życia. Dane posortuj malejąco*/

SELECT Gatunki.Nazwa_gatunku AS Nazwa_gatunku, COUNT(Wypozyczenia.ID_rezerwacji) AS Liczba_wypozyczen
From 
Gatunki
JOIN 
Przypisanie_gatunkow ON Gatunki.Nazwa_gatunku = Przypisanie_gatunkow.Nazwa_gatunku
JOIN 
Ksiazki ON Przypisanie_gatunkow.ISBN = Ksiazki.ISBN
JOIN
Rezerwacje ON Rezerwacje.ISBN = Ksiazki.ISBN
JOIN 
Wypozyczenia ON Rezerwacje.ID_rezerwacji = Wypozyczenia.ID_rezerwacji
JOIN
Klienci ON Rezerwacje.ID_klienta = Klienci.ID_klienta
JOIN 
Osoby ON Klienci.ID_klienta = Osoby.ID_osoby
WHERE DATEDIFF(YEAR, Osoby.Data_urodzenia, GETDATE()) <18
GROUP BY Gatunki.Nazwa_gatunku;
