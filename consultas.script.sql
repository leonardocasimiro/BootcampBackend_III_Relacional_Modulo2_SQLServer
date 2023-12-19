-- Listar las pistas (tabla Track)
SELECT *
  FROM LemonMusic.dbo.Track

-- Listar las pistas (tabla Track) con precio mayor o igual a 1€
SELECT T.UnitPrice
  FROM LemonMusic.dbo.Track T
  WHERE T.UnitPrice > 1;


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

