/*
	Jorge Lázaro Ruiz
    
    Programa de Formación de Becarios de Future Space (febrero 2024)
    
    Ejercicio MySQL 1: Creación e inserción de tablas
*/

CREATE DATABASE IF NOT EXISTS jlazaro;	# Base de datos donde almacenaremos la tabla
USE jlazaro;

DROP TABLE IF EXISTS automoviles;
CREATE TABLE automoviles (	-- `NOT NULL` indica que el campo es obligatorio
    codigo INT(2) UNSIGNED AUTO_INCREMENT PRIMARY KEY,	-- Clave primaria que se genera automáticamente
    marca VARCHAR(80) NOT NULL,
    precio DECIMAL(8 , 2 ) UNSIGNED NOT NULL,
    fecha DATE
);


## Paso 1
INSERT INTO automoviles VALUES(null, 'Peugeot', 32000, '2023-09-23');
INSERT INTO automoviles VALUES(null, 'Opel', 25500.5, '2022-09-19');
INSERT INTO automoviles VALUES(null, 'Audi', 37000, null);
INSERT INTO automoviles VALUES(null, 'Dacia', 24000, null);
# Como el código se genera automáticamente, insertamos `null` en ese campo.
# Para las fechas faltantes, utilizamos `null` ya que el campo no es obligatorio.


## Paso 2
SELECT DISTINCT	-- Solo nos interesan los nombres de las marcas, así que ignoramos los duplicados
    marca
FROM
    automoviles
WHERE
    UPPER(marca) LIKE '%L%';
# Para que la búsqueda no distinga entre mayúsculas y minúsculas, ponemos la marca en mayúsculas con `upper()`
# '%L%' es cualquier cadena que contenga una 'L'


## Paso 3
SELECT 
    *
FROM
    automoviles
WHERE
    precio >= 25000 AND precio < 37000;
    

## Paso 4
DROP TABLE IF EXISTS modelos;
CREATE TABLE modelos (
    codModelo INT(2) NOT NULL,
    nombre VARCHAR(100) NOT NULL
);


## Paso 5
ALTER TABLE modelos
	ADD PRIMARY KEY(codModelo);	
# Antes de hacer que una clave ajena apunte a esta columna, hay que convertirla en clave primaria

ALTER TABLE automoviles
	ADD codModelo INT(2),
	ADD FOREIGN KEY fk_codModelo(codModelo) REFERENCES modelos(codModelo);