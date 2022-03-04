-- Orders per customer
SELECT Customers.CustomerFirstName, Customers.CustomerLastName,
COUNT(DISTINCT Orders.OrderID) AS NumberofOrders
FROM Customers 
LEFT JOIN Orders
USING (CustomerID) GROUP BY (Orders.CustomerID)
ORDER BY Customers.CustomerID;