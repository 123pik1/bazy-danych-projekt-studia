/*2.Biblioteka zawiesza konto klienta X, który wielokrotnie nie przestrzegał zasad wypożyczeń
(np. opóźnienia w zwrocie książek, niewłaściwe zachowanie).
Dla klienta, którego ID_KLIENTA to X aktualizuj atrybut zawieszony na TAK*/

UPDATE Klienci SET Klienci.zawieszony = 1 WHERE ID_klienta = 56;

Select * from Klienci where Klienci.zaWieszony = 1;