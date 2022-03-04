-- Author royalties on a book
SELECT Books.Title, 
		Books.Price, 
        Publishers.PublisherName, 
        Publishers.Royalties AS RoyaltyAmount, 
        ROUND(Publishers.Royalties * Books.Price, 2)  AS RoyaltyforBook$
FROM Books
JOIN Publishers
ON Books.PublisherID = Publishers.PublisherID
ORDER BY Publishers.PublisherID