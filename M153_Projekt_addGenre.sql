USE Film_Verleih;
GO
IF OBJECT_ID('addGenre', 'P') IS NOT NULL
    DROP PROCEDURE addGenre;
GO
CREATE PROCEDURE addGenre
    @genre VARCHAR(100),
    @new_id INT OUTPUT
AS
BEGIN
    IF @new_id = 0
    BEGIN
        INSERT INTO Genre (Genre)
        VALUES (@genre);
        SET @new_id = SCOPE_IDENTITY();
    END
    ELSE IF ISNUMERIC(@new_id) = 1
    BEGIN
        UPDATE Genre SET Genre = @genre WHERE genreID = @new_id;
    END
    ELSE
    BEGIN
        RAISERROR('Ungültiger Wert für @new_id.', 16, 1);
        RETURN;
    END;
	SELECT * FROM Genre WHERE genreID = @new_id;
END;
