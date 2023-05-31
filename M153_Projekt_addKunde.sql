USE Film_Verleih;
GO
DROP PROCEDURE IF EXISTS addKunde;
GO
CREATE PROCEDURE addKunde
	@kunde_name VARCHAR(100),
	@addresse VARCHAR(200),
	@tel VARCHAR(15),
	@aktiv BIT,
	@new_id INT OUTPUT
AS
BEGIN
	INSERT INTO Kunde ([Name], Adresse, Tel, Aktiv)
	VALUES (@kunde_name, @addresse, @tel, @aktiv);

	SET @new_id = SCOPE_IDENTITY();
END;