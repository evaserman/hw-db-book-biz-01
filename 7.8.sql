-- Books per Editor
SELECT 
	Editors.EditorID,
    Editors.FirstName,
    Editors.LastName,
    COUNT(*) AS BookCount
FROM Editors
JOIN Books
ON Books.Editor1ID = Editors.EditorID
OR Books.Editor2ID = Editors.EditorID
OR Books.Editor3ID = Editors.EditorID
GROUP BY Editors.EditorID
ORDER BY Editors.EditorID