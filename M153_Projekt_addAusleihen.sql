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
    IF @new_id = 0
    BEGIN
        INSERT INTO Ausleihen (film_FK, kunde_FK, Ausleihdatum, R�ckgabedatum)
        VALUES (@film_FK, @kunde_FK, @ausleihdatum, @rueckgabedatum);
        SET @new_id = SCOPE_IDENTITY();
    END
    ELSE IF ISNUMERIC(@new_id) = 1
    BEGIN
        UPDATE Ausleihen SET
            film_FK = @film_FK,
            kunde_FK = @kunde_FK,
            Ausleihdatum = @ausleihdatum,
            R�ckgabedatum = @rueckgabedatum
        WHERE ausleihenID = @new_id;
    END
    ELSE
    BEGIN
        RAISERROR('Ung�ltiger Wert f�r @new_id.', 16, 1);
        RETURN;
    END;
	SELECT * FROM Ausleihen WHERE ausleihenID = @new_id;
END;
