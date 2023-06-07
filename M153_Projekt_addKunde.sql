USE Film_Verleih;
GO
IF OBJECT_ID('addKunde', 'P') IS NOT NULL
    DROP PROCEDURE addKunde;
GO
CREATE PROCEDURE addKunde
    @kunde_name VARCHAR(100),
    @adresse VARCHAR(200),
    @tel VARCHAR(15),
    @aktiv BIT,
    @new_id INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Kunde WHERE kundeID = @new_id)
    BEGIN
        UPDATE Kunde SET [Name] = @kunde_name, Adresse = @adresse, Tel = @tel, Aktiv = @aktiv
        WHERE kundeID = @new_id;
    END
    ELSE
    BEGIN
        INSERT INTO Kunde ([Name], Adresse, Tel, Aktiv)
        VALUES (@kunde_name, @adresse, @tel, @aktiv);
        SET @new_id = SCOPE_IDENTITY();
    END;
	SELECT * FROM Kunde WHERE kundeID = @new_id;

    IF @new_id = 0 OR @new_id IS NULL
    BEGIN
        RAISERROR('Ungültiger Wert für @new_id.', 16, 1);
        RETURN;
    END;
END;
