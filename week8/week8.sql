CREATE OR REPLACE 
VIEW usa_customers(CustomerID, CustomerName, Address) AS 
SELECT c.CustomerID, c.CustomerName, c.Address
FROM customers c
WHERE c.Country = "USA";

SELECT *
FROM usa_customers uc
JOIN orders o ON uc.CustomerID = o.CustomerID;


CREATE OR REPLACE
VIEW products_below_avg AS 
SELECT * 
FROM products
WHERE price < (SELECT AVG(price) FROM products);

SELECT * FROM products_below_avg;


