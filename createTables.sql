
CREATE TABLE Osoby
(
    ID_osoby INT NOT NULL IDENTITY(1,1),
    Imie VARCHAR(20) NOT NULL CHECK (LEN(Imie) BETWEEN 2 AND 20 AND PATINDEX('%[A-Z]%', Imie) = 1 AND PATINDEX('%[0-9]%', Imie) = 0 AND PATINDEX('%[!@#$%^&*()-]%', Imie) = 0),
    Nazwisko VARCHAR(20) NOT NULL CHECK (LEN(Nazwisko) BETWEEN 2 AND 20 AND PATINDEX('%[A-Z]%', Nazwisko) = 1 AND PATINDEX('%[0-9]%', Nazwisko) = 0 AND PATINDEX('%[!@#$%^&*()-]%', Nazwisko) = 0),
    Data_urodzenia DATE NOT NULL,
    Kraj_pochodzenia VARCHAR(20) NOT NULL CHECK (LEN(Kraj_pochodzenia) BETWEEN 2 AND 20 AND PATINDEX('%[A-Z]%', Kraj_pochodzenia) = 1 AND PATINDEX('%[0-9]%', Kraj_pochodzenia) = 0 AND PATINDEX('%[!@#$%^&*()-]%', Kraj_pochodzenia) = 0),
    PRIMARY KEY (ID_osoby)
);

CREATE TABLE Klienci
(
    ID_klienta INT NOT NULL,
    email VARCHAR(50) NOT NULL CHECK (PATINDEX('%[@]%',email)>1 AND PATINDEX('%[@]%',email)<LEN(email)),
    zawieszony BIT DEFAULT 0,
    FOREIGN KEY (ID_klienta) REFERENCES Osoby(ID_osoby) ON DELETE CASCADE, -- No practcal use if its index IDENTITY(1,1)
    PRIMARY KEY (ID_klienta)
);

CREATE TABLE Pracownicy
(
    ID_pracownika INT NOT NULL,
    Data_rozpoczecia_pracy DATE NOT NULL,
    Data_zakonczenia_pracy DATE,
    FOREIGN KEY (ID_pracownika) REFERENCES Osoby(ID_osoby) ON DELETE CASCADE,
    PRIMARY KEY (ID_pracownika) 
);

CREATE TABLE Wydawcy
(
    Nazwa_wydawcy VARCHAR(100) NOT NULL CHECK (LEN(Nazwa_wydawcy) BETWEEN 3 AND 100),
    Miasto_pochodzenia VARCHAR(20) NOT NULL CHECK (LEN(Miasto_pochodzenia) BETWEEN 2 AND 20),
    Rok_zalozenia DATE NOT NULL,
    PRIMARY KEY (Nazwa_wydawcy)
);

CREATE TABLE Ksiazki
(
    ISBN VARCHAR(15) NOT NULL CHECK (LEN(ISBN)=10 OR LEN(ISBN)=13),
    ID_autora INT NOT NULL,
    Tytul_ksiazki VARCHAR(200) NOT NULL CHECK (LEN(Tytul_ksiazki) BETWEEN 1 AND 200),
    Liczba_ksiazek INT NOT NULL CHECK (Liczba_ksiazek > 0),
    Mozliwosc_wypozyczenia BIT NOT NULL,
    Kara_za_przetrzymanie Money ,
    Wydawca VARCHAR(100) NOT NULL,
    PRIMARY KEY (ISBN),
    FOREIGN KEY (ID_autora) REFERENCES Osoby(ID_osoby)  ON DELETE CASCADE,
    FOREIGN KEY (Wydawca) REFERENCES Wydawcy(Nazwa_wydawcy)  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Gatunki
(
    Nazwa_gatunku VARCHAR(30) NOT NULL CHECK (LEN(Nazwa_gatunku) BETWEEN 3 AND 30),
    PRIMARY KEY (Nazwa_gatunku)
);

CREATE TABLE Przypisanie_gatunkow
(
    Nazwa_gatunku VARCHAR(30) NOT NULL, 
    ISBN VARCHAR(15) NOT NULL,
    PRIMARY KEY (Nazwa_gatunku, ISBN),
    FOREIGN KEY (Nazwa_gatunku) REFERENCES Gatunki(Nazwa_gatunku) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ISBN) REFERENCES Ksiazki(ISBN)  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Rezerwacje 
(
    ID_rezerwacji INT NOT NULL IDENTITY(1,1),
    Data_przewidywanego_wypozyczenia DATE NOT NULL,
    ID_klienta INT NOT NULL,
    ISBN VARCHAR(15) NOT NULL,
    PRIMARY KEY (ID_rezerwacji),
    FOREIGN KEY (ID_klienta) REFERENCES Klienci(ID_klienta),
    FOREIGN KEY (ISBN) REFERENCES Ksiazki(ISBN) ON UPDATE CASCADE
);

CREATE TABLE Wypozyczenia
(
    ID_rezerwacji INT NOT NULL,
    Data_wypozyczenia DATE NOT NULL,
    Termin_oddania DATE NOT NULL, 
    Data_oddania DATE,
    ID_pracownika INT NOT NULL,
    PRIMARY KEY (ID_rezerwacji),
    FOREIGN KEY (ID_rezerwacji) REFERENCES Rezerwacje(ID_rezerwacji),
    FOREIGN KEY (ID_pracownika) REFERENCES Pracownicy(ID_pracownika)
);

CREATE TABLE Kary
(
    ID_kary INT NOT NULL IDENTITY(1,1),
    Wysokosc_kary MONEY NOT NULL,
    Termin_zaplaty DATE NOT NULL,
    Data_oplacenia DATE,
    ID_rezerwacji INT NOT NULL,
    ID_pracownika INT,
    PRIMARY KEY (ID_kary),
    FOREIGN KEY (ID_rezerwacji) REFERENCES Rezerwacje(ID_rezerwacji),
    FOREIGN KEY (ID_pracownika) REFERENCES Pracownicy(ID_pracownika)
);

CREATE TABLE Operacje
(
    ID_operacji INT NOT NULL IDENTITY(1,1),
    Data_operacji DATE NOT NULL,
    ID_pracownika INT NOT NULL,
    ISBN VARCHAR(15) NOT NULL,
    Liczba_egzemplarzy INT NOT NULL CHECK (Liczba_egzemplarzy > 0),
    Rodzaj_operacji VARCHAR(20) NOT NULL CHECK (Rodzaj_operacji IN ('Usuniecie', 'Dodanie')),
    PRIMARY KEY (ID_operacji),
    FOREIGN KEY (ID_pracownika) REFERENCES Pracownicy(ID_pracownika),
    FOREIGN KEY (ISBN) REFERENCES Ksiazki(ISBN) ON UPDATE CASCADE
);

