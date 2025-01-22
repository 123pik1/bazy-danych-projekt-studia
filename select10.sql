/* Zarząd przydziela premię, chce wiedzieć który pracownik obsłużył najwięcej wypożyczeń w ostatnim miesiącu,
 aby wiedzieć kto zasługuje na premię.
Zapytanie: Wyświetl pracownika, który obsłużył najwięcej wypożyczeń w ostatnim miesiącu.*/

SELECT TOP 1 Pr.ID, Pr.Imie, Pr.Nazwisko, COUNT(Wypozyczenia.ID_rezerwacji) AS Liczba_wypozyczen, Pr.Data_rozpoczecia_pracy
FROM
(Select Pracownicy.ID_pracownika AS ID, Osoby.Imie AS Imie, Osoby.Nazwisko AS Nazwisko, Pracownicy.Data_rozpoczecia_pracy AS Data_rozpoczecia_pracy
From Pracownicy Join Osoby ON Pracownicy.ID_pracownika = Osoby.ID_osoby) AS Pr
JOIN Wypozyczenia ON Pr.ID = Wypozyczenia.ID_pracownika
GROUP BY Pr.ID, Pr.Imie, Pr.Nazwisko, Pr.Data_rozpoczecia_pracy, Wypozyczenia.Data_wypozyczenia
HAVING DATEDIFF(MONTH, Wypozyczenia.Data_wypozyczenia, GETDATE()) = 1
ORDER BY COUNT(Wypozyczenia.ID_rezerwacji) DESC;