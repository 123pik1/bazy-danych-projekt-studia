/*1.Klient chce sprawdzić listę książek jakie ma wypożyczone(bo np. nie wie czy oddał już
wszystkie książki, czy ma jeszcze jakąś książkę o której zapomniał że wypożyczył)
Dla klienta X wyświetl listę: tytuł i datę wypożyczenia książki, którą wypożyczył. Posortuj
listę rosnąco według daty wypożyczenia. Upewnij się, że wyświetlane są tylko aktywne
wypożyczenia(książka nie została jeszcze zwrócona)*/

Select Ksiazki.Tytul_ksiazki AS Tytul_ksiazki, W.Data_wypozyczenia AS Data_wypożyczenia
FROM
(Select Wypozyczenia.ID_rezerwacji, Wypozyczenia.Data_wypozyczenia, Rezerwacje.ISBN From Wypozyczenia  join Rezerwacje ON Wypozyczenia.ID_rezerwacji=Rezerwacje.ID_rezerwacji 
 where Rezerwacje.ID_klienta = 31 and Wypozyczenia.Data_oddania is null) AS W
JOIN
Ksiazki ON W.ISBN = Ksiazki.ISBN
Order by Data_wypozyczenia asc;