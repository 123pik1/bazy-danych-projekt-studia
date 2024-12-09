CREATE TRIGGER Operacje_quantity_Ksiazki
ON Operacje
AFTER INSERT
AS
BEGIN 
    IF EXISTS (SELECT * FROM inserted WHERE Rodzaj_operacji = 'Usuniecie')
    BEGIN
        UPDATE Ksiazki
        SET Liczba_ksiazek = Liczba_ksiazek - (SELECT Liczba_egzemplarzy FROM inserted WHERE ISBN = Ksiazki.ISBN)
        FROM Ksiazki
        JOIN inserted ON Ksiazki.ISBN = inserted.ISBN
    END
    ELSE
    BEGIN
        UPDATE Ksiazki
        SET Liczba_ksiazek = Liczba_ksiazek + (SELECT Liczba_egzemplarzy FROM inserted WHERE ISBN = Ksiazki.ISBN)
        FROM Ksiazki
        JOIN inserted ON Ksiazki.ISBN = inserted.ISBN
    END
END;