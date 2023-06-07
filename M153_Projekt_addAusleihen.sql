USE Film_Verleih;
GO
IF OBJECT_ID('addAusleih', 'P') IS NOT NULL
    DROP PROCEDURE addAusleih;
GO
CREATE PROCEDURE addAusleih
    @film_FK INT,
    @kunde_FK INT,
    @ausleihdatum DATE,
    @rueckgabedatum DATE,
    @new_id INT OUTPUT
AS
BEGIN
    IF (@film_FK IS NULL OR @kunde_FK IS NULL OR @ausleihdatum IS NULL OR @rueckgabedatum IS NULL)
    BEGIN
        RAISERROR('Fehlende Argumente. Bitte geben Sie alle Parameter an.', 16, 1);
        RETURN;
    END;

    IF @new_id = 0
    BEGIN
        INSERT INTO Ausleihen (film_FK, kunde_FK, Ausleihdatum, Rückgabedatum)
        VALUES (@film_FK, @kunde_FK, @ausleihdatum, @rueckgabedatum);
        SET @new_id = SCOPE_IDENTITY();
        SELECT * FROM Ausleihen WHERE ausleihenID = @new_id;
    END
    ELSE IF ISNUMERIC(@new_id) = 1
    BEGIN
        DECLARE @rowCount INT;
        UPDATE Ausleihen SET
            film_FK = @film_FK,
            kunde_FK = @kunde_FK,
            Ausleihdatum = @ausleihdatum,
            Rückgabedatum = @rueckgabedatum
        WHERE ausleihenID = @new_id;

        SET @rowCount = @@ROWCOUNT;
        IF @rowCount = 0
        BEGIN
            RAISERROR('Es wurde kein Datensatz mit der angegebenen ausleihenID gefunden.', 16, 1);
            RETURN;
        END;

        SELECT * FROM Ausleihen WHERE ausleihenID = @new_id;
    END
    ELSE
    BEGIN
        RAISERROR('Ungültiger Wert für @new_id.', 16, 1);
        RETURN;
    END;
END;
