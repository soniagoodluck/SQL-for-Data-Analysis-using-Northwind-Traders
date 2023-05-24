--write query showing the total revenue for each year,
--with different columns representing different product categories.

SELECT
    YEAR(o.orderDate) AS Year,
    
    SUM(CASE WHEN p.categoryID = 1 THEN od.unitPrice * od.quantity * (1 - od.discount) ELSE 0 END) AS Beverages_Revenue,
    SUM(CASE WHEN p.categoryID = 2 THEN od.unitPrice * od.quantity * (1 - od.discount) ELSE 0 END) AS Condiments_Revenue,
	SUM(CASE WHEN p.categoryID = 3 THEN od.unitPrice * od.quantity * (1 - od.discount) ELSE 0 END) AS Confections_Revenue,
    SUM(CASE WHEN p.categoryID = 4 THEN od.unitPrice * od.quantity * (1 - od.discount) ELSE 0 END) AS Dairy_Products_Revenue,
	SUM(CASE WHEN p.categoryID = 5 THEN od.unitPrice * od.quantity * (1 - od.discount) ELSE 0 END) AS Grains_Cereals_Revenue,
    SUM(CASE WHEN p.categoryID = 6 THEN od.unitPrice * od.quantity * (1 - od.discount) ELSE 0 END) AS Meat_Poultry_Revenue,
    SUM(CASE WHEN p.categoryID = 7 THEN od.unitPrice * od.quantity * (1 - od.discount) ELSE 0 END) AS Produce_Revenue,
    SUM(CASE WHEN p.categoryID = 8 THEN od.unitPrice * od.quantity * (1 - od.discount) ELSE 0 END) AS Seafood_Revenue
    
FROM
    orders o
    JOIN order_details od ON o.orderID = od.orderID
    JOIN products p ON od.productID = p.productID
GROUP BY
    YEAR(o.orderDate)
ORDER BY
    YEAR(o.orderDate);
