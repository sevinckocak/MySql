set @country = "Spain" ;
select @country;
call select_customers_by_country(@country);
select @country;

select * from shippers;

SELECT COUNT(o.orderid)
FROM orders o
JOIN shippers s ON o.shipperid = s.shipperid
WHERE s.shippername = "Speedy Express" ; 
set @order_cnt = 0;
select @order_cnt;
call order_count_by_shipper("United Package",@order_cnt);


SELECT SUM(p.price * od.quantity)
FROM Orders o 
JOIN OrderDetails od ON o.orderid = od.orderid
JOIN Products p ON p.productid=od.productid
WHERE o.customerid = 5;

SET @total = 0;
select @total;
call calculate_total_sales(7, @total)

