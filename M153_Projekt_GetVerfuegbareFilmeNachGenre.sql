USE Film_Verleih;
GO
IF OBJECT_ID('GetVerfuegbareFilmeNachGenre', 'FN') IS NOT NULL
    DROP FUNCTION GetVerfuegbareFilmeNachGenre;
GO
CREATE FUNCTION GetVerfuegbareFilmeNachGenre (@genre VARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @anzahl INT;
    SELECT @anzahl = SUM(Stückzahl)
    FROM Filme f
    INNER JOIN Genre g ON f.genre_FK = g.genreID
    WHERE g.Genre = @genre;
    
    RETURN @anzahl;
END;
