CREATE TABLE Employees
(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	Title VARCHAR(30) NOT NULL,
	Notes VARCHAR(MAX)
)

INSERT INTO Employees (FirstName, LastName, Title, Notes) VALUES
('Pavel', 'Ognemirov', 'Boss', 'Above'),
('Georgi', 'Demirov', 'Manager', 'Manages'),
('Dimitar', 'Senchev', 'Intern', NULL)


CREATE TABLE Customers 
(
	AccountNumber INT PRIMARY KEY IDENTITY NOT NULL,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	PhoneNumber VARCHAR(20) NOT NULL,
	EmergencyName VARCHAR(30) NOT NULL,
	EmergencyNumber VARCHAR(20) NOT NULL,
	Notes VARCHAR(MAX)
)


INSERT INTO Customers (FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes) VALUES
('Pavel', 'Ognemirov', 0888899989, 'Gogo Gogov', 0999909090, 'Loyal'),
('Gogo', 'Gogov', 0999909090, 'Pavel Ognemirov', 0888899989, 'Loyal'),
('Mitko', 'Mitkov', 0888787798, 'Gogo Gogov', 0999909090, 'Loyal')


CREATE TABLE RoomStatus 
(
RoomStatus VARCHAR(50) PRIMARY KEY,
Notes VARCHAR(MAX)
)

INSERT INTO RoomStatus (RoomStatus, Notes) VALUES
('Available', 'Free'),
('Taken', 'Busy'),
('Clearing', 'Freshing')


CREATE TABLE RoomTypes 
(
RoomType VARCHAR(50) PRIMARY KEY,
Notes VARCHAR(MAX)
)

INSERT INTO RoomTypes (RoomType, Notes) VALUES
('Single', 'Free'),
('Two beds', 'Busy'),
('Mezonet', 'Freshing')


CREATE TABLE BedTypes 
(
BedType VARCHAR(50) PRIMARY KEY,
Notes VARCHAR(MAX)
)

INSERT INTO BedTypes (BedType, Notes) VALUES
('Small', 'Free'),
('Bedroom', 'Busy'),
('WaterBed', 'Freshing')


CREATE TABLE Rooms(
    RoomNumber INT PRIMARY KEY NOT NULL, 
	RoomType VARCHAR(50) FOREIGN KEY REFERENCES RoomTypes(RoomType) NOT NULL, 
	BedType VARCHAR(50) FOREIGN KEY REFERENCES BedTypes(BedType) NOT NULL, 
	Rate DECIMAL(5, 2) NOT NULL, 
	RoomStatus VARCHAR(50) FOREIGN KEY REFERENCES RoomStatus(RoomStatus) NOT NULL , 
	Notes VARCHAR(500) NOT NULL
)

INSERT INTO Rooms(RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes) VALUES
		  (201, 'Single', 'Small', 40.0, 'Available', 'room'),
		  (205, 'Two beds', 'Bedroom', 70.0, 'Taken', 'room'),
		  (208, 'Mezonet', 'WaterBed', 110.0, 'Clearing', 'room')


CREATE TABLE Payments(
    Id INT PRIMARY KEY IDENTITY NOT NULL, 
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
	PaymentDate DATETIME2 NOT NULL, 
	AccountNumber INT FOREIGN KEY REFERENCES Customers(AccountNumber) NOT NULL, 
	FirstDateOccupied DATETIME2 NOT NULL, 
	LastDateOccupied DATETIME2 NOT NULL, 
	TotalDays AS DATEDIFF(DAY, FirstDateOccupied, LastDateOccupied),
	AmountCharged DECIMAL(9, 2) NOT NULL, 
	TaxRate DECIMAL(9, 2) NOT NULL, 
	TaxAmount AS AmountCharged * TaxRate, 
	PaymentTotal AS AmountCharged + AmountCharged * TaxRate, 
	Notes NVARCHAR(500) NOT NULL
)

INSERT INTO Payments(EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, AmountCharged, TaxRate, Notes) 
	VALUES
		  (1, '2011-11-25', 2, '2017-11-30', '2017-12-04', 250.0, 0.2, 'room'),
		  (3, '2014-06-03', 3, '2014-06-06', '2014-06-09', 340.0, 0.2, 'room'),
		  (2, '2016-02-25', 2, '2016-02-27', '2016-03-04', 500.0, 0.2, 'room')

CREATE TABLE Occupancies (
    Id INT PRIMARY KEY IDENTITY NOT NULL,  
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL, 
	DateOccupied DATETIME2 NOT NULL,
	AccountNumber INT FOREIGN KEY REFERENCES Customers(AccountNumber) NOT NULL, 
	RoomNumber INT FOREIGN KEY REFERENCES Rooms(RoomNumber) NOT NULL, 
	RateApplied DECIMAL(5, 2) NOT NULL, 
	PhoneCharge DECIMAL(5, 2) NOT NULL, 
	Notes NVARCHAR(500) NOT NULL
)

INSERT INTO Occupancies(EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes) 
	VALUES
		  (2, '2011-02-04', 3, 205, 70.0, 12.54, 'room'),
		  (1, '2015-04-09', 1, 201, 40.0, 11.22, 'room'),
		  (3, '2012-06-08', 2, 208, 110.0, 10.05, 'room')

UPDATE Payments
SET TaxRate = TaxRate*0.97
SELECT TaxRate FROM Payments

DELETE Occupancies
