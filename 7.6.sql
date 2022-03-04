-- Books Published by a Publisher
SELECT 
	Publishers.PublisherID,
    Publishers.PublisherName,
    COUNT(*) AS BookCount
FROM Publishers
JOIN Books
ON Books.PublisherID = Publishers.PublisherID
GROUP BY Publishers.PublisherName
ORDER BY Publishers.PublisherID
LIMIT 100