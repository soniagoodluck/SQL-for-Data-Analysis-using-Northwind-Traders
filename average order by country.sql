--Calculate the average order value for 
--each product category, with different 
--columns representing different customer Country.


DECLARE @CountryColumns AS NVARCHAR(MAX);
DECLARE @DynamicSQL AS NVARCHAR(MAX);

-- Generate the column list for each country
WITH CountryCTE AS (
    SELECT DISTINCT country
    FROM customers
)
SELECT @CountryColumns = STUFF(
    (
        SELECT ', AVG(CASE WHEN c.country = ''' + country + ''' THEN od.unitPrice * od.quantity ELSE NULL END) AS ' + QUOTENAME(country)
        FROM CountryCTE
        ORDER BY country
        FOR XML PATH('')
    ), 1, 2, ''
);

-- Generate the dynamic SQL query
SET @DynamicSQL = '
SELECT
    p.categoryID,
    AVG(od.unitPrice * od.quantity) AS AverageOrderValue,
    ' + @CountryColumns + '
FROM
    orders o
    JOIN order_details od ON o.orderID = od.orderID
    JOIN products p ON od.productID = p.productID
    JOIN customers c ON o.customerID = c.customerID
GROUP BY
    p.categoryID
ORDER BY
    p.categoryID;
';

-- Execute the dynamic SQL query
EXEC sp_executesql @DynamicSQL;
