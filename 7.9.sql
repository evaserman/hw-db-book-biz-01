-- Books in an Order
SELECT OrderID, COUNT(OrderID) AS BooksPerOrder
FROM Orders
GROUP BY OrderID