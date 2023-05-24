--write a query to generate a matrix showing the number
--of orders placed by each customer, with months as
--columns and customers as rows.

SELECT
    customerID,
    [1] AS January,
    [2] AS February,
    [3] AS March,
	[4] AS April,
	[5] AS May,
	[6] AS June,
	[7] AS July,
	[8] AS August,
	[9] AS September,
	[10] AS October,
	[11] AS November,
	[12] AS December

FROM (
    SELECT
        c.customerID,
        MONTH(o.orderDate) AS OrderMonth
    FROM
        customers c
        JOIN orders o ON c.customerID = o.customerID
) AS SourceTable
PIVOT (
    COUNT(OrderMonth)
    FOR OrderMonth IN ([1], [2], [3], [4],[5],[6],[7],[8],[9],[10],[11],[12])
    
) AS PivotTable;
