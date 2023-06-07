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
    @new_id INT OUTPUT
AS
BEGIN
    IF @new_id = 0
    BEGIN
        INSERT INTO Kunde ([Name], Adresse, Tel, Aktiv)
        VALUES (@kunde_name, @adresse, @tel, @aktiv);
        SET @new_id = SCOPE_IDENTITY();
    END
    ELSE IF ISNUMERIC(@new_id) = 1
    BEGIN
        UPDATE Kunde SET [Name] = @kunde_name, Adresse = @adresse, Tel = @tel, Aktiv = @aktiv
        WHERE kundeID = @new_id;
    END
    ELSE
    BEGIN
        RAISERROR('Ungültiger Wert für @new_id.', 16, 1);
        RETURN;
    END;
END;
