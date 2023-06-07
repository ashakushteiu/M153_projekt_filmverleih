USE Film_Verleih;
GO
IF OBJECT_ID('addFilm', 'P') IS NOT NULL
    DROP PROCEDURE addFilm;
GO
CREATE PROCEDURE addFilm
    @titel VARCHAR(100),
    @jahr INT,
    @stueckzahl INT,
    @regisseur VARCHAR(100),
    @genre_fk INT,
    @new_id INT OUTPUT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Filme WHERE filmID = @new_id)
    BEGIN
        UPDATE Filme SET
            Titel = @titel,
            Jahr = @jahr,
            Stückzahl = @stueckzahl,
            Regisseur = @regisseur,
            genre_FK = @genre_fk
        WHERE filmID = @new_id;
    END
    ELSE
    BEGIN
        INSERT INTO Filme (Titel, Jahr, Stückzahl, Regisseur, genre_FK)
        VALUES (@titel, @jahr, @stueckzahl, @regisseur, @genre_fk);
        SET @new_id = SCOPE_IDENTITY();
    END;
	SELECT * FROM Filme WHERE filmID = @new_id;

    IF @new_id = 0 OR @new_id IS NULL
    BEGIN
        RAISERROR('Ungültiger Wert für @new_id.', 16, 1);
        RETURN;
    END;
END;
