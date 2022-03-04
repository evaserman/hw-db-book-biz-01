-- Editors Per Book
SELECT
  Books.Title,
	(
      COALESCE((CASE WHEN Books.Editor1ID IS NOT NULL THEN 1 ELSE 0 END), 0)
    + COALESCE((CASE WHEN Books.Editor2ID IS NOT NULL THEN 1 ELSE 0 END), 0)
    + COALESCE((CASE WHEN Books.Editor3ID IS NOT NULL THEN 1 ELSE 0 END), 0)
  ) AS EditorsPerBook
FROM Books