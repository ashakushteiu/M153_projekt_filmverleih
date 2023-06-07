USE Film_Verleih;

/* TEST Functions */
SELECT dbo.GetVerfuegbareFilmeNachGenre('Action') AS 'Anzahl Action Filme';
SELECT dbo.GetVerfuegbareFilmeNachGenre('Drama') AS 'Anzahl Drama Filme';

SELECT dbo.GetDurchschnittlicheBewertungFuerFilm(1) AS 'Durchschnitt Bewertung';
SELECT Filme.*, dbo.GetDurchschnittlicheBewertungFuerFilm(Filme.filmID) AS 'Durchschnitt Bewertung' FROM Filme;


/* TEST Prodecures */
EXEC addKunde 'Max Mustermann', 'Musterstraﬂe 1, 12345 Musterstadt', '0123456789', 1, 0;
EXEC addKunde 'Peter Example', 'Bachleer 1, 12345 Muster', '0123456789', 1, 6;

EXEC addGenre 'Test', 0;
EXEC addGenre 'Test333', 18;

EXEC addFilm 'Inglourious Basterds', 2009, 30, 'Quentin Tarantino', 4, 0;
EXEC addFilm 'Goodfellas', 1990, 25, 'Martin Scorsese', 3, 6;

EXEC addBewertung 1, 1, 4.5, 0;
EXEC addBewertung 15, 8, 4.5, 13;

EXEC addAusleih 19, 10, '2023-05-19', '2023-05-26', 0;
EXEC addAusleih 20, 10, '2023-05-20', '2023-05-27', 17;

