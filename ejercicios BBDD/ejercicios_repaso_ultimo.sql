USE northwind;

-- Ejercicios pair programming de la clase de joins.

/* Pedidos por empresa en UK:
Desde las oficinas en UK nos han pedido con urgencia que realicemos una consulta a la base de datos con la que podamos conocer 
cuántos pedidos ha realizado cada empresa cliente de UK. 
Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.
*/ 
DESCRIBE orders;
DESCRIBE customers;

-- EJERCICIO 1. 
-- Agrupar pedidos por empresa-cliente de UK
-- Dar el ID del cliente y el nombre de la empresa y el número de pedidos.

SELECT customers.customer_id, customers.company_name, COUNT(orders.order_id) AS num_pedidos
FROM customers
JOIN orders
	ON orders.customer_id = customers.customer_id
WHERE customers.country = 'UK'
GROUP BY customers.customer_id, customers.company_name;
;

-- Correcto.

/* 
DESCRIBE orders; -- order_id, order_date, customer_id
DESCRIBE order_details; -- order_id, quantity
DESCRIBE customers;  -- customer_id, 

*/

/* EJERCICIO 2. Cuántos objetos ha pedido cada empresa cliente de UK durante cada año. 
Nos piden concretamente conocer el nombre de la empresa, el año, y la cantidad de objetos que han pedido. 
Para ello hará falta hacer 2 joins.*/

SELECT c.company_name, YEAR(o.order_date) AS anyo_pedido, SUM(od.quantity) AS total_objetos
FROM customers AS c
INNER JOIN orders AS o
	ON c.customer_id = o.customer_id
INNER JOIN order_details AS od
	ON od.order_id = o.order_id
WHERE c.country = 'UK'
GROUP BY c.company_name, YEAR(o.order_date);

-- Correcto.

-- EJERCICIO 3. Pedidos que han realizado cada compañía y su fecha:
-- Desde la central nos han pedido una consulta que indique el nombre de cada compañia cliente 
-- junto con cada pedido que han realizado y su fecha.

SELECT o.order_id, c.company_name, o.order_date
FROM customers AS c
LEFT JOIN orders AS o
	ON c.customer_id = o.customer_id;

-- Correcto.

-- EJERCICIO 4. Tipos de producto vendidos:
-- Ahora nos piden una lista con cada tipo de producto que se han vendido, sus categorías, 
-- nombre de la categoría y el nombre del producto, y el total de dinero por el que se ha vendido 
-- cada tipo de producto (teniendo en cuenta los descuentos).

SELECT 
    products.product_name, 
    categories.category_name, 
    order_details.quantity,
    order_details.unit_price,
    order_details.discount
   --  (order_details.unit_price*order_details.quantity)*(1-order_details.discount) AS suma_total
FROM order_details
JOIN products
	ON order_details.product_id = products.product_id
JOIN categories 
	ON products.category_id = categories.category_id ;
-- GROUP BY products.product_id;



    




