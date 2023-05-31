USE Film_Verleih;
GO
DROP PROCEDURE IF EXISTS addFilm;
GO
CREATE PROCEDURE addFilm
	@titel VARCHAR(100),
	@jahr VARCHAR(200),
	@stueckzahl VARCHAR(15),
	@regisseur VARCHAR(70),
	@genre_fk INT,
	@new_id INT OUTPUT
AS
BEGIN
	INSERT INTO Filme (Titel, Jahr, Stückzahl, Regisseur, genre_FK)
	VALUES (@titel, @jahr, @stueckzahl, @regisseur, @genre_fk);

	SET @new_id = SCOPE_IDENTITY();
END;