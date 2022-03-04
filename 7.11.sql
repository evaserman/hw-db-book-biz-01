-- Customer Orders
SELECT 
Orders.OrderID,
Orders.BookID,
Books.Title,
Customers.CustomerFirstName,
Customers.CustomerLastName
FROM 
Orders
JOIN Books
ON Books.BookID = Orders.BookID
JOIN Customers
ON Customers.CustomerID = Orders.CustomerID
ORDER BY OrderID ASC