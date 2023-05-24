--Write a SQL query using SQL server,
--generate a monthly sales report with
--total sales for each product category 
--as columns and months as rows.

SELECT
    DATEPART(MONTH, o.orderDate) AS [Month],
    SUM(CASE WHEN p.categoryID = 1 THEN od.quantity * od.unitPrice ELSE 0 END) AS 'Beverages',
    SUM(CASE WHEN p.categoryID = 2 THEN od.quantity * od.unitPrice ELSE 0 END) AS 'Condiments',
    SUM(CASE WHEN p.categoryID = 3 THEN od.quantity * od.unitPrice ELSE 0 END) AS 'Confections',
	SUM(CASE WHEN p.categoryID = 4 THEN od.quantity * od.unitPrice ELSE 0 END) AS 'Dairy Products',
    SUM(CASE WHEN p.categoryID = 5 THEN od.quantity * od.unitPrice ELSE 0 END) AS 'Grains & Cereals',
    SUM(CASE WHEN p.categoryID = 6 THEN od.quantity * od.unitPrice ELSE 0 END) AS 'Meat & Poultry',
	SUM(CASE WHEN p.categoryID = 7 THEN od.quantity * od.unitPrice ELSE 0 END) AS 'Produce',
    SUM(CASE WHEN p.categoryID = 8 THEN od.quantity * od.unitPrice ELSE 0 END) AS 'Seafood'
    
    -- Add more SUM(CASE...) expressions for additional product categories
FROM
    orders o
    JOIN order_details od ON o.orderID = od.orderID
    JOIN products p ON od.productID = p.productID
GROUP BY
    DATEPART(MONTH, o.orderDate)
ORDER BY
    DATEPART(MONTH, o.orderDate);
