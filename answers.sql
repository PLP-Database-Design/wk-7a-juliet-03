CREATE DATABASE assignment_db;
USE assignment_db;
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(255),
    Products VARCHAR(255)
);

-- -- -- Insert the given data
INSERT INTO ProductDetail (OrderID, CustomerName, Products)
VALUES
    (101, 'John Doe', 'Laptop, Mouse'),
    (102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
    (103, 'Emily Clark', 'Phone');
    
    -- Convert the ProductDetail table to 1NF
SELECT OrderID, CustomerName, TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', n.n), ',', -1)) AS Product
FROM ProductDetail
JOIN (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) n
ON CHAR_LENGTH(Products) - CHAR_LENGTH(REPLACE(Products, ',', '')) >= n.n - 1;

-- question 2
CREATE TABLE OrderDetails (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255),
    Quantity INT
);

-- Insert the given data
INSERT INTO OrderDetails (OrderID, CustomerName, Product, Quantity)
VALUES
    (101, 'John Doe', 'Laptop', 2),
    (101, 'John Doe', 'Mouse', 1),
    (102, 'Jane Smith', 'Tablet', 3),
    (102, 'Jane Smith', 'Keyboard', 1),
    (102, 'Jane Smith', 'Mouse', 2),
    (103, 'Emily Clark', 'Phone', 1);

        CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Insert the unique data into Orders table
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;




-- Insert data into the normalized OrderDetails table
INSERT INTO OrderDetails (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
SELECT * FROM ORDERS;
SELECT * FROM OrderDetails;