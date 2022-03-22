with MTN as ( select MediaTypeId,Name as file_format
from MediaType
)

Select MTN.file_format , sum(IL.Quantity) as purch_count

From InvoiceLine IL
join Track T
on T.TrackID=IL.TrackId
join MTN
on T.MediaTypeID=MTN.MediaTypeId

Group by 1
