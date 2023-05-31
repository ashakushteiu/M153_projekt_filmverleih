USE master
GO
DROP DATABASE IF EXISTS Film_Verleih;
CREATE DATABASE Film_Verleih;
GO
USE Film_Verleih;
CREATE TABLE Filme (
	filmID int NOT NULL IDENTITY,
	Titel varchar(100),
	Jahr int,
	Stückzahl int,
	Regisseur varchar(100),
	genre_FK int
);
CREATE TABLE Genre (
	genreID int NOT NULL IDENTITY,
	Genre varchar(50)
);
CREATE TABLE Kunde (
	kundeID int NOT NULL IDENTITY,
	"Name" varchar(100),
	Adresse varchar(200),
	Tel varchar(15),
	Aktiv bit
);
CREATE TABLE Ausleihen (
	ausleihenID int NOT NULL IDENTITY,
	film_FK int,
	kunde_FK int,
	Ausleihdatum date,
	Rückgabedatum date
);
CREATE TABLE Bewertung (
	berwertungID int NOT NULL IDENTITY,
	film_FK int,
	kunde_FK int,
	Bewertung float
);
GO
ALTER TABLE Filme ADD PRIMARY KEY (filmID);
ALTER TABLE Genre ADD PRIMARY KEY (genreID);
ALTER TABLE Kunde ADD PRIMARY KEY (kundeID);
ALTER TABLE Ausleihen ADD PRIMARY KEY (ausleihenID);
ALTER TABLE Bewertung ADD PRIMARY KEY (berwertungID);
GO
ALTER TABLE Filme ADD FOREIGN KEY (genre_FK) REFERENCES Genre(genreID);
ALTER TABLE Ausleihen ADD FOREIGN KEY (film_FK) REFERENCES Filme(filmID);
ALTER TABLE Ausleihen ADD FOREIGN KEY (kunde_FK) REFERENCES Kunde(kundeID);
ALTER TABLE Bewertung ADD FOREIGN KEY (film_FK) REFERENCES Filme(filmID);
ALTER TABLE Bewertung ADD FOREIGN KEY (kunde_FK) REFERENCES Kunde(kundeID);
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
GO
DROP PROCEDURE IF EXISTS addFilm;
GO
CREATE PROCEDURE addFilm
	@titel VARCHAR(100),
	@jahr VARCHAR(200),
	@stueckzahl VARCHAR(15),
	@regisseur BIT,
	@genre_fk INT,
	@new_id INT OUTPUT
AS
BEGIN
	INSERT INTO Filme (Titel, Jahr, Stückzahl, Regisseur, genre_FK)
	VALUES (@titel, @jahr, @stueckzahl, @regisseur, @genre_fk);

	SET @new_id = SCOPE_IDENTITY();
END;
GO
EXEC addKunde 'Max Mustermann', 'Musterstraße 1, 12345 Musterstadt', '0123456789', 1, 0;
EXEC addKunde 'Peter Example', 'Bachleer 1, 12345 Muster', '0123456789', 1, 0;
EXEC addKunde 'Elias Amstein', 'Willisau 1, 5302 Willsa', '01345635789', 1, 0;
EXEC addKunde 'Ghiath Sardat', 'Bachstrasse 1, 5938 Menznau', '5575246767', 1, 0;
EXEC addKunde 'Anna Schmidt', 'Hauptstraße 7, 45678 Beispielstadt', '01761234567', 1, 0;
EXEC addKunde 'Peter Müller', 'Neue Straße 12, 98765 Musterhausen', '0157123456', 0, 0;
EXEC addKunde 'Julia Fischer', 'Am Markt 5, 65432 Beispielort', '0160123456', 1, 0;
EXEC addKunde 'Hans Wagner', 'Hofstraße 2, 56789 Musterdorf', '0176123456', 0, 0;
EXEC addKunde 'Sabine Mayer', 'Dorfplatz 1, 23456 Beispielhausen', '01571234567', 1, 0;
EXEC addKunde 'Janine Schulz', 'Schulstraße 3, 34567 Musterheim', '0160123456', 0, 0;
EXEC addKunde 'Fritz Berger', 'Bachweg 4, 78901 Beispielberg', '0176123456', 1, 0;
EXEC addKunde 'Tanja Keller', 'Burgstraße 2, 23456 Musterburg', '01571234567', 0, 0;
EXEC addKunde 'Andreas Lehmann', 'Wiesenweg 7, 34567 Beispielwiese', '0160123456', 1, 0;
EXEC addKunde 'Maria Schmidt', 'Kirchplatz 3, 45678 Musterkirch', '0176123456', 0, 0;
EXEC addKunde 'Robert Schulze', 'Am Hang 8, 78901 Beispielhang', '01571234567', 1, 0;
EXEC addKunde 'Lisa Meier', 'Birkenweg 2, 23456 Musterbirke', '0160123456', 0, 0;
EXEC addKunde 'Jürgen Krause', 'Lindenstraße 6, 34567 Beispielstadt', '0176123456', 1, 0;
EXEC addKunde 'Marina Schuster', 'Hochstraße 9, 45678 Musterhoch', '01571234567', 0, 0;
EXEC addKunde 'Julia Müller', 'Hauptstraße 10, 12345 Berlin', '0172-1234567', 1, 0;
EXEC addKunde 'Thomas Schmidt', 'Musterstraße 123, 45678 München', '0162-9876543', 0, 0;
GO
SELECT * FROM Kunde;

EXEC addGenre 'Hallo genre', 0;

select * from genre;