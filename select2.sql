/*. Klient sprawdza, które z wypożyczonych książek musi oddać najwcześniej oraz ile zostało jeszcze dni
do oddania.
Zapytanie: Podaj listę wypożyczonych książek z odpowiadającymi im liczbami dni do oddania. Dane
posortuj według rosnącej liczby dni.*/
SELECT Tytul, Dni_do_oddania
FROM WypozyczoneKsiazkiZDniamiDoOddania
WHERE ID_klienta = 73
ORDER BY Dni_do_oddania ASC;