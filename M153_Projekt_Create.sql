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