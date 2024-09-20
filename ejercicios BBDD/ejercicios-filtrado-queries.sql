--  Los ejercicios planteados para hoy son:

USE tienda;

-- Selecciona los apellidos que se encuentren en ambas tablas para employees y customers, con alias 'Apellidos'.

SELECT contact_last_name AS 'Apellidos'
FROM customers
WHERE contact_last_name IN (
	SELECT last_name
    FROM employees
);


-- Selecciona los nombres con alias 'nombre' y apellidos, con alias 'Apellidos' tanto de los clientes como de los empleados de las tablas employees y customers.

-- Selecciona todos los nombres con alias 'nombre' y apellidos, con alias 'Apellidos' tanto de los clientes como de los empleados de las tablas employees y customers.

-- Queremos ver ahora el employee_number como 'Número empleado', first_n_ame como 'nombre Empleado' y last_name como 'Apellido Empleado' para los empleados con employee_number: 1002,1076,1088 y 1612.

-- Queremos ver ahora la 'ciudad' y los nombres de las empresas como 'nombre de la empresa ' de la tabla customers, que no estén en: Ireland, France, Germany.

-- Encuentra los campos nombre del cliente y ciudad, de aquellas ciudades de la tabla de customers que terminen en 'on'.

-- Encuentra los campos nombre del cliente, ciudad de aquellas ciudades de la tabla de customers que terminen en 'on' y que unicamente sean de longitud 4.

-- Encuentra el nombre del cliente, primera dirección y ciudad de aquellas ciudades que contengan el número 3 en su dirección postal (o lo que es lo mismo, su primera dirección).

-- Encuentra el nombre del cliente, primera dirección y ciudad de aquellas ciudades que contengan el número 3 en su dirección postal y la ciudad no empiece por T.

-- Selecciona, haciendo uso de expresiones regulares, los campos nombre del cliente, primera dirección y ciudad. Unicamente en el caso que la dirección postal, posea algún número en dicho campo. 