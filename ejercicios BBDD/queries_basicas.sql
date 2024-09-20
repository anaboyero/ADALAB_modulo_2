CREATE SCHEMA leccion_queries_basicas;
USE leccion_queries_basicas;

CREATE TABLE alumnas (
id_alumna INT AUTO_INCREMENT,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
email VARCHAR(30) NOT NULL,
telefono VARCHAR(10),
direccion VARCHAR(100) ,
ciudad VARCHAR(30),
pais VARCHAR(20),
PRIMARY KEY (id_alumna)
);

INSERT INTO alumnas (nombre, apellido, email, telefono, direccion, ciudad, pais)
VALUES 
('Ana', 'González', 'ana@adalab.es', '654785214', 'Calle Alumna 1', 'Madrid', 'España'), 
('María', 'López', 'maria@adalab.es', '689656322', 'Calle Alumna 2', 'Madrid', 'España'),
('Lucía', 'Ramos', 'lucia@adalab.es', '674459123', 'Calle Alumna 2', 'Madrid', 'España'),
('Elena', 'Bueno', 'elena@adalab.es', '628546577', 'Calle Alumna 2', 'Madrid', 'España'),
('Rocío', 'García', 'rocio@adalab.es', '616365624', 'Calle Alumna 2', 'Paris', 'Francia');


SELECT nombre
FROM alumnas;

SELECT nombre, apellido
FROM alumnas
WHERE pais = 'Francia';

SELECT telefono, direccion
FROM alumnas
WHERE NOT pais = "España" ;

SELECT ciudad, pais
FROM alumnas
WHERE telefono <> '674459123';

SELECT * 
FROM alumnas
ORDER BY apellido ASC;

UPDATE alumnas
SET direccion = "Calle Alumna 3"
WHERE id_alumna = 3;

SELECT DISTINCT pais
FROM alumnas;

SELECT *
FROM alumnas
LIMIT 2 OFFSET 2;

SELECT *
FROM alumnas
WHERE nombre BETWEEN 'Ana' AND 'Lucía';

UPDATE alumnas
SET direccion = "Calle Alumna 4"
WHERE id_alumna = 4;

UPDATE alumnas
SET direccion = "Calle Alumna 5"
WHERE id_alumna = 5;

SELECT nombre, apellido
FROM alumnas
WHERE ciudad IN ('Madrid', 'Barcelona', 'Amsterdam');

SELECT nombre, apellido
FROM alumnas
WHERE ciudad IN ('París', 'Barcelona', 'Amsterdam');

SELECT nombre AS name
FROM alumnas AS students;

