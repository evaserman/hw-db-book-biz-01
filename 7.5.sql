-- Books in a Genre
SELECT DISTINCT
Genre,
COUNT(Genre)
FROM 
Books
GROUP BY Genre
HAVING COUNT(Genre)>1