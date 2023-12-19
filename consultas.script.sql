-- Listar las pistas (tabla Track)
SELECT *
  FROM LemonMusic.dbo.Track

-- Listar las pistas (tabla Track) con precio mayor o igual a 1€
SELECT *
  FROM LemonMusic.dbo.Track T
  WHERE T.UnitPrice >= 1;


-- Listar las pistas de más de 4 minutos de duración
SELECT T.Milliseconds
  FROM LemonMusic.dbo.Track T
  WHERE T.Milliseconds > 240000;

-- Listar las pistas que tengan entre 2 y 3 minutos de duración
SELECT T.Milliseconds
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
SELECT *
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

--Listar las pistas de la playlist 'Heavy Metal Classic' id 
SELECT *
FROM LemonMusic.dbo.PlaylistTrack PT
INNER JOIN LemonMusic.dbo.Track T ON PT.TrackId = T.TrackId
WHERE PT.PlaylistId = '17';

--Listar las playlist junto con el TrackId de cada pista que contienen
SELECT *
FROM LemonMusic.dbo.Playlist P
INNER JOIN LemonMusic.dbo.PlaylistTrack PT ON PT.PlaylistId = P.PlaylistId

--Listar las playlist junto con el número de pistas que contienen
SELECT PT.PlaylistId, COUNT(PT.TrackId) AS NumberOfTracks
FROM LemonMusic.dbo.PlaylistTrack PT
GROUP BY PT.PlaylistId;

SELECT *
FROM LemonMusic.dbo.PlaylistTrack
