-- Books in an Order
SELECT 
	Books.Title,
    COUNT(Orders.BookID) AS AmountOrdered
FROM Orders
JOIN Books
ON Books.BookID = Orders.BookID
GROUP BY Books.BookID
HAVING COUNT(Orders.BookID)>1