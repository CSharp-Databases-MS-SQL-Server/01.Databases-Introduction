CREATE TABLE Directors
(
	Id INT PRIMARY KEY NOT NULL,
	DirectorName VARCHAR(50) NOT NULL,
	Notes VARCHAR(MAX)
)

INSERT INTO Directors (Id, DirectorName, Notes) VALUES
(1, 'Pavel', 'Boss'),
(2, 'Jock', 'The Boss'),
(3, 'Bojidar', 'The big Boss'),
(4, 'Beni', 'Bossy'),
(5, 'Tsveti', 'Mini Boss')

CREATE TABLE Genres
(
	Id INT PRIMARY KEY NOT NULL,
	GenreName VARCHAR(50) NOT NULL,
	Notes VARCHAR(MAX)
)

INSERT INTO Genres (Id, GenreName, Notes) VALUES
(1,'Action','Actions'),
(2,'Comedy','Comedies'),
(3,'Drama','Dramas'),
(4,'Fantasy','Fantasies'),
(5,'Horror','Horrors')

CREATE TABLE Categories
(
	Id INT PRIMARY KEY NOT NULL,
	CategoryName VARCHAR(50) NOT NULL,
	Notes VARCHAR(MAX)
)

INSERT INTO Categories (Id, CategoryName, Notes) VALUES
(1,'Action','Actions'),
(2,'Comedy','Comedies'),
(3,'Drama','Dramas'),
(4,'Fantasy','Fantasies'),
(5,'Horror','Horrors')

CREATE TABLE Movies
(
	Id INT PRIMARY KEY NOT NULL,
	Title VARCHAR(50) NOT NULL,
	DirectorId INT NOT NULL,
	CopyrightYear DATE NOT NULL,
	[Length] DECIMAL(3,2) NOT NULL,
	GenreId INT NOT NULL,
	CategoryId INT NOT NULL,
	Rating INT NOT NULL,
	Notes VARCHAR(MAX)
)

INSERT INTO Movies (Id, Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes) VALUES
(1,'FirstMovie',5,'2000',2.10,1,5,10,NULL),
(2,'SecondMovie',5,'2000',2.20,2,1,9,NULL),
(3,'ThirdMovie',5,'2004',1.55,3,2,4,NULL),
(4,'FourthMovie',5,'2006',1.56,4,3,8,NULL),
(5,'FifthMovie',5,'2008',2.35,5,4,9,NULL)