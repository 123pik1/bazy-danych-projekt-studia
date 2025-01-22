/*Przypomnienie o oddaniu książki przez bibliotekarza, następnie bibliotekarz wysyła
wiadomość o zbliżającym się terminie
- Wyświetl listę osób którym został mniej niż tydzień do oddania rosnąc z czasem*/

SELECT O.Nazwisko, O.Imie, K.email, DATEDIFF(DAY, GETDATE(), W.Termin_oddania) AS Dni_do_oddania
from Osoby AS O
JOIN Klienci AS K ON O.ID_osoby = K.ID_klienta
JOIN Rezerwacje AS R ON K.ID_klienta = R.ID_klienta
JOIN Wypozyczenia AS W ON R.ID_rezerwacji = W.ID_rezerwacji
WHERE DATEDIFF(DAY, GETDATE(), W.Termin_oddania) < 7 AND W.Data_oddania IS NULL
ORDER BY Dni_do_oddania ASC;