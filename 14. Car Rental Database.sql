CREATE TABLE Categories
(
	Id INT PRIMARY KEY NOT NULL,
	CategoryName VARCHAR(50) NOT NULL,
	DailyRate INT NOT NULL,
	WeeklyRate INT NOT NULL,
	MonthlyRate INT NOT NULL,
	WeekendRate INT NOT NULL,
)

INSERT INTO Categories (Id, CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate) VALUES
(1, 'Sport', 5,5,5,5),
(2, 'Clasic', 4,3,4,4),
(3, 'Van', 4,3,4,4)


CREATE TABLE Cars
(
	Id INT PRIMARY KEY IDENTITY NOT NULL, 
	PlateNumber CHAR(10), 
	Manufacturer VARCHAR(50), 
	Model VARCHAR(50) NOT NULL, 
	CarYear DATETIME2, 
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id) NOT NULL, 
	Doors INT NOT NULL, 
	Picture VARBINARY(MAX), 
	Condition NVARCHAR(50) NOT NULL,
	Available BIT NOT NULL
)

INSERT INTO Cars (PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Condition, Available) VALUES
('PA 5364 PK', 'VW', 'Arteon R Line', '2019', 1, 5, 'new', 1),
('CA 6587 BN', 'AUDI', 'RS5', '2019', 2, 5, 'SecondHand', 0),
('PB 7309 VL', 'BMW', '750d', '2019', 3, 5, 'No info', 1)


CREATE TABLE Employees
(
	Id INT PRIMARY KEY IDENTITY NOT NULL, 
	FirstName VARCHAR(50) NOT NULL, 
	LastName VARCHAR(50) NOT NULL, 
	Title VARCHAR(50) NOT NULL, 
	Notes VARCHAR(MAX)
)

INSERT INTO Employees (FirstName, LastName, Title, Notes) VALUES
('Pavel', 'Ognemirov', 'Boss', 'Above'),
('Georgi', 'Demirov', 'Manager', 'Manages'),
('Dimitar', 'Senchev', 'Intern', NULL)


CREATE TABLE Customers
(
	Id INT PRIMARY KEY IDENTITY NOT NULL, 
	DriverLicenceNumber NVARCHAR(50) NOT NULL, 
	FullName VARCHAR(50) NOT NULL, 
	[Address] VARCHAR(50) NOT NULL, 
	City VARCHAR(50) NOT NULL, 
	ZIPCode INT NOT NULL,
	Notes VARCHAR(MAX)
)

INSERT INTO Customers (DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes) VALUES
('65F3495FA23', 'Peo Peev', 'Druzba 5', 'Sofia', 1400, 'Good Driver'),
('45326342FG3', 'Tihomir Tishev', 'Lukovica 43', 'Sofia', 2200, 'Taxes'),
('461856DAS43', 'Stoyan Velev', 'Iztok 45', 'Sofia', 4567, NULL)


CREATE TABLE RentalOrders(
    Id INT PRIMARY KEY IDENTITY NOT NULL,
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
	CustomerId INT FOREIGN KEY REFERENCES Customers(Id) NOT NULL,
	CarId  INT FOREIGN KEY REFERENCES Cars(Id) NOT NULL,
	TankLevel DECIMAL(5,2) NOT NULL,
	KilometrageStart FLOAT(20) NOT NULL,
	KilometrageEnd FLOAT(20) NOT NULL,
	TotalKilometrage FLOAT(20) NOT NULL,
	StartDate DATETIME2 NOT NULL,
	EndDate DATETIME2 NOT NULL,
	TotalDays BIGINT NOT NULL,
	RateApplied DECIMAL(5,2) NOT NULL,
	TaxRate  DECIMAL(5,2) NOT NULL,
	OrderStatus BIT NOT NULL, 
	Notes NVARCHAR(500) NOT NULL
)

INSERT INTO RentalOrders(EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes)
    VALUES
	      (1, 1, 1, 50, 1200, 1500, 300, '02.02.2020', '03.02.2020', 30, 7.2, 2.3, 1, 'Good car!'),
		  (2, 2, 2, 50, 1200, 1500, 300, '02.02.2020', '03.02.2020', 30, 7.2, 2.3, 1, 'Good car!'),
		  (3, 3, 3, 50, 1200, 1500, 300, '02.02.2020', '03.02.2020', 30, 7.2, 2.3, 1, 'Good car!')