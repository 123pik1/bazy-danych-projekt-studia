CREATE VIEW WypozyczoneKsiazkiZDniamiDoOddania AS
SELECT 
Ksiazki.Tytul_ksiazki AS Tytul,
DATEDIFF(DAY, GETDATE(), Wypozyczenia.Termin_oddania) AS Dni_do_oddania,
Rezerwacje.ID_klienta AS ID_klienta
FROM 
Ksiazki
JOIN
Rezerwacje ON Rezerwacje.ISBN = Ksiazki.ISBN
JOIN
Wypozyczenia ON Rezerwacje.ID_rezerwacji = Wypozyczenia.ID_rezerwacji;