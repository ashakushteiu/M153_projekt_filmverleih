USE Film_Verleih;
GO
IF OBJECT_ID('GetDurchschnittlicheBewertungFuerFilm', 'FN') IS NOT NULL
    DROP FUNCTION GetDurchschnittlicheBewertungFuerFilm;
GO
CREATE FUNCTION GetDurchschnittlicheBewertungFuerFilm (@filmID INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @durchschnitt FLOAT;
    
    SELECT @durchschnitt = AVG(Bewertung)
    FROM Bewertung
    WHERE film_FK = @filmID;

    IF @durchschnitt IS NULL
        SET @durchschnitt = 0;

    RETURN @durchschnitt;
END;
