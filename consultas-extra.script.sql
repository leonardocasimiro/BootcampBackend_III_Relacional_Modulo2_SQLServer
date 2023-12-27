
-- ######################################################################
-- #################      EXTRA			#################################
-- ######################################################################

-- Listar las pistas ordenadas por el n�mero de veces que aparecen en playlists de forma descendente
SELECT T.TrackId, T.Name AS TrackName, T.Composer, T.Milliseconds, T.Bytes, T.UnitPrice,
COUNT(T.TrackId) AS TrackCount
FROM LemonMusic.dbo.Track T
LEFT JOIN LemonMusic.dbo.PlaylistTrack PT ON T.TrackId = PT.TrackId
GROUP BY T.TrackId, T.Name, T.Composer, T.Milliseconds, T.Bytes, T.UnitPrice
ORDER BY TrackCount DESC, T.TrackId;

-- Listar las pistas m�s compradas (la tabla InvoiceLine tiene los registros de compras)
SELECT IL.TrackId, COUNT (*) AS CountTrackPurchased
FROM LemonMusic.dbo.InvoiceLine IL
GROUP BY IL.TrackId
ORDER BY CountTrackPurchased DESC, IL.TrackId


-- Listar los artistas m�s comprados
SELECT T.Composer, COUNT (*) AS CountComposerPurchased
  FROM LemonMusic.dbo.InvoiceLine I
  INNER JOIN LemonMusic.dbo.Track T ON T.TrackId = I.TrackId
  GROUP BY T.Composer
  ORDER BY CountComposerPurchased DESC

-- Listar las pistas que a�n no han sido compradas por nadie
SELECT *
  FROM LemonMusic.dbo.InvoiceLine I
  RIGHT JOIN LemonMusic.dbo.Track T ON T.TrackId = I.TrackId
  WHERE I.InvoiceLineId IS NULL;
---####################################################################################

-- Listar los artistas que a�n no han vendido ninguna pista
