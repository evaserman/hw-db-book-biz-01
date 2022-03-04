-- Authors per Book
SELECT
  Books.Title,
  (
    COALESCE((CASE WHEN Books.Author1 IS NOT NULL THEN 1 ELSE 0 END), 0)
    + COALESCE((CASE WHEN Books.Author2 IS NOT NULL THEN 1 ELSE 0 END), 0)
    + COALESCE((CASE WHEN Books.Author3 IS NOT NULL THEN 1 ELSE 0 END), 0)
  ) AS AuthorsPerBook,
  Books.Author1,
  Books.Author2,
  Books.Author3
FROM Books
JOIN Authors 
ON Books.Author1 = Authors.AuthorID
OR Books.Author2 = Authors.AuthorID
OR Books.Author3 = Authors.AuthorID
GROUP BY Books.Title;
update Books 
set Books.Author1 = Authors.FirstName;
