CREATE TABLE Users
(
	Id INT PRIMARY KEY IDENTITY,
	Username VARCHAR(30) NOT NULL,
	[Password] CHAR(30) NOT NULL,
	Picture VARCHAR(MAX),
    LastLoginTime DATE,
	IsDeleted BIT
)

SET IDENTITY_INSERT Users ON

INSERT INTO Users (Id, Username, Password, Picture, LastLoginTime, IsDeleted) VALUES
(1,'gogo','1452rt3',NULL,GETDATE(),'TRUE'),
(2,'pepe','1452rt3',NULL,GETDATE(),'TRUE'),
(3,'lele','1452rt3',NULL,GETDATE(),'TRUE'),
(4,'nene','1452rt3',NULL,GETDATE(),'TRUE'),
(5,'keke','1452rt3',NULL,GETDATE(),'TRUE')