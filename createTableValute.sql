CREATE TABLE valute
(    
	Date CHAR(10) NOT NULL,
	idVal CHAR(10) NOT NULL,
    NumCode INT NOT NULL,
    CharCode CHAR(10) NOT NULL,
    Nominal INT NOT NULL,
    Name CHAR(100) NOT NULL,
    Value NVARCHAR(10) NOT NULL
	PRIMARY KEY (Date, idVal)
);