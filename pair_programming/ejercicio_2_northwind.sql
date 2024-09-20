-- 01 Productos más baratos y caros de nuestra BBDD:
-- Desde la división de productos nos piden conocer el precio de los productos que tienen el precio más alto y más bajo. Dales el alias lowestPrice y highestPrice.
SELECT MAX(unit_price) AS high_price, MIN(unit_price) AS low_price
FROM products;

/*
-- 02 Conociendo el numero de productos y su precio medio:
-- Adicionalmente nos piden que diseñemos otra consulta para conocer el número de productos y el precio medio de todos ellos 
(en general, no por cada producto).
*/

SELECT COUNT(product_id) AS numero_productos, AVG(unit_price) AS precio_medio
FROM products;

/*CODIGO
-- 03 Sacad la máxima y mínima carga de los pedidos de UK:
-- Nuestro siguiente encargo consiste en preparar una consulta que devuelva la máxima y mínima cantidad de carga para un pedido (freight) enviado a Reino Unido (United Kingdom).
CODIGO*/ 

SELECT MIN(freight), MAX(freight)
FROM orders;

SELECT MIN(freight) AS minima_carga, MAX(freight) AS maxima_carga
FROM orders
WHERE ship_country= "UK";

/*
-- 04 Qué productos se venden por encima del precio medio:
-- Después de analizar los resultados de alguna de nuestras consultas anteriores, desde el departamento de Ventas 
quieren conocer qué productos en concreto se venden por encima del
-- precio medio para todos los productos de la empresa, ya que sospechan que dicho número es demasiado elevado.
También quieren que ordenemos los resultados por su precio de mayor a menor.
-- :chincheta:NOTA: para este ejercicio puedes necesitar dos consultas separadas y usar el resultado de la primera 
para filtrar la segunda.*/

-- La media sería esto
SELECT AVG(unit_price) AS media_precio
FROM products;

-- Para darle el valor medio le paso la funcion 
SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price > (SELECT AVG(unit_price) FROM products);



/*
CODIGO
/*-- 05 Qué productos se han descontinuado:
-- De cara a estudiar el histórico de la empresa nos piden una consulta para conocer el número de productos que se han descontinuado. El atributo Discontinued es un booleano:
-- si es igual a 1 el producto ha sido descontinuado.*/ 

SELECT product_name, discontinued as productos_discontinuados
FROM products
WHERE discontinued = 1;

/*
-- 06 Detalles de los productos de la query anterior:
-- Adicionalmente nos piden detalles de aquellos productos no descontinuados, sobre todo el ProductID y ProductName. 
Como puede que salgan demasiados resultados, nos piden que
-- los limitemos a los 10 con ID más elevado, que serán los más recientes. 
No nos pueden decir del departamento si habrá pocos o muchos resultados, pero lo limitamos por si acaso.
*/

SELECT product_id, product_name
FROM products
WHERE discontinued = 0 
ORDER BY product_id DESC
LIMIT 10;


/*CODIGO
-- 07 Relación entre número de pedidos y máxima carga:
-- Desde logística nos piden el número de pedidos y la máxima cantidad de carga de entre los mismos (freight) 
que han sido enviados por cada empleado (mostrando el ID de empleado en cada caso).
*/ 

SELECT employee_id, COUNT(order_id) AS num_orders, MAX(freight) AS max_freight
FROM orders
GROUP BY employee_id;


/*
-- 08 Descartar pedidos sin fecha y ordénalos:
-- Una vez han revisado los datos de la consulta anterior, nos han pedido afinar un poco más el "disparo". 
En el resultado anterior se han incluido muchos pedidos cuya fecha de envío
-- estaba vacía, por lo que tenemos que mejorar la consulta en este aspecto. 
También nos piden que ordenemos los resultados según el ID de empleado para que la visualización sea más sencilla.
*/


SELECT employee_id, COUNT(order_id) AS num_orders, MAX(freight) AS max_freight
FROM orders
WHERE order_date IS NOT NULL
GROUP BY employee_id
ORDER BY employee_id;


/*
-- 09 Números de pedidos por día:
-- El siguiente paso en el análisis de los pedidos va a consistir en conocer mejor la distribución de los mismos según las fechas. 
Por lo tanto, tendremos que generar una consulta
-- que nos saque el número de pedidos para cada día, mostrando de manera separada el día (DAY()), el mes (MONTH()) y el año (YEAR()).
*/




/*
-- 10 Número de pedidos por mes y año:
-- La consulta anterior nos muestra el número de pedidos para cada día concreto, pero esto es demasiado detalle. Genera una modificación de la consulta anterior para que agrupe
-- los pedidos por cada mes concreto de cada año.
CODIGO
-- 11 Seleccionad las ciudades con 4 o más empleadas:
-- Desde recursos humanos nos piden seleccionar los nombres de las ciudades con 4 o más empleadas de cara a estudiar la apertura de nuevas oficinas.
CODIGO
-- 12 Cread una nueva columna basándonos en la cantidad monetaria:
-- Necesitamos una consulta que clasifique los pedidos en dos categorías ("Alto" y "Bajo") en función de la cantidad monetaria total que han supuesto: por encima o por debajo de 2000 euros.
CODIGO 