CREATE TABLE Towns (
	Id INT PRIMARY KEY NOT NULL, 
	[Name] VARCHAR (30) NOT NULL
)

INSERT INTO Towns (Id, Name) VALUES
	(413, 'Gogo Gogov'),
	(414, 'Pepo Pepov'),
	(415, 'Niki Nikov')


CREATE TABLE Addresses 
(
Id INT PRIMARY KEY IDENTITY NOT NULL,  
AddressText VARCHAR(50) NOT NULL, 
TownId INT FOREIGN KEY REFERENCES Towns(Id)
)

INSERT INTO Addresses (AddressText, TownId) VALUES
	('Glavnata 5', 413),
	('Iztok', 415),
	('Zapad',414)


CREATE TABLE Departments 
(
    Id INT PRIMARY KEY NOT NULL, 
	[Name] VARCHAR (30) NOT NULL
)

INSERT INTO Departments (Id, Name) VALUES
	(1,'IT'),
	(2,'TAX'),
	(3,'AUDIT')

	
CREATE TABLE Employees
(
Id INT PRIMARY KEY NOT NULL,
FirstName VARCHAR(30) NOT NULL,
MiddleName VARCHAR(30) NOT NULL,
LastName VARCHAR(30) NOT NULL,
JobTitle VARCHAR(30) NOT NULL,
DepartmentId INT FOREIGN KEY REFERENCES Departments(Id) NOT NULL,
HireDate DATETIME NOT NULL,
Salary INT NOT NULL,
AddressId INT FOREIGN KEY REFERENCES Addresses(Id) NOT NULL
)

INSERT INTO Employees (Id, FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary, AddressId) VALUES
	(413, 'Pavel', 'Popov', 'Ognemirov', 'Support', 1, '03-15-2016', 2700, 1),
	(414, 'Gogo', 'Gogov', 'Goshev', 'Corporate', 2, '03-16-2016', 2700, 3),
	(415, 'Mitko', 'Mitkov', 'Mitev', 'RAS', 3, '03-16-2017', 2700, 2)



--18
INSERT INTO Towns (Id, Name) VALUES
	(1, 'Sofia'),
	(2, 'Plovdiv'),
	(3, 'Varna'),
	(4, 'Burgas')


INSERT INTO Departments (Id, Name) VALUES
	(4,'Engineering'),
	(5,'Sales'),
	(6,'Marketing'),
	(7,'Software Development'),
	(8,'Quality Assurance'),
	(9,'AUDIT'),
	(10,'AUDIT')

INSERT INTO Employees (Id, FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary, AddressId) VALUES
	(444, 'Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 7, '01/02/2013', 3500, 1),
	(445, 'Maria', 'Petrova', 'Ivanova', 'Intern', 8, '02/03/2004', 1000, 3),
	(446, 'Georgi', 'Teziev', 'Ivanov', 'CEO', 5, '09/12/2007', 3000, 2)


--19
SELECT * FROM Towns

SELECT * FROM Departments

SELECT * FROM Employees


--20
SELECT * FROM Towns
ORDER BY [Name]

SELECT * FROM Departments
ORDER BY [Name]

SELECT * FROM Employees
ORDER BY [Salary] DESC


--21
SELECT [Name] FROM Towns ORDER BY [Name] ASC

SELECT [Name] FROM Departments ORDER BY [Name] ASC

SELECT [FirstName], [LastName], [JobTitle], [Salary] FROM Employees ORDER BY [Salary] DESC


--22
UPDATE Employees
SET Salary = Salary * 1.1
SELECT [Salary] FROM Employees