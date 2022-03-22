with MTN as ( select MediaTypeId,Name, CASE WHEN Name like '%audio%' THEN 'audio' ELSE 'video' END AS file_format 
from MediaType
)

Select MTN.file_format , sum(IL.Quantity) as purch_count

From InvoiceLine IL
join Track T
on T.TrackID=IL.TrackId
join MTN
on T.MediaTypeID=MTN.MediaTypeId

Group by 1
