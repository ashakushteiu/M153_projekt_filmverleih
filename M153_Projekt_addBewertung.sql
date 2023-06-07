USE Film_Verleih;
GO
IF OBJECT_ID('addBewertung', 'P') IS NOT NULL
    DROP PROCEDURE addBewertung;
GO
CREATE PROCEDURE addBewertung
    @film_FK INT,
    @kunde_FK INT,
    @Bewertung FLOAT,
    @new_id INT OUTPUT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Bewertung WHERE film_FK = @film_FK AND kunde_FK = @kunde_FK)
    BEGIN
        UPDATE Bewertung SET Bewertung = @Bewertung WHERE film_FK = @film_FK AND kunde_FK = @kunde_FK;
    END
    ELSE
    BEGIN
        INSERT INTO Bewertung (film_FK, kunde_FK, Bewertung)
        VALUES (@film_FK, @kunde_FK, @Bewertung);
        SET @new_id = SCOPE_IDENTITY();
    END;
	SELECT * FROM Bewertung WHERE berwertungID = @new_id;

    IF @new_id = 0 OR @new_id IS NULL
    BEGIN
        RAISERROR('Ungültiger Wert für @new_id.', 16, 1);
        RETURN;
    END;
END;
