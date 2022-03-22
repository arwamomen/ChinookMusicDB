select STRFTIME('%Y',InvoiceDate) as year, E.FirstName, E.LastName, count(*) inv_count

from Customer C
join Employee E
on C.SupportRepId=E.EmployeeId
join Invoice I
on C.Customerid=I.CustomerId

group by 1,2,3

having STRFTIME('%Y',InvoiceDate)= (select max(STRFTIME('%Y',InvoiceDate)) from invoice)
order by 4 desc