USE tienda;

-- EJERCICIO 1
-- Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando CROSS JOIN.

SELECT e.employee_number AS ID_empleada, e.last_name AS Apellido_empleada, c.customer_number 
FROM employees AS e
JOIN customers AS c
	ON e.employee_number = c.sales_rep_employee_number;


-- EJERCICIO 2
-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando CROSS JOIN.

SELECT employee_number, customer_number
FROM employees
CROSS JOIN customers;

SELECT employee_number, first_name, last_name, COUNT(customer_number)
FROM employees 
CROSS JOIN customers 
	ON employee_number = sales_rep_employee_number
GROUP BY employee_number
HAVING COUNT(customer_number) > 8;
 
-- EJERCICIO 3
-- Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando CROSS JOIN.

SELECT last_name AS apellido, first_name AS nombre, COUNT(country) AS num_paises
FROM employees
CROSS JOIN customers
	ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employee_number  
HAVING num_paises > 1;

-- EJERCICIO 4
-- Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando INNER JOIN.

SELECT e.employee_number, e.last_name AS apellido_empleada, e.first_name AS nombre_empleada, c.customer_number
FROM employees AS e
INNER JOIN customers AS c
	ON e.employee_number = c.sales_rep_employee_number ;


-- EJERCICIO 5
-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando INNER JOIN.

SELECT e.employee_number, e.last_name AS apellido_empleada, e.first_name AS nombre_empleada, COUNT(customer_number) AS num_clientes
FROM employees AS e
INNER JOIN customers AS c
	ON e.employee_number = c.sales_rep_employee_number 
GROUP BY e.employee_number
HAVING COUNT(customer_number) > 8
    ;
    

-- EJERCICIO 6
-- Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando INNER JOIN.


SELECT last_name AS apellido, first_name AS nombre, COUNT(country) AS num_paises
FROM employees
INNER JOIN customers
	ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employee_number  
HAVING num_paises > 1;

-- EJERCICIO 7
-- Selecciona el ID, nombre, apellidos de todas las empleadas y el ID de cada cliente asociado a ellas 
-- (si es que lo tienen).

SELECT e.employee_number, e.last_name AS apellido_empleada, e.first_name AS nombre_empleada, customer_number
FROM employees AS e
LEFT JOIN customers AS c
		ON e.employee_number = c.sales_rep_employee_number; 

-- EJERCICIO 8
-- Selecciona el ID de todos los clientes, y el nombre, apellidos de las empleadas que llevan sus pedidos (si es que las hay).

SELECT e.employee_number, e.last_name AS apellido_empleada, e.first_name AS nombre_empleada, customer_number
FROM employees AS e
RIGHT JOIN customers AS c
		ON e.employee_number = c.sales_rep_employee_number; 

-- EJERCICIO 9
-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando LEFT JOIN.

SELECT e.employee_number, e.last_name AS apellido_empleada, e.first_name AS nombre_empleada, COUNT(customer_number) AS num_clientes
FROM employees AS e
LEFT JOIN customers AS c
		ON e.employee_number = c.sales_rep_employee_number
GROUP BY e.employee_number
HAVING num_clientes > 8;

	

-- EJERCICIO 10
-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando RIGHT JOIN.

SELECT e.employee_number, e.last_name AS apellido_empleada, e.first_name AS nombre_empleada, COUNT(customer_number) AS num_clientes
FROM customers AS c
RIGHT JOIN employees AS e
		ON e.employee_number = c.sales_rep_employee_number
GROUP BY e.employee_number
HAVING num_clientes > 8;


-- EJERCICIO 11
-- Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando LEFT JOIN.

SELECT e.last_name AS apellido_empleada, e.first_name AS nombre_empleada, COUNT(country) AS num_paises
FROM employees AS e
LEFT JOIN customers AS c
			ON e.employee_number = c.sales_rep_employee_number
GROUP BY e.employee_number
HAVING num_paises >1; 


