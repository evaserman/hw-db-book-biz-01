-- Books per author --
SELECT 
	Authors.AuthorID,
    Authors.FirstName,
    Authors.LastName,
    COUNT(*) AS BookCount
FROM Authors
JOIN Books
ON Books.Author1 = Authors.AuthorID
OR Books.Author2 = Authors.AuthorID
OR Books.Author3 = Authors.AuthorID
GROUP BY Authors.AuthorID
ORDER BY Authors.AuthorID