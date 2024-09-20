USE northwind;
 /* 1.  Extraed los pedidos con el máximo "order_date" para cada empleado. 
 
 Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado.
Para eso nos pide que lo hagamos con una query correlacionada.

*/

-- Trabajamos con orders.


-- Seleccionar PEDIDOS de ORDERS DONDE
-- el order_date de este empleado = max (order_date) de este empleado 


SELECT order_id, customer_ID, employee_id, order_date, required_date
FROM orders AS OM
WHERE order_date IN (
	SELECT MAX(order_date)
    FROM orders AS OS
    WHERE OM.employee_id = OS.employee_id
); 




  /*2. Extraed el precio unitario máximo (unit_price) de cada producto vendido. 
  Supongamos que ahora nuestro jefe quiere un informe de los productos vendidos y su precio unitario.
  De nuevo lo tendréis que hacer con queries correlacionadas. */
  
  SELECT DISTINCT product_id, unit_price
  FROM order_details OD_E
  WHERE unit_price = (
	  SELECT MAX(unit_price)
	  FROM order_details OD_S
	  WHERE OD_E.product_id = OD_S.product_id);
  

  /*3. Extraed información de los productos "Beverages" En este caso nuestro jefe nos pide que le devolvamos toda la información 
  necesaria para identificar un tipo de producto. En concreto, tienen especial
interés por los productos con categoría "Beverages". Devuelve el ID del producto, el nombre del producto y su ID de categoría. */

SELECT product_id, product_name, category_id
FROM products
WHERE category_id = (
	SELECT category_id
    FROM categories
    WHERE category_name = "Beverages"
);

-- Opción 2. Yael

SELECT product_id,product_name,category_id
FROM products
WHERE category_id = "Beverages" IN ( 
	SELECT category_name 
    FROM categories
    WHERE categories.category_id = products.category_id
    );


  /*4. Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país. 
  
  Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes, entonces
podría dirigirse a estos países para buscar proveedores adicionales. */

SELECT DISTINCT country
FROM customers
WHERE country NOT IN (
	SELECT DISTINCT country
    FROM suppliers
	);

-- Opción 2. Yael

SELECT DISTINCT country
FROM customers
WHERE country NOT IN (
	SELECT country
    FROM suppliers
    WHERE suppliers.country = customers.country
);


  /*5. Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread". 
  
  Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos del producto "Grandma's Boysenberry Spread"
(ProductID 6) en un solo pedido. */

SELECT order_id, customer_id
FROM orders
WHERE order_id IN (
	SELECT order_id
	FROM order_details
	WHERE quantity > 20 AND product_id = (
		SELECT product_id
		FROM products
		WHERE product_name = "Grandma's Boysenberry Spread")
        );
        
-- Opcion 2. Yael

SELECT customer_id, order_id
FROM orders
WHERE order_id IN (SELECT order_details.order_id
				   FROM order_details
				   WHERE order_details.product_id = 6 AND order_details.quantity > 20);  -- > Grandma's Boysenberry Spread 
    

 /*6. Qué producto es más popular. Extraed cuál es el producto que más ha sido comprado y la cantidad que se compró. */

 
SELECT product_id, product_name
FROM products
WHERE product_id IN (
	SELECT product_id 
	FROM order_details
	WHERE product_id IN (
		 SELECT product_id
		 FROM order_details AS od1
		 WHERE quantity = (
			 SELECT MAX(quantity)
			 FROM order_details AS od2
			 WHERE od1.product_id = od2.product_id)
 ));

 -- 
SELECT product_id 
FROM order_details
WHERE product_id IN (
	 SELECT product_id
	 FROM order_details AS od1
	 WHERE quantity = (
		 SELECT MAX(quantity)
		 FROM order_details AS od2
		 WHERE od1.product_id = od2.product_id)
 );
 
 
 