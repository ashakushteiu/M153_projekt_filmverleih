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
    IF EXISTS (SELECT 1 FROM Genre WHERE genreID = @new_id)
    BEGIN
        UPDATE Genre SET Genre = @genre WHERE genreID = @new_id;
    END
    ELSE
    BEGIN
        INSERT INTO Genre (Genre)
        VALUES (@genre);
        SET @new_id = SCOPE_IDENTITY();
    END;
	SELECT * FROM Genre WHERE genreID = @new_id;

    IF @new_id = 0 OR @new_id IS NULL
    BEGIN
        RAISERROR('Ungültiger Wert für @new_id.', 16, 1);
        RETURN;
    END;
END;
