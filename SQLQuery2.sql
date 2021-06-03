
--SELECT	s.Title,
--		a.ArtistName
--FROM Artist a
--	JOIN Song s on a.id = s.ArtistId;

-- 1. 
--Query all of the entries in the Genre table

--SELECT * FROM Genre;


-- 2. 
-- Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords

--SELECT * FROM Artist ORDER BY ArtistName DESC;


-- 3.
-- Write a SELECT query that lists all the songs in the Song table and include the Artist name

/*
SELECT	s.Title,
		a.ArtistName
FROM Song s
	JOIN Artist a on s.ArtistId = a.id
*/


-- 4. 
-- Write a SELECT query that lists all the Artists that have a Pop Album

/*
SELECT	ArtistName
FROM	Artist
Join	Album	on	Album.ArtistId	=	Artist.Id
Join	Genre	on	Genre.Id		=	Album.GenreId
Where	Genre.Id	=	7;
*/


-- 5.
-- Write a SELECT query that lists all the Artists that have a Jazz or Rock Album

/*
SELECT	ArtistName
FROM	Artist
Join	Album	on	Album.ArtistId	=	Artist.Id
Join	Genre	on	Genre.Id		=	Album.GenreId
Where	Genre.Id	=	4	OR	Genre.Id	=	2;
*/


-- 6.
-- Write a SELECT statement that lists the Albums with no songs

/*
SELECT Album.Title 
From Album 
Left Join Song on Song.albumId = Album.id 
WHERE Song.id IS null;
*/


-- 7.
-- Using the INSERT statement, add one of your favorite artists to the Artist table.

/*
INSERT INTO Artist (ArtistName, YearEstablished) 
Values ('Talking Heads', 1975);
*/


-- 8.
-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.

--INSERT INTO ALBUM (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Little Creatures', '6/10/1985', 2318, 'Sire', 28, 7 );
/*
SELECT al.Title, al.ReleaseDate, al.AlbumLength, al.Label, a.ArtistName, g.Name
FROM Album al
JOIN Artist a on al.ArtistId = a.id
JOIN Genre g on al.GenreId = g.id;
*/


-- 9.
-- Using the INSERT statement, add some songs that are on that album to the Song table.

--INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Road To Nowhere', 259, '6/10/1985', 7,28,23);
--Select s.Id, s.Title, s.SongLength, s.ReleaseDate, g.Name, a.ArtistName, al.Title From Song s JOIN Artist a on s.ArtistId = a.id JOIN Genre g on s.GenreId = g.id JOIN Album al on s.AlbumId = al.id;


-- 10.
-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

--SELECT s.Title Song, al.Title Album, a.artistName Artist From Album al Join Song s On al.ID = s.AlbumId Join Artist a on a.Id = al.ArtistId Where a.ArtistName = 'Talking Heads'; 


-- 11.
-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

--SELECT al.Title Album, Count(s.ID) Number_Of_Songs  FROM Album al JOIN Song s ON al.Id = s.AlbumId GROUP BY al.title;


-- 12.
-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

--SELECT a.ArtistName Artist, Count(s.ID) Number_Of_Songs FROM Artist a JOIN Song s ON a.Id = s.ArtistId GROUP BY a.ArtistName;


-- 13.
-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

--SELECT g.Name Music_Genre, Count(s.ID) Number_Of_Songs FROM Genre g Join Song s ON g.Id = s.GenreId GROUP BY g.Name;




-- 14.
-- Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword

/*
SELECT 
COUNT(distinct al.label) as "# of Record Labels",
a.ArtistName Artist

FROM Artist a 

LEFT JOIN Album al ON a.Id = al.ArtistId

GROUP BY a.ArtistName 
HAVING COUNT(distinct al.Label) > 1
*/


-- 15.
-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

--SELECT al.Title Album, al.albumlength Length FROM Album al WHERE al.albumlength = (SELECT MAX(al.albumlength) FROM Album al); 


-- 16.
-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

--SELECT s.Title Song, s.SongLength Length FROM Song s WHERE s.songlength = (SELECT MAX(SongLength) FROM Song);


-- 17.
-- Modify the previous query to also display the title of the album.

--SELECT s.Title Song, s.Songlength Length, al.Title Album FROM Song s JOIN album al ON s.AlbumId =al.Id WHERE s.songlength = (SELECT MAX(SongLength) FROM Song);