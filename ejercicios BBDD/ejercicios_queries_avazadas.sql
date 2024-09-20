USE tienda;

/* Ejercicios:
En este ejercicio vamos a usar una tabla ya creada llamada customers (clientes/as), que está en la base de datos tienda.

Realiza una consulta SELECT que obtenga el número identificativo de cliente más bajo de la base de datos.
*/

SELECT MIN(customer_number)
FROM customers;

/* Selecciona el limite de crédito medio para los clientes de España.*/

SELECT AVG(credit_limit)
FROM customers;

/*Selecciona el numero de clientes en Francia.*/

SELECT COUNT(country) AS num_clientes_francia
FROM customers
WHERE country = "France";

 /*Selecciona el máximo de crédito que tiene cualquiera de los clientes del empleado con número 1323.*/
 
 SELECT MAX(credit_limit) 
 FROM customers
 WHERE customer_number = 1323;
 

 /* ¿Cuál es el número máximo de empleado de la tabla customers?*/
 
 SELECT MAX(customer_number)
 FROM customers;

/*Realiza una consulta SELECT que seleccione el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno.*/

SELECT sales_rep_employee_number, COUNT(*) AS clientes_distintos
FROM customers
GROUP BY sales_rep_employee_number
ORDER BY sales_rep_employee_number DESC;

/*Selecciona el número de cada empleado de ventas que tenga más de 7 clientes distintos.*/

SELECT sales_rep_employee_number, COUNT(*) AS clientes_distintos
FROM customers
GROUP BY sales_rep_employee_number
HAVING clientes_distintos > 7;

/* Selecciona el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno. 
Asigna una etiqueta de "AltoRendimiento" a aquellos empleados con mas de 7 clientes distintos.*/

-- SELECT sales_rep_employee_number, clientes_distintos, COUNT(*) AS clientes_distintos
-- CASE 
-- 	WHEN clientes_distintos > 7 THEN "AltoRendimiento"
-- 	END AS calificar_rendimiento
-- FROM customers
-- GROUP BY sales_rep_employee_number;-- 


/*Selecciona el número de clientes en cada pais.*/

SELECT country, COUNT(*) AS clientes_por_pais
FROM customers
GROUP BY country;


/* Selecciona aquellos países que tienen clientes de más de 3 ciudades diferentes.*/

SELECT country, city AS COUNT(*) AS cliente_por_ciudad
FROM customers
GROUP BY country
HAVING cliente_por_ciudad > 3;