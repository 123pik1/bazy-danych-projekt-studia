INSERT INTO Osoby (Imie, Nazwisko, Data_urodzenia, Kraj_pochodzenia) VALUES
('JAN', 'Kowalski', '1990-01-01', 'Polska'),
('Henryk', 'Sienkiewicz', '1846-05-05', 'Polska'),
('Amelia', 'Bielecka', '2007-04-04', 'Polska'),
('Adam', 'Mickiewicz', '1798-12-24', 'Polska'),
('Juliusz', 'Słowacki', '1809-09-04', 'Polska'),
('Bolesław', 'Prus', '1847-08-20', 'Polska'),
('Eliza', 'Orzeszkowa', '1841-06-06', 'Polska'),
('Władysław', 'Reymont', '1867-05-07', 'Polska'),
('Stanisław', 'Wyspiański', '1869-01-15', 'Polska'),
('Wisława', 'Szymborska', '1923-07-02', 'Polska'),
('Czesław', 'Miłosz', '1911-06-30', 'Polska'),
('Piotr', 'Kaczorowski', '2005-03-12', 'Polska'),
('Krzysztof', 'Krawczyk', '1946-09-08', 'Polska'),
('Marek', 'Kubale', '1946-07-02', 'Polska'),
('Piotr', 'Kaczorowski', '1958-02-23', 'Polska'),
('Fiodor', 'Dostojewski', '1821-11-11', 'Rosja'),
('Terry', 'Pratchett', '1948-04-28', 'Wielka Brytania'),
('John.', 'Tolkien', '1892-01-03', 'Wielka Brytania'),
('George', 'Orwell', '1903-06-25', 'Wielka Brytania'),
('William', 'Shakespeare', '1564-04-23', 'Wielka Brytania'),
('Joanne', 'Rowling', '1965-07-31', 'Wielka Brytania'),
('Isaac', 'Asimov', '1920-01-02', 'USA'),
('Adolf', 'Hitler', '1889-04-20', 'Austria'),
('Karol', 'May', '1842-02-25', 'Niemcy'),
('Józef', 'Stalin', '1999-02-25', 'Australia'),
('Karpomir', 'Hacjul', '2016-07-07', 'RPA'),
('Romcajs', 'Romcajski', '2015-08-26', 'Rosja'),
('Marika', 'Kolasińska', '2005-01-01', 'Polska'),
('Agata', 'Kowalska', '2000-02-02', 'Polska'),
('Agata', 'Romcajska', '2000-02-02', 'Polska'),
('Krzysztof', 'Kowalski', '2000-02-02', 'Polska'),
('Remigiusz', 'Mróz', '1987-12-15', 'Polska');

INSERT INTO Klienci (ID_klienta, email) VALUES
(1, 'owalski@xd.pl'),
(3, 'amiGami4@loveu.com'),
(12, '123pik1@pku.pl'),
(13, 'kkk@music,pl'),
(14, 'markubal@pg.edu.pl'),
(15, 'pkpk@alfa.pl'),
(26, 'jp100procent@badboy.pl'),
(27, 'rrowski@rr.ru'),
(28, 'markol@lol.pl'),
(29, 'aga2137@idol.com'),
(30, 'rom@romPoczta.com'),
(31, 'sprzedamOpla@janusz.pl');

INSERT INTO Pracownicy (ID_pracownika, Data_rozpoczecia_pracy, Data_zakonczenia_pracy) VALUES
(2, '2019-01-01', '2020-01-01'),
(31, '2019-01-15', NULL),
(32, '2019-02-01', NULL);

INSERT INTO Wydawcy (Nazwa_wydawcy, Miasto_pochodzenia, Rok_zalozenia) VALUES
('WPN', 'Warszawa', '2000-01-01');

INSERT INTO Gatunki (Nazwa_gatunku) VALUES
('Przygodowe'),
('Science-fiction'),
('Fantasy'),
('Kryminał'),
('Horror'),
('Dramat'),
('Komedia'),
('Romans'),
('Biografia'),
('Historyczne'),
('Dokument'),
('Kultura'),
('Thriller'),
('Non-fiction'),
('Poezja'),
('Self-help'),
('Dla dzieci'),
('Młodzieżowe'),
('Klasyka'),
('Komiks');

INSERT INTO Ksiazki (ISBN, ID_autora, Tytul_ksiazki, Liczba_ksiazek, Mozliwosc_wypozyczenia, Kara_za_przetrzymanie, Wydawca) VALUES
('9999999999', 5, 'Alfa', 6, 1, 20.3 , 'WPN');

INSERT INTO Przypisanie_gatunkow (Nazwa_gatunku, ISBN) VALUES
('Przygodowe', '9999999999');

INSERT INTO Rezerwacje (Data_przewidywanego_wypozyczenia, ID_klienta, ISBN) VALUES
('2020-08-12', 31, '9999999999');

INSERT INTO Wypozyczenia (ID_rezerwacji, Data_wypozyczenia, Termin_oddania) VALUES
(1,'2020-10-17', '2020-10-21');

INSERT INTO Kary (Wysokosc_kary, Termin_zaplaty, ID_rezerwacji) VALUES
(600, '2021-09-01', 1);
