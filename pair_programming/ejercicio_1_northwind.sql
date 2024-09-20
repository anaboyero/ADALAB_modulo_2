CREATE SCHEMA northwind;

/* 4. Conociendo a las empleadas:

El objetivo de cualquier buena jefa (o trabajadora) en una empresa debería ser conocer bien a sus compañeras. 
Para lograrlo, vamos a diseñar una consulta SQL para obtener una lista con los datos de las empleadas y empleados de la empresa Northwind. 
Esta consulta incluirá los campos id, last_name y first_name.
*/

SELECT first_name, last_name, employee_id
FROM employees
;

/*Conociendo los productos más baratos:

Supongamos que en nuestro primer día en la empresa nos informan que están llevando a cabo una reestructuración del negocio. 
Nuestras compañeras nos comentan que, en estos momentos, Northwind tiene una amplia gama de productos en venta, algunos de los cuales 
tienen un éxito limitado entre las clientas.

Nuestra primera tarea consiste en identificar aquellos productos (tabla products) cuyos precios por unidad 
oscilen entre 0 y 5 dólares, es decir, los productos más asequibles.*/

SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price BETWEEN 0 AND 5;

/*
Conociendo los productos que no tienen precio:

Para comprobar si los datos en la tabla products están correctos, nos interesa seleccionar aquellos productos que no tengan precio, 
porque lo hayan dejado vacio al introducir los datos (NULL).*/

SELECT product_id, product_name
FROM products
WHERE unit_price IS NULL;

/* 
Comparando productos:

Ahora obtén los datos de aquellos productos con un precio menor a 15 dólares, 
pero sólo aquellos que tienen un ID menor que 20 (para tener una muestra significativa pero no tener que ver 
todos los productos existentes).

💡 Pista 💡 Recuerda que podemos incluir varias condiciones en el WHERE.*/ 

SELECT * 
FROM products
WHERE unit_price <15 AND product_ID <20;


/*Cambiando de operadores:

Ahora vamos a hacer la misma consulta que en ejercicio anterior, pero haciendo invirtiendo el uso de los operadores 
y queremos saber aquellos que tengan un precio superior a 15 dólares y un ID superior a 20. */

SELECT * 
FROM products
WHERE NOT unit_price <15 AND NOT product_ID <20;

/* 
Conociendo los paises a los que vendemos:

A Northwind le interesa conocer los datos de los países que hacen pedidos (orders) para focalizar el negocio en esas regiones y 
al mismo tiempo crear campañas de marketing para conseguir mejorar en las otras regiones. 

Realiza una consulta para obtener ese dato. */

SELECT DISTINCT ship_country
FROM orders;

/*Conociendo el tipo de productos que vendemos en Northwind:

Crea una consulta que muestre los primeros 10 productos según su ID y que nos indique el nombre de dichos productos y sus precios.*/

SELECT product_id, product_name, unit_price
FROM products
LIMIT 10;

/*
Ordenando los resultados:

Ahora realiza la misma consulta pero que nos muestre los últimos 10 productos según su ID de manera descendiente.*/

SELECT product_id, product_name, unit_price
FROM products
ORDER BY product_id DESC
LIMIT 10;

/*Que pedidos tenemos en nuestra BBDD:

Últimamente ha habido algo de descontrol en la empresa a la hora de controlar los pedidos. 
Nos interesa conocer los distintos pedidos que hemos tenido (mostrar los valores únicos de ID en la tabla order_details).*/

SELECT DISTINCT order_id, product_id
FROM order_details;


/*Qué pedidos han gastado más:

Una vez hemos inspeccionado el tipo de pedidos que tenemos en la empresa, desde la dirección nos piden conocer 
los 3 pedidos que han supuesto un mayor ingreso para la empresa. 
Crea una columna en esta consulta con el alias ImporteTotal. Nota: Utiliza unit_price y quantity para calcular el importe total.*/


SELECT DISTINCT order_id, product_id, (unit_price*quantity) AS importe_total
FROM order_details
ORDER BY importe_total DESC
LIMIT 3;

/*Los pedidos que están entre las posiciones 5 y 10 de nuestro ranking:

Ahora, no sabemos bien por qué razón, desde el departamento de Ventas nos piden seleccionar el ID de los pedidos situados 
entre la 5 y la 10 mejor posición en cuanto al coste económico total ImporteTotal.

💡 Pista 💡 Usa LIMIT y OFFSET para mostrar los resultados.*/

SELECT DISTINCT order_id, product_id, (unit_price*quantity) AS importe_total
FROM order_details
ORDER BY importe_total DESC
LIMIT 5 OFFSET 5;

SELECT DISTINCT order_id, product_id, (unit_price*quantity) AS importe_total
FROM order_details
ORDER BY importe_total DESC
LIMIT 10;

/* Qué categorías tenemos en nuestra BBDD:

De cara a ver cómo de diversificado está el negocio, se nos solicita una lista de las categorías 
que componen los tipos de pedido de la empresa. 
Queremos que la lista de resultado sea renombrada como "NombreDeCategoria".*/

SELECT DISTINCT category_id AS "NombreDeCategoria"
FROM products;








