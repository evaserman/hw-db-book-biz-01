-- Books in an Order
SELECT 
	Books.Title,
    COUNT(*) AS AmountOrdered
FROM Orders
JOIN Books
ON Books.BookID = Orders.BookID
GROUP BY Books.BookID