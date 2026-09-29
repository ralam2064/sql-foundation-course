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
 
 SELECT
    i.CustomerId,
    c.FirstName,c.LastName,
    concat(c.FirstName,' ',c.LastName) AS CustomerName,
    SUM(i.Total) AS InvoiceTotal,
    COUNT (*) AS NumberOfInvoices
FROM   Invoice AS i
INNER JOIN
    Customer AS c
ON i.CustomerId = c.CustomerId
group by i.CustomerId,c.FirstName,c.LastName, concat(c.FirstName,' ',c.LastName)
order by i.CustomerId;


SELECT
    IBC.CustomerId,
    c.FirstName,
    c.LastName,
    concat(c.FirstName,' ',c.LastName) AS CustomerName,
    IBC.InvoiceTotal,
    IBC.NumberOfInvoices
FROM (
    SELECT
    i.CustomerId,
    SUM(i.Total) AS InvoiceTotal,
    COUNT(*) AS NumberOfInvoices
FROM   Invoice AS i
group by i.CustomerId) AS IBC JOIN Customer AS c ON IBC.CustomerId = c.CustomerId
--Customer and Employees

SELECT
       ibc.CustomerId,
       c.FirstName,
       c.LastName,
       CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
       ibc.InvoiceTotal,
       ibc.NumberOfInvoices
FROM   (SELECT   i.CustomerId,
                 SUM(i.Total) AS InvoiceTotal,
                 COUNT(*) AS NumberOfInvoices
        FROM     Invoice AS i
        GROUP BY i.CustomerId) AS ibc
       INNER JOIN
       Customer AS c
       ON ibc.CustomerId = c.CustomerId;

SELECT
       ibc.CustomerId,
       CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
       CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
       ibc.InvoiceTotal,
       ibc.NumberOfInvoices
FROM   (SELECT   i.CustomerId,
                 SUM(i.Total) AS InvoiceTotal,
                 COUNT(*) AS NumberOfInvoices
        FROM     Invoice AS i
        GROUP BY i.CustomerId) AS ibc
       INNER JOIN
       Customer AS c
       ON ibc.CustomerId = c.CustomerId
       JOIN Employee e ON c.SupportRepId = e.EmployeeId