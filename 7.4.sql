-- Book royalties per author
SELECT Books.Title, 
        Authors.AuthorID,
        ROUND(Publishers.Royalties * Books.Price / (COALESCE((CASE WHEN Books.Author1 IS NOT NULL THEN 1 ELSE 0 END), 0)
    + COALESCE((CASE WHEN Books.Author2 IS NOT NULL THEN 1 ELSE 0 END), 0)
    + COALESCE((CASE WHEN Books.Author3 IS NOT NULL THEN 1 ELSE 0 END), 0)), 2)  AS RoyaltyPerBook$
FROM Books
JOIN Authors 
ON Books.Author1 = Authors.AuthorID
OR Books.Author2 = Authors.AuthorID
OR Books.Author3 = Authors.AuthorID
JOIN Publishers
ON Books.PublisherID = Publishers.PublisherID
GROUP BY Authors.AuthorID