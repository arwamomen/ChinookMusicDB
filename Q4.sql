Select T.Name track_name, T.Composer, sum(IL.Quantity) as purch_count
From Track T
Join InvoiceLine IL
ON T.TrackID=IL.TrackId

WHERE Composer= (select Composer FROM (
Select Composer, sum(ILN.LineTotal) as comp_earnings
From Track T
Join ILN
On T.TrackID=ILN.TrackId
WHERE Composer NOT NULL
Group by 1
Order by 2 desc
Limit 1) )
Group by 1,2
order by 3 DESC
limit 5