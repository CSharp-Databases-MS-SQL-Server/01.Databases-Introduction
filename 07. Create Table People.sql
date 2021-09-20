CREATE TABLE People
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(200) NOT NULL,
	Picture VARCHAR(MAX),
	Height DECIMAL(3,2),
	[Weight] DECIMAL(5,2),
	Gender CHAR(1) NOT NULL,
	Birthdate DATE NOT NULL,
	Biography VARCHAR(MAX)
)

SET IDENTITY_INSERT People ON

INSERT INTO People (Id, [Name], Picture, Height, [Weight], Gender, Birthdate, Biography) VALUES
(1,'Gogo',NULL,1.72,79.30,'m','2007-11-09','Fastest in school'),
(2,'Pesho',NULL,1.89,66.30,'m','2007-11-09','Weakest in school'),
(3,'Tina',NULL,1.78,47.30,'f','2007-11-09','Slowest in school'),
(4,'Tisho',NULL,1.75,78.30,'m','2007-11-09','Cleverest in school'),
(5,'Mimi',NULL,1.67,50.30,'f','2007-11-09','Richest in school')