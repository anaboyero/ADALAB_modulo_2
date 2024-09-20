CREATE SCHEMA creacion_tablas;
USE creacion_tablas;

-- Voy a crear una tabla. Esto es un comentario de una línea

/* Este es un comentario en bloque. 
Puedo escribir varias líneas de texto aquí. */


CREATE TABLE empleadas (
id_empleada INT, 
salario FLOAT,
nombre VARCHAR (255),
apellido VARCHAR (45),
pais VARCHAR (45)
);

CREATE TABLE personas (
    id INT NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    nombre VARCHAR(255),
    edad INT,
    ciudad VARCHAR(255) DEFAULT 'Madrid'
);

CREATE TABLE personas2 (
    id INT NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    nombre VARCHAR(255),
    edad INT,
    ciudad varchar(255) DEFAULT 'Madrid',
    CONSTRAINT adulto CHECK (edad>17)
);

CREATE TABLE empleadas_en_proyectos (
id_empleada INT, 
id_proyecto INT,
PRIMARY KEY (id_empleada, id_proyecto),
FOREIGN KEY (id_empleada) REFERENCES Empleadas, 
FOREIGN KEY (id_proyecto) REFERENCES Proyectos
); 



