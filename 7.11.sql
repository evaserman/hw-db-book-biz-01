-- Customer Orders
SELECT 
-- Customers.CustomerFirstName, 
-- Customers.CustomerLastName,
Orders.OrderID,
COUNT(DISTINCT Orders.OrderID) AS NumberofBooks
FROM Customers 
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID