/*5. Sprawdzenie długów klientów aby się z nimi skontaktować i przypomnieć o spłacie
Zapytanie: Wyświetl klientów którzy mają dług większy od 0 malejąco*/

SELECT K.ID_klienta,O.Nazwisko, O.Imie,K.email,  SUM(Ka.Wysokosc_kary) AS Dlug
FROM Klienci AS K
JOIN Rezerwacje AS R ON K.ID_klienta = R.ID_klienta
JOIN (Select * From Kary WHERE Data_oplacenia IS NULL) AS Ka ON R.ID_rezerwacji = Ka.ID_rezerwacji
JOIN Osoby AS O ON K.ID_klienta = O.ID_osoby
GROUP BY K.ID_klienta, O.Nazwisko, O.Imie, K.email
HAVING SUM(Ka.Wysokosc_kary) > 0
ORDER BY Dlug DESC;