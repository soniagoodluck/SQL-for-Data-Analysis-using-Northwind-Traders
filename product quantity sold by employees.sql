--Display the quantity of each product 
--sold by each employee, with employees 
--as rows and products as columns.

SELECT
    e.employeeID,
    e.employeeName,
    
    SUM(CASE WHEN od.productID = 1 THEN od.quantity ELSE 0 END) AS Beverages_Quantity,
    SUM(CASE WHEN od.productID = 2 THEN od.quantity ELSE 0 END) AS Condiments_Quantity,
	SUM(CASE WHEN od.productID = 3 THEN od.quantity ELSE 0 END) AS Confections_Quantity,
    SUM(CASE WHEN od.productID = 4 THEN od.quantity ELSE 0 END) AS Dairy_Products_Quantity,
	SUM(CASE WHEN od.productID = 5 THEN od.quantity ELSE 0 END) AS Grains_Cereals_Quantity,
    SUM(CASE WHEN od.productID = 6 THEN od.quantity ELSE 0 END) AS Meat_Poultry_Quantity,
    SUM(CASE WHEN od.productID = 7 THEN od.quantity ELSE 0 END) AS Produce_Quantity,
    SUM(CASE WHEN od.productID = 8 THEN od.quantity ELSE 0 END) AS Seafood_Quantity
    
FROM
    employees e
    LEFT JOIN orders o ON e.employeeID = o.employeeID
    LEFT JOIN order_details od ON o.orderID = od.orderID
    LEFT JOIN products p ON od.productID = p.productID
GROUP BY
    e.employeeID, e.employeeName
ORDER BY
    e.employeeID;
