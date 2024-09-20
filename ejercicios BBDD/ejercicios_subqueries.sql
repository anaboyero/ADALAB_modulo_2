USE tienda;

-- EJERCICIO 1:
-- Calcula el numero de clientes por cada ciudad.

SELECT city, COUNT(customer_number) AS num_clientes_por_ciudad
FROM customers
GROUP BY city;


-- EJERCICIO 2:
-- Usando la consulta anterior como subconsulta, selecciona la ciudad con el mayor numero de clientes.

SELECT city
FROM customers
GROUP BY city
HAVING COUNT(customer_number) >= ALL (
				SELECT COUNT(customer_number) AS num_clientes_por_ciudad
				FROM customers
				GROUP BY city
);


-- EJERCICIO 3:
-- Por último, usa todas las consultas anteriores para seleccionar el customerNumber, nombre y apellido de las clientas
--  (entiendo que es de los contactos o de las empleadas) asignadas 
-- a la ciudad con mayor numero de clientas.


-- Este primer paso funciona

SELECT city, customer_number, contact_first_name, contact_last_name, sales_rep_employee_number
FROM customers
WHERE city IN (
				SELECT city
				FROM customers
				GROUP BY city
				HAVING COUNT(customer_number) >= ALL (
								SELECT COUNT(customer_number) AS num_clientes_por_ciudad
								FROM customers
								GROUP BY city
				)
);


-- Ahora hago un join con la tabla de empleadas a través de la columna employee number

SELECT city, customers.customer_number, customers.contact_first_name, customers.contact_last_name, customers.sales_rep_employee_number, employees.first_name, employees.last_name
FROM customers
JOIN employees ON
	employees.employee_number = customers.sales_rep_employee_number
WHERE city IN (
				SELECT city
				FROM customers
				GROUP BY city
				HAVING COUNT(customer_number) >= ALL (
								SELECT COUNT(customer_number) AS num_clientes_por_ciudad
								FROM customers
								GROUP BY city
				)
);


-- EJERCICIO 4:
-- Queremos ver ahora que empleados tienen algún contrato asignado con alguno de los clientes existentes. 
-- Para ello selecciona employeeNumber como 'Número empleado', firstName como 'nombre Empleado' y lastName como 'Apellido Empleado'


-- Aquí lo he hecho con el join. 
SELECT DISTINCT employees.employee_number AS 'Número empleado', employees.first_name AS 'nombre Empleado', employees.last_name AS 'Apellido Empleado'
FROM employees
INNER JOIN customers 
	ON employees.employee_number = customers.sales_rep_employee_number
;

-- Y esta con subconsulta

SELECT employees.employee_number AS 'Número empleado', employees.first_name AS 'nombre Empleado', employees.last_name AS 'Apellido Empleado'
FROM employees
WHERE employees.employee_number IN (
			SELECT sales_rep_employee_number
            FROM customers
            
);



-- EJERCICIO 5:
-- Queremos ver ahora en cuantas ciudades en las cuales tenemos clientes, no también una oficina de nuestra empresa 
-- para ello: Selecciona aquellas ciudades como 'ciudad' y los nombres de las empresas como 'nombre de la empresa ' 
-- de la tabla customers, sin repeticiones, que no tengan una oficina en dicha ciudad de la tabla offices.

SELECT city AS 'ciudad', customer_name AS 'nombre de la empresa'
FROM customers
WHERE city NOT IN (
				SELECT city
                FROM offices
);

