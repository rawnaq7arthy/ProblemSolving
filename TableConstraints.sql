create database constrainttable;
use constrainttable;

CREATE TABLE Student (
    StudentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    DateOfBirth DATE,
    DepartmentID INT,
    
    -- Table-level constraints 
    
    CONSTRAINT PK_Student PRIMARY KEY (StudentID)
);


CREATE TABLE person (
    -- Column-level constraints
    StudentID INT PRIMARY KEY,                  
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE                 
);



-- Creating constraint when table already created 

CREATE TABLE Car (
    CarID INT,
    Make VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    Price DECIMAL(10, 2)
);

-- Add PRIMARY KEY
ALTER TABLE Car
ADD CONSTRAINT PK_Car PRIMARY KEY (CarID);

-- Add NOT NULL constraints
ALTER TABLE Car
MODIFY Make VARCHAR(50) NOT NULL;

------------------------------------------------------------------------

-- Customer table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Order table 
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_amount DECIMAL(10, 2),
    customer_id INT,
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
        
);
-- Insert data in customer table 
INSERT INTO Customer VALUES (1, 'Alice');
INSERT INTO Customer VALUES (2, 'Bob');
INSERT INTO Customer VALUES (3, 'Charlie');

-- Insert data in order table 
INSERT INTO Orders VALUES (101, 150.00, 1);
INSERT INTO Orders VALUES (102, 300.00, 2);
INSERT INTO Orders VALUES (103, 450.00, 3);

-- ON UPDATE CASCADE
UPDATE Customer SET customer_id = 10 WHERE customer_id = 1;

-- ON DELETE SET NULL
DELETE FROM Customer WHERE customer_id = 2;

-- New tables to apply ON DELETE CASCADE
-- Author table
CREATE TABLE Author (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(50)
);

-- Book table 
CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    CONSTRAINT fk_author
        FOREIGN KEY (author_id)
        REFERENCES Author(author_id)
        ON DELETE CASCADE
);

-- Authors
INSERT INTO Author VALUES (1, 'George Orwell');
INSERT INTO Author VALUES (2, 'J.K. Rowling');

-- Books
INSERT INTO Book VALUES (101, '1984', 1);
INSERT INTO Book VALUES (102, 'Animal Farm', 1);
INSERT INTO Book VALUES (103, 'Harry Potter', 2);

-- ON DELETE CASCADE
DELETE FROM Author WHERE author_id = 1;


-- View constraints 
SELECT 
    CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME 
FROM 
    information_schema.TABLE_CONSTRAINTS 
WHERE 
    TABLE_NAME = 'person' 
    AND TABLE_SCHEMA = 'constrainttable';

-- Disable foreign key checks globally (for all tables)
SET FOREIGN_KEY_CHECKS = 0;


-- Enable foreign key checks again
SET FOREIGN_KEY_CHECKS = 1;

-- Delete constraint 
ALTER TABLE person DROP CONSTRAINT Email;










