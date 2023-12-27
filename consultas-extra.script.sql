-- Listar las pistas (tabla Track)
SELECT *
  FROM LemonMusic.dbo.Track

-- Listar las pistas (tabla Track) con precio mayor o igual a 1€
SELECT *
  FROM LemonMusic.dbo.Track T
  WHERE T.UnitPrice >= 1;


-- Listar las pistas de más de 4 minutos de duración
SELECT *
  FROM LemonMusic.dbo.Track T
  WHERE T.Milliseconds > 240000;

-- Listar las pistas que tengan entre 2 y 3 minutos de duración
SELECT *
  FROM LemonMusic.dbo.Track T
  WHERE T.Milliseconds BETWEEN 120000 AND 180000;

-- Listar las pistas que uno de sus compositores (columna Composer) sea Mercury
SELECT *
  FROM LemonMusic.dbo.Track T
  WHERE T.Composer LIKE '%Mercury%';

-- Calcular la media de duración de las pistas (Track) de la plataforma
SELECT AVG(T.Milliseconds)
  FROM LemonMusic.dbo.Track T

-- Listar los clientes (tabla Customer) de USA, Canada y Brazil
SELECT C.CustomerId, C.FirstName, C.LastName
  FROM LemonMusic.dbo.Customer C
  WHERE C.Country IN ('Brazil','Canada','USA');

-- Listar todas las pistas del artista 'Queen' (Artist.Name = 'Queen')
SELECT *
  FROM LemonMusic.dbo.Track T
  WHERE T.Composer LIKE '%Queen%';

--Listar las pistas del artista 'Queen' en las que haya participado como compositor David Bowie
SELECT *
  FROM LemonMusic.dbo.Track T
  WHERE T.Composer LIKE '%Queen%' AND T.Composer LIKE '%David Bowie%';

--Listar todo de PlaylistTrak 
SELECT *
FROM LemonMusic.dbo.PlaylistTrack PT

--Listar todo de Playlist
SELECT *
FROM LemonMusic.dbo.Playlist P

--Listar las pistas de la playlist 'Heavy Metal Classic' id '17'
SELECT PT.PlaylistId, T.*
FROM LemonMusic.dbo.PlaylistTrack PT
INNER JOIN LemonMusic.dbo.Track T ON PT.TrackId = T.TrackId
WHERE PT.PlaylistId = '17';

--Listar las pistas de la playlist 'Heavy Metal Classic' sin usar id
SELECT PT.PlaylistId, P.[Name] AS NamePlaylist, T.*
FROM LemonMusic.dbo.PlaylistTrack PT
INNER JOIN LemonMusic.dbo.Track T ON PT.TrackId = T.TrackId
INNER JOIN LemonMusic.dbo.Playlist P ON PT.PlaylistId = P.PlaylistId
WHERE P.[Name] LIKE 'Heavy Metal Classic';

--Listar las playlist junto con el TrackId de cada pista que contienen
SELECT P.*, PT.TrackId
FROM LemonMusic.dbo.Playlist P
INNER JOIN LemonMusic.dbo.PlaylistTrack PT ON PT.PlaylistId = P.PlaylistId

--Listar las playlist junto con el número de pistas que contienen
SELECT PT.PlaylistId, P.[Name] AS PlaylistName, COUNT(PT.TrackId) AS NumberOfTracks
FROM LemonMusic.dbo.PlaylistTrack PT
INNER JOIN LemonMusic.dbo.Playlist P ON PT.PlaylistId = P.PlaylistId
GROUP BY PT.PlaylistId, P.[Name];
 
-- Listar las playlist (sin repetir ninguna) que tienen alguna canción de AC/DC
SELECT DISTINCT P.PlaylistId, P.[Name] AS NamePlayList
  FROM LemonMusic.dbo.Track T
  INNER JOIN LemonMusic.dbo.PlaylistTrack PT ON PT.TrackId = T.TrackId
  INNER JOIN LemonMusic.dbo.Playlist P ON P.PlaylistId = PT.PlaylistId
  WHERE T.Composer LIKE '%AC/DC%' 

-- Listar las playlist que tienen alguna canción del artista Queen, junto con la cantidad que tienen
SELECT   P.PlaylistId, COUNT(*) AS QuantityOfSongs
  FROM LemonMusic.dbo.Track T
  INNER JOIN LemonMusic.dbo.PlaylistTrack PT ON PT.TrackId = T.TrackId
  INNER JOIN LemonMusic.dbo.Playlist P ON P.PlaylistId = PT.PlaylistId
  WHERE T.Composer LIKE 'Queen' 
  GROUP BY P.PlaylistId;

-- Listar pistas que no están en ninguna playlist
SELECT *
FROM LemonMusic.dbo.Track T
LEFT JOIN LemonMusic.dbo.PlaylistTrack PT ON PT.TrackId = T.TrackId
WHERE PT.PlaylistId IS NULL;

-- Listar los artistas que no tienen album
SELECT A.ArtistId, A.Name AS ArtistName
FROM LemonMusic.dbo.Artist A
LEFT JOIN LemonMusic.dbo.Album Al ON A.ArtistId = Al.ArtistId
WHERE Al.ArtistId IS NULL;

-- Listar los artistas con el número de albums que tienen
SELECT Ar.ArtistId, Ar.Name AS ArtistName, COUNT(Al.AlbumId) AS AlbumsQuantity
FROM LemonMusic.dbo.Artist Ar
LEFT JOIN LemonMusic.dbo.Album Al ON Ar.ArtistId = Al.ArtistId
GROUP BY Ar.ArtistId, Ar.Name;
-- nota Leo: "En una consulta con GROUP BY, debes incluir en la cláusula GROUP BY todas las columnas que seleccionas y que no están en funciones de agregación."

-- ######################################################################
-- #################      EXTRA			#################################
-- ######################################################################

-- Listar las pistas ordenadas por el número de veces que aparecen en playlists de forma descendente
SELECT T.TrackId, T.Name AS TrackName, T.Composer, T.Milliseconds, T.Bytes, T.UnitPrice,
COUNT(T.TrackId) AS TrackCount
FROM LemonMusic.dbo.Track T
LEFT JOIN LemonMusic.dbo.PlaylistTrack PT ON T.TrackId = PT.TrackId
GROUP BY T.TrackId, T.Name, T.Composer, T.Milliseconds, T.Bytes, T.UnitPrice
ORDER BY TrackCount DESC, T.TrackId;

-- Listar las pistas más compradas (la tabla InvoiceLine tiene los registros de compras)
SELECT IL.TrackId, COUNT (*) AS CountTrackPurchased
FROM LemonMusic.dbo.InvoiceLine IL
GROUP BY IL.TrackId
ORDER BY CountTrackPurchased DESC, IL.TrackId


-- Listar los artistas más comprados
SELECT T.Composer, COUNT (*) AS CountComposerPurchased
  FROM LemonMusic.dbo.InvoiceLine I
  INNER JOIN LemonMusic.dbo.Track T ON T.TrackId = I.TrackId
  GROUP BY T.Composer
  ORDER BY CountComposerPurchased DESC

-- Listar las pistas que aún no han sido compradas por nadie
SELECT *
  FROM LemonMusic.dbo.InvoiceLine I
  RIGHT JOIN LemonMusic.dbo.Track T ON T.TrackId = I.TrackId
  WHERE I.InvoiceLineId IS NULL;
---####################################################################################

-- Listar los artistas que aún no han vendido ninguna pista
