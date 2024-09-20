CREATE SCHEMA ejercicios_3;
USE ejercicios_3;

CREATE TABLE t1 (a INTEGER, b CHAR(10));

/* Ejercicios clase invertida */


-- 1. Renombra la tabla t1 a t2 */

ALTER TABLE t1 RENAME t2; 

-- 2. Cambia la columna a de tipo INTEGER a tipo TINYINT NOT NULL (manteniendo el mismo nombre para la columna).*/ 

ALTER TABLE t2 
MODIFY COLUMN a TINYINT NOT NULL; 

-- 3. Cambia la columna b de tipo CHAR de 10 caracteres a CHAR de 20 caracteres. Además, renombra la columna como c. 

-- Puedo hacerlo en dos intrucciones (rename y modify) o directamente con: CHANGE nombreviejo nombrenuevo tipo_dato;

ALTER TABLE t2
CHANGE b c CHAR(20);

-- 4. Añade una nueva columna llamada d de tipo TIMESTAMP.

ALTER TABLE t2
ADD COLUMN d TIMESTAMP;

-- 5. Elimina la columna c que definiste en el ejercicio 3.

ALTER TABLE t2
DROP COLUMN c;

-- 6. Crea una tabla llamada t3 idéntica a la tabla t2 (de manera automática, no definiéndola columna a columna).

CREATE TABLE t3 LIKE t2;

-- 7. Elimina la tabla original t2 y en otra sentencia renombra la tabla t3 como t1.

DROP TABLE t2;

ALTER TABLE t3 
RENAME t1;  

 /*Para los siguientes ejercicios vamos a usar las tablas ya creadas llamadas customers (clientes/as) y employees, 
 que están en la base de datos tienda. Crea una copia de la tabla Customers, ya que vamos a modificar los datos originales de dicha tabla. */
CREATE TABLE customers_mod2 LIKE customers;


CREATE TABLE IF NOT EXISTS customers_mod 
SELECT * 
FROM tienda.customers; 

/*Vamos a desactivar el modo seguro para poder realizar los ejercicios posteriores. 
Para ello: Pestaña Editar -> Preferencias -> Editor SQL -> Deseleccionar la opción de Actualizaciones segura 
(rechaza UPDATEs y DELETEs sin restricciones) -> 
Desconéctate del servidor y vuelve a conectarte o alternativamente cierra MySQL y vuelve a abrirlo.*/ 

/* 8. Realiza una inserción de datos sobre la tabla customers introduciendo la siguiente información. */

INSERT INTO customers_mod (customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (343, 'Adalab', 'Rodriguez', 'Julia', '672986373', 'Calle Falsa 123', 'Puerta 42', 'Madrid', 'España', 28000, 'España', 15, 20000000 );


/* Realiza una inserción de datos sobre la tabla customers introduciendo la siguiente información. 
Fíjate que ahora no tenemos toda la información.*/

INSERT INTO customers_mod (customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (344, 'La pegatina After', 'Santiago', 'Maricarmen', '00000000', 'Travesía del rave', NULL, 'Palma de Mallorca', NULL, 07005, 'España', 10, 45673453 );

/* Introduce ahora 5 filas nuevas con la información que consideres relevante para los campos disponibles en una misma instrucción. 4
Se recuerda que el Indice(=la clave primaria), no es necesaria especificarla. 
En 3 de las nuevas filas debes dejar vacio el campo 'contactFirstName'
*/

UPDATE customers_mod 
SET address_line1='Polígono Industrial de Son Castelló', address_line2='Nave 92', state = 'España', postal_code = 28123, sales_rep_employee_number = 25, credit_limit = 5000000
WHERE customer_number = 344; 

-- Desde aquí Carla

-- Romper la tabla. No está poniendo el WHERE, así que hará la actualización con todo.

UPDATE customers_mod 
SET addressline1 = 'Vamos', 
    addressline2 = 'a', 
    postalcode = 'fastidiar', 
    country = 'la tabla :)';

-- 14. Actualizar los primeros 10 clientes para que sean gestionados por la representante de ventas número 2
UPDATE customers_mod 
SET salesrepemployeenumber = 2 
WHERE customernumber IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

-- 15. Eliminar registros con NULL en ContactFirstName
DELETE FROM customers_mod 
WHERE contactfirstname IS NULL;

-- 16. Ejecutar un DELETE sin WHERE (¡Cuidado! Esto eliminará todos los registros de la tabla)
DELETE FROM customers_mod;
/* */
/* */
/* */
/* 

Actualiza ahora los datos faltantes correspondientes al CustomerName 'La pegatina After' con la siguiente información.

addressline1: Polígono Industrial de Son Castelló

addressline2: Nave 92

city: Palma de Mallorca

state: España

postalcode:28123

country: España

salesrepemployeenumber: 25

creditlimit: 5000000

Vamos ahora a romper a propósito la tabla con la que estamos trabajando, para ello primero vamos a realizar una copia de la misma antes de ejecutar lo siguiente. Con el nombre customers_destroy.

Para ello hacemos uso de la herramienta de exportación de datos de MySQL, como se explicaba en las guías del módulo 0 para la exportación y la importación de datos.

Una vez creada la copia y guardada a buen recaudo, vamos a actualizar algunos de los cambios sin especificar la condición del WHERE. Para ello modifica el campo los siguientes campos de

addressline1: Vamos

addressline2: a

postalcode: fastidiar

country: la tabla :)

Tras esto restaura la tabla que has trasteado con la copia que te has creado previamente.

Actualiza ahora los datos de la tabla customers_mod, para que las 10 primeras empresas sean gestionadas por la representante de ventas numero 2. El resto de empresas no deben ser modificadas.

Queremos ahora eliminar de los datos de la tabla aquellos registros que contengan un 'null' en el campo 'ContactFirstName'.

Ejecuta la instrucción de DELETE para la tabla customers_mod olvidando el WHERE como condición. Y observa lo que ha ocurrido.
 */ 













/*   

 /* */  /* */  /* */  /* */  /* */  /* */  /* */  /* */  /* 




*/