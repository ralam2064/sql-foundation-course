SELECT
    c.CustomerId, 
    c.FirstName, 
    c.LastName, 
    c.City, 
    c.Company
FROM Customer AS c
WHERE c.Company IS NOT NULL
--WHERE c.City IN ('London', 'Paris','Berlin', 'Rome')
-- c.LastName NOT LIKE '%r'
ORDER BY c.Company;

SELECT TOP 5
    c.Country,
    COUNT (*) AS NumberofCustomers
FROM Customer AS c
GROUP BY c.Country
ORDER BY NumberofCustomers DESC;

SELECT i.InvoiceId,
       i.InvoiceDate,
       i.CustomerId,
       i.Total,
       i.*
FROM   Invoice AS i
order by i.CustomerId;
 
SELECT
    i.CustomerId,i.BillingCountry,
    SUM(i.Total) As InvoiceTotal
FROM   Invoice AS i
group by I.CustomerId,i.BillingCountry
order by i.CustomerId;
 