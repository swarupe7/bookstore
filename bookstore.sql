
--Authors table 
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(65) NOT NULL
);

--Books table 
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    BookName VARCHAR(145) NOT NULL,
    AuthorID INT,
    Price INT NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

--customers table 
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    customerName VARCHAR(45) NOT NULL,
    Email VARCHAR(45) NOT NULL
);

--Orders table 
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    BookID INT,
    Quantity INT NOT NULL,
    Date DATE NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Retrieve a list of top-selling books:

SELECT Books.Bookname, SUM(Orders.Quantity) AS TotalSales
FROM Books
JOIN Orders ON Books.BookID = Orders.BookID
GROUP BY Books.BookID
ORDER BY TotalSales DESC;


-- Calculate total sales revenue for a given period (e.g., January 2024):

SELECT SUM(Books.Price * Orders.Quantity) AS TotalRevenue
FROM Books
JOIN Orders ON Books.BookID = Orders.BookID
WHERE Orders.Date BETWEEN '2024-01-01' AND '2024-01-31';

