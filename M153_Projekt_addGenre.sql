USE Film_Verleih;
GO
DROP PROCEDURE IF EXISTS addGenre;
GO
CREATE PROCEDURE addGenre
	@genre VARCHAR(100),
	@new_id INT OUTPUT
AS
BEGIN
	INSERT INTO Genre(Genre)
	VALUES (@genre);

	SET @new_id = SCOPE_IDENTITY();
END;