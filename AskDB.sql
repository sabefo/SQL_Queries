
-- El total de ordenes del cliente con el ID 3
select count(OrderID)
from Orders
where CustomerID = 3;

-- El total de ordenes del cliente con el ContactName igual a 'Jim Wood'
select count(OrderID)
from Orders o, Customers c
where o.CustomerID = c.CustomerID and
	  c.ContactName = 'Jim Wood';

-- El total de ordenes del cliente con CompanyName igual a 'Slots Carpet'
select count(OrderID)
from Customers c, Orders o
where c.CompanyName = 'Slots Carpet' and
	  o.CustomerID = c.CustomerID;

-- El total de ordenes de cada compañía ordenado de manera descendente
select CompanyName, count(OrderID)
from Customers c, Orders o
where o.CustomerID = c.CustomerID
group by CompanyName
order by count(OrderID) DESC;

-- El total de ordenes de cada compañía ordenado de manera ascendente
select CompanyName, count(OrderID)
from Customers c, Orders o
where o.CustomerID = c.CustomerID
group by CompanyName
order by count(OrderID) ASC;

-- La compañía con el mayor número de ordenes
select CompanyName, count(OrderID)
from Customers c, Orders o
where o.CustomerID = c.CustomerID
group by CompanyName
order by count(OrderID) DESC
limit 1;

-- La suma total de piezas que fueron ordenadas por cada compañía.
select CompanyName, sum(Quantity)
from Customers c, Orders o, OrderDetails od
where c.CustomerID = o.CustomerID and
	  o.OrderID = od.OrderID
group by CompanyName
order by Quantity ASC;

-- El monto total en pesos de la orden con ID 4
select OrderID, UnitPrice*Quantity as MontoTotal
from  OrderDetails
where OrderID = 4;

-- El monto total en pesos de cada orden
select OrderID, sum(UnitPrice*Quantity) as MontoTotal
from  OrderDetails
group by OrderID;

-- La consulta del inciso anterior pero únicamente mostrando aquellas ordenes 
-- que sean mayores a $1,000.00 pesos
select OrderID, sum(UnitPrice*Quantity) as MontoTotal
from  OrderDetails
group by OrderID
having sum(UnitPrice*Quantity) > 1000;

-- El total de piezas en cada orden
select OrderID, sum(Quantity) as TotalItems
from  OrderDetails
group by OrderID;


























