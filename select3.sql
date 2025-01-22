/*3. Pracownik chce sprawdzić, która książka jest najczęściej niedostępna z powodu dużej liczby
wypożyczeń w celu wykupienia większej liczby egzemplarzy tej książki.
Zapytanie: Podaj książkę, która ma największą liczbę dni niedostępności (czyli dni, w których była
wypożyczona przez liczbę osób równej liczbie egzemplarzy)*/

SELECT 
    Ksiazki.ISBN,
    Ksiazki.Tytul_ksiazki,
    COUNT(*) AS Dni_niedostepnosci
FROM 
    Wypozyczenia
JOIN 
    Rezerwacje ON Wypozyczenia.ID_rezerwacji = Rezerwacje.ID_rezerwacji
JOIN 
    Ksiazki ON Rezerwacje.ISBN = Ksiazki.ISBN
WHERE 
    (SELECT COUNT(*) 
     FROM Wypozyczenia W2
     JOIN
            Rezerwacje R2 ON W2.ID_rezerwacji = R2.ID_rezerwacji 
     WHERE W2.Data_wypozyczenia <= Wypozyczenia.Data_wypozyczenia 
       AND W2.Termin_oddania >= Wypozyczenia.Data_wypozyczenia 
       AND R2.ISBN = Ksiazki.ISBN) = Ksiazki.Liczba_ksiazek
GROUP BY 
    Ksiazki.ISBN, Ksiazki.Tytul_ksiazki
ORDER BY 
    Dni_niedostepnosci DESC;