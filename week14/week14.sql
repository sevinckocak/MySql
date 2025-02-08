#retrieve total quantity ordered per customer
SELECT c.CustomerName, sum(od.Quantity) as TotalQuantity
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID , c.CustomerName
Order by TotalQuantity DESC;

#retrieve total quantity ordered for a customer
SELECT c.CustomerName, sum(od.Quantity) as TotalQuantity
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
where c.CustomerID = 3
GROUP BY c.CustomerID , c.CustomerName
Order by TotalQuantity DESC;


# get total revenue by category

SELECT cat.CategoryID, cat.CategoryName, SUM(od.Quantity * p.Price) AS TotalRevenue
FROM Categories cat 
JOIN Products p ON cat.CategoryID = p.CategoryID
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY cat.CategoryID
ORDER BY TotalRevenue;