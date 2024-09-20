USE tienda;

SELECT MIN(customer_number) AS numero_mas_bajo
FROM customers;

/* Selecciona el limite de crédito medio para los clientes de España.*/

SELECT AVG(credit_limit) AS limite_credito_medio
FROM customers
WHERE country = "Spain";

/*Selecciona el numero de clientes en Francia.*/

SELECT COUNT(customer_name) AS clientes_Francia
FROM customers
WHERE country = "France";

 /*Selecciona el máximo de crédito que tiene cualquiera de los clientes del empleado con número 1323.*/

SELECT MAX(credit_limit) AS credito_maximo_empleado_1323
FROM customers
WHERE sales_rep_employee_number = 1323;

SELECT MAX(credit_limit) AS credito_maximo_empleado_1323, customer_number, sales_rep_employee_number
FROM customers
GROUP BY customer_number
HAVING sales_rep_employee_number = 1323;

 /* ¿Cuál es el número máximo de empleado de la tabla customers?*/

SELECT MAX(sales_rep_employee_number) AS maximo_numero_empleado
FROM customers;

/*Realiza una consulta SELECT que seleccione el número de cada empleado de ventas, así como el numero de clientes distintos
 que tiene cada uno.*/

-- Opción 1 
SELECT sales_rep_employee_number, COUNT(DISTINCT customer_number) AS clientes_unicos
FROM customers
GROUP BY sales_rep_employee_number;

-- Opción 2. A falta de comprobar, pero no.
SELECT sales_rep_employee_number, COUNT(customer_number) AS clientes_unicos
FROM customers
GROUP BY sales_rep_employee_number;

-- Opción 3. A falta de comprobar, pero no.
SELECT DISTINCT sales_rep_employee_number, COUNT(customer_number) AS clientes_unicos
FROM customers
GROUP BY sales_rep_employee_number;

/*Selecciona el número de cada empleado de ventas que tenga más de 7 clientes distintos.*/

SELECT sales_rep_employee_number, COUNT(DISTINCT customer_number) AS empleado_con_mas_de_7_clientes_unicos
FROM customers
GROUP BY sales_rep_employee_number
HAVING empleado_con_mas_de_7_clientes_unicos > 7;


/*Selecciona el número de clientes en cada pais.*/

SELECT country, COUNT(customer_number) AS clientes_pais
FROM customers
GROUP BY country;

/* Selecciona aquellos países que tienen clientes de más de 3 ciudades diferentes.*/

SELECT country, COUNT(DISTINCT city) AS ciudades_distintas
FROM customers
GROUP BY country
HAVING ciudades_distintas > 3;

/* Selecciona el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno. */

SELECT sales_rep_employee_number, COUNT(DISTINCT customer_number) AS clientes_distintos_por_empleado,
	CASE 
		WHEN COUNT(DISTINCT customer_number) > 7 THEN "Alto Rendimiento"
        ELSE "Normal"
	END AS Rendimiento
FROM customers
GROUP BY sales_rep_employee_number;









