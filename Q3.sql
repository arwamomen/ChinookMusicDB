Select STRFTIME('%Y', InvoiceDate) AS YEAR, al.Title album_title, sum(IL.Quantity) as purch_count

From Invoice I

join InvoiceLine IL
on I.InvoiceID=IL.InvoiceId

join Track T
on T.TrackID=IL.TrackId

join Album al
on T.Albumid=al.AlbumId


Group by 1,2
HAVING STRFTIME('%Y', InvoiceDate)=
  (SELECT max(STRFTIME('%Y', InvoiceDate))
   FROM invoice)
order by 3 desc
limit 5
