USE northwind;
/* 0. Para esta práctica te hara falta crear en algunos de los ejercicios una columna temporal. Para ver como funciona esta creación de columnas temporales 
prueba el siguiente código:*/
SELECT  'Hola!'  AS tipo_nombre
FROM customers;

/* 1. Ciudades que empiezan con "A" o "B".
Por un extraño motivo, nuestro jefe quiere que le devolvamos una tabla con aquelas compañias que están afincadas en ciudades que empiezan por "A" o "B". 
Necesita que le devolvamos la ciudad, el nombre de la compañia y el nombre de contacto.*/
SELECT city, company_name AS "Company Name", contact_name AS "Contact Name"
FROM customers
WHERE city LIKE "A%" OR city LIKE "B%";  -- Opción 1

SELECT city, company_name AS "Company Name", contact_name AS "Contact Name"
FROM customers 
WHERE city IN (
	SELECT city
    FROM customers
    WHERE city LIKE "A%" OR city LIKE "B%"); -- Opción 2


/* 2. Número de pedidos que han hecho en las ciudades que empiezan con L.
En este caso, nuestro objetivo es devolver los mismos campos que en la query anterior el número de total de pedidos que han hecho todas las ciudades que empiezan por "L".*/
SELECT city AS Ciudad, company_name AS Empresa, contact_name AS Persona_Contacto, COUNT(order_id) AS Numero_Pedidos
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
WHERE city LIKE "L%"
GROUP BY city, company_name, contact_name; -- Opción 1

SELECT city AS Ciudad, company_name AS Empresa, contact_name AS Persona_Contacto, COUNT(order_id) AS Numero_Pedidos
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
WHERE city IN (
SELECT city
FROM customers
WHERE city LIKE "L%")
GROUP BY city, company_name, contact_name; -- Opción 2 

/* 3. Todos los clientes cuyo "country" no incluya "USA".
Nuestro objetivo es extraer los clientes que no sean de USA. Extraer el nombre de contacto, su pais y el nombre de la compañia.*/
SELECT contact_name, country, company_name
FROM customers
WHERE country NOT IN ("USA");

SELECT contact_name, country, company_name
FROM customers
WHERE country NOT LIKE "USA";

/* 4. Todos los clientes que no tengan una "A" en segunda posición en su nombre. Devolved unicamente el nombre de contacto.*/
SELECT contact_name
FROM customers
WHERE contact_name NOT LIKE "_A%"; -- Opción 1

SELECT contact_name
FROM customers
WHERE contact_name REGEXP '^.[^A]'; -- Opción 2

SELECT contact_name
FROM customers
WHERE contact_name NOT REGEXP "^.{1}A";  -- Opción 3