CREATE SCHEMA `tienda_zapatillas`;
USE `tienda_zapatillas`;

/* Carácteristicas de nuestras tablas
Tabla Zapatillas: tiene 3 columnas: id_zapatilla, modelo, color con las siguientes características:
id_zapatilla: es una clave primaria de tipo int, autoincremental y no nula.
modelo: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
color: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula. */

CREATE TABLE zapatillas (
	id_zapatilla INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    modelo VARCHAR (45) NOT NULL,
    color VARCHAR (45) NOT NULL
);

/* Tabla Clientes: tiene 9 columnas id_cliente, nombre, numero_telefono, email, direccion, ciudad, provincia, pais, codigo_postal con las siguientes características:
id_cliente: es una clave primaria de tipo int, autoincremental y no nula.
nombre: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
numero_telefono: es integer, no nula.
email: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
direccion: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
ciudad: es una cadena de caracteres de longitud máxima de 45 caracteres, puede ser nula.
provincia: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
pais: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
codigo_postal: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.*/

CREATE TABLE clientes (
	id_cliente INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    numero_telefono INT NOT NULL,
    email VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    ciudad VARCHAR(45),
    provincia VARCHAR(45) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    codigo_postal VARCHAR(45) NOT NULL
    
);


/* Tabla Empleados: tiene 5 columnas id_empleado, nombre, tienda, salario, fecha_incorporacion con las siguientes características:
id_empleado: es una clave primaria de tipo int, autoincremental y no nula.
nombre: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
tienda: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
salario: es int, puede ser nula. fecha_incorporacion: es una columna de tipo date, no nula.*/

CREATE TABLE empleados (
	id_empleado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    tienda VARCHAR(45) NOT NULL,
    salario INT,
    fecha_incorporacion DATE NOT NULL 
);

/* Tabla Facturas: tiene 6 columnas id_factura ,numero de factura, fecha, id_empleado, id_cliente, id_zapatilla, con las siguientes características:
id_factura: es una clave primaria de tipo int, autoincremental y no nula.
numero_factura: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
fecha: es una columna de tipo date, no nula.
id_zapatilla: es una clave foránea de tipo int, no nula
id_empleado: es una clave foránea de tipo int, no nula.
id_cliente: es una clave foránea de tipo int, no nula. */

CREATE TABLE facturas (
    id_facturas INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    numero_factura VARCHAR(45) NOT NULL,
    fecha DATE NOT NULL,
    id_zapatilla INT NOT NULL,  
    id_empleado INT NOT NULL,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_facturas_zapatillas
		FOREIGN KEY (id_zapatilla)
		REFERENCES zapatillas (id_zapatilla)
		ON DELETE CASCADE 
		ON UPDATE CASCADE,
        
	CONSTRAINT fk_facturas_empleados
		FOREIGN KEY (id_empleado)
		REFERENCES empleados (id_empleado)
		ON DELETE CASCADE 
		ON UPDATE CASCADE,
        
	CONSTRAINT fk_facturas_clientes
		FOREIGN KEY (id_cliente)
		REFERENCES clientes (id_cliente)
		ON DELETE CASCADE 
		ON UPDATE CASCADE

);
