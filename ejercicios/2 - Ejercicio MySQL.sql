/*
	Jorge Lázaro Ruiz
    
    Programa de Formación de Becarios de Future Space (febrero 2024)
    
    Ejercicio MySQL 2: BD Biblioteca pública (BP)
*/

CREATE DATABASE IF NOT EXISTS jlazaro;	# Base de datos donde almacenaremos la tabla
USE jlazaro;

DROP TABLE IF EXISTS libros, autores, editoriales;

# Creación de la tabla de autores
CREATE TABLE autores (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20),
    apellidos VARCHAR(50),
    fnacimiento DATE
);

# Creación de la tabla de editoriales
CREATE TABLE editoriales (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(20),
	razonsocial VARCHAR(15)
);

## Creación de la tabla de libros
CREATE TABLE libros (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	isbn INT(13) UNSIGNED,
	titulo VARCHAR(50),
	anopub YEAR,	-- Suponiendo que guardamos el año de publicación de la edición, no habrá libros anteriores a 1901
	autor_id INT UNSIGNED,
	editorial_id INT UNSIGNED,
	tema ENUM ('HISTORIA', 'MEDICINA', 'INFORMÁTICA', 'NOVELA'),	-- Para facilitar la búsqueda por temática (podemos añadir otras temáticas si fueran necesarias)
	FOREIGN KEY(autor_id) REFERENCES autores(id),
	FOREIGN KEY(editorial_id) REFERENCES editoriales(id)
);

## Inserción de datos
# Tabla de autores
INSERT INTO
	autores(nombre, apellidos)
VALUES
	('FRANCISCO', 'DIAZ DIAZ'),
	('ALBERTO', 'MIGUELEZ LOPEZ'),
	('RAÚL', 'OCHANDIANO RIVERA'),
	('FERNANDO', 'MARTOS ETXEBERRIA'),
	('JOANNE', 'ROWLING'),
	('MIGUEL', 'LIMÓN IGNACIO'),
	('DAVID', 'MOZAS JEREZ')
;

# Tabla de editoriales
INSERT INTO
	editoriales(nombre)
VALUES
	('PLANETA'),
	('O\'REILLY'),
	('RBA')
;

# Tabla de libros
INSERT INTO
	libros(titulo, autor_id, editorial_id, tema, anopub)
SELECT
	'HISTORIA DE ALEMANIA', a.id, e.id, 'HISTORIA', 2001	-- Para no introducir las IDs manualmente, las consultamos
FROM
	autores AS a
JOIN
	editoriales AS e
WHERE
	a.nombre = 'FRANCISCO' AND a.apellidos = 'DIAZ DIAZ'
	AND
	e.nombre = 'PLANETA'
;

INSERT INTO
	libros(titulo, autor_id, editorial_id, tema, anopub)
SELECT
	'HISTORIA DE ESPAÑA', a.id, e.id, 'HISTORIA', 2002
FROM
	autores AS a
JOIN
	editoriales AS e
WHERE
	a.nombre = 'FRANCISCO' AND a.apellidos = 'DIAZ DIAZ'
	AND
	e.nombre = 'PLANETA'
;

INSERT INTO
	libros(titulo, autor_id, editorial_id, tema, anopub)
SELECT
	'HISTORIA DE FRANCIA', a.id, e.id, 'HISTORIA', 2002
FROM
	autores AS a
JOIN
	editoriales AS e
WHERE
	a.nombre = 'FRANCISCO' AND a.apellidos = 'DIAZ DIAZ'
	AND
	e.nombre = 'PLANETA'
;

INSERT INTO
	libros(titulo, autor_id, editorial_id, tema, anopub)
SELECT
	'LA SOCIEDAD MEDIEVAL', a.id, e.id, 'HISTORIA', 2001
FROM
	autores AS a
JOIN
	editoriales AS e
WHERE
	a.nombre = 'ALBERTO' AND a.apellidos = 'MIGUELEZ LOPEZ'
	AND
	e.nombre = 'PLANETA'
;

INSERT INTO
	libros(titulo, autor_id, editorial_id, tema, anopub)
SELECT
	'ANGULAR DESDE 0', a.id, e.id, 'INFORMÁTICA', 2013
FROM
	autores AS a
JOIN
	editoriales AS e
WHERE
	a.nombre = 'RAÚL' AND a.apellidos = 'OCHANDIANO RIVERA'
	AND
	e.nombre = 'O\'REILLY'
;

INSERT INTO
	libros(titulo, autor_id, editorial_id, tema, anopub)
SELECT
	'CREPÚSCULO VAMPIROS', a.id, e.id, 'NOVELA', 1999
FROM
	autores AS a
JOIN
	editoriales AS e
WHERE
	a.nombre = 'FERNANDO' AND a.apellidos = 'MARTOS ETXEBERRIA'
	AND
	e.nombre = 'RBA'
;

INSERT INTO
	libros(titulo, autor_id, editorial_id, tema, anopub)
SELECT
	'CREPÚSCULO ZOMBIES', a.id, e.id, 'NOVELA', 1998
FROM
	autores AS a
JOIN
	editoriales AS e
WHERE
	a.nombre = 'FERNANDO' AND a.apellidos = 'MARTOS ETXEBERRIA'
	AND
	e.nombre = 'RBA'
;

INSERT INTO
	libros(titulo, autor_id, editorial_id, tema, anopub)
SELECT
	'CREPÚSCULO MONSTERS', a.id, e.id, 'NOVELA', 1997
FROM
	autores AS a
JOIN
	editoriales AS e
WHERE
	a.nombre = 'FERNANDO' AND a.apellidos = 'MARTOS ETXEBERRIA'
	AND
	e.nombre = 'RBA'
;

INSERT INTO
	libros(titulo, autor_id, editorial_id, tema, anopub)
SELECT
	'HARRY POTTER I', a.id, e.id, 'NOVELA', 2000
FROM
	autores AS a
JOIN
	editoriales AS e
WHERE
	a.nombre = 'JOANNE' AND a.apellidos = 'ROWLING'
	AND
	e.nombre = 'RBA'
;

INSERT INTO
	libros(titulo, autor_id, editorial_id, tema, anopub)
SELECT
	'HARRY POTTER II', a.id, e.id, 'NOVELA', 2001
FROM
	autores AS a
JOIN
	editoriales AS e
WHERE
	a.nombre = 'JOANNE' AND a.apellidos = 'ROWLING'
	AND
	e.nombre = 'RBA'
;

INSERT INTO
	libros(titulo, autor_id, editorial_id, tema, anopub)
SELECT
	'HARRY POTTER III', a.id, e.id, 'NOVELA', 2001
FROM
	autores AS a
JOIN
	editoriales AS e
WHERE
	a.nombre = 'JOANNE' AND a.apellidos = 'ROWLING'
	AND
	e.nombre = 'RBA'
;

INSERT INTO
	libros(titulo, autor_id, editorial_id, tema, anopub)
SELECT
	'HARRY POTTER IV', a.id, e.id, 'NOVELA', 2002
FROM
	autores AS a
JOIN
	editoriales AS e
WHERE
	a.nombre = 'JOANNE' AND a.apellidos = 'ROWLING'
	AND
	e.nombre = 'RBA'
;

INSERT INTO
	libros(titulo, autor_id, editorial_id, tema, anopub)
SELECT
	'LA SOCIEDAD INDUSTRIAL', a.id, e.id, 'HISTORIA', 1972
FROM
	autores AS a
JOIN
	editoriales AS e
WHERE
	a.nombre = 'ALBERTO' AND a.apellidos = 'MIGUELEZ LOPEZ'
	AND
	e.nombre = 'PLANETA'
;

INSERT INTO
	libros(titulo, autor_id, editorial_id, tema, anopub)
SELECT
	'LOS TEMPLARIOS', a.id, e.id, 'HISTORIA', 1998
FROM
	autores AS a
JOIN
	editoriales AS e
WHERE
	a.nombre = 'MIGUEL' AND a.apellidos = 'LIMÓN IGNACIO'
	AND
	e.nombre = 'PLANETA'
;

INSERT INTO
	libros(titulo, autor_id, editorial_id, tema, anopub)
SELECT
	'LOS ALBIGENSES', a.id, e.id, 'HISTORIA', 1986
FROM
	autores AS a
JOIN
	editoriales AS e
WHERE
	a.nombre = 'MIGUEL' AND a.apellidos = 'LIMÓN IGNACIO'
	AND
	e.nombre = 'PLANETA'
;

INSERT INTO
	libros(titulo, autor_id, editorial_id, tema, anopub)
SELECT
	'LOS GODOS', a.id, e.id, 'HISTORIA', 2001
FROM
	autores AS a
JOIN
	editoriales AS e
WHERE
	a.nombre = 'MIGUEL' AND a.apellidos = 'LIMÓN IGNACIO'
	AND
	e.nombre = 'PLANETA'
;

INSERT INTO
	libros(titulo, autor_id, editorial_id, tema, anopub)
SELECT
	'SPRING', a.id, e.id, 'INFORMÁTICA', 2014
FROM
	autores AS a
JOIN
	editoriales AS e
WHERE
	a.nombre = 'DAVID' AND a.apellidos = 'MOZAS JEREZ'
	AND
	e.nombre = 'O\'REILLY'
;

INSERT INTO
	libros(titulo, autor_id, editorial_id, tema, anopub)
SELECT
	'JQUERY', a.id, e.id, 'INFORMÁTICA', 2015
FROM
	autores AS a
JOIN
	editoriales AS e
WHERE
	a.nombre = 'DAVID' AND a.apellidos = 'MOZAS JEREZ'
	AND
	e.nombre = 'O\'REILLY'
;

INSERT INTO
	libros(titulo, autor_id, editorial_id, tema, anopub)
SELECT
	'MYSQL', a.id, e.id, 'INFORMÁTICA', 2016
FROM
	autores AS a
JOIN
	editoriales AS e
WHERE
	a.nombre = 'DAVID' AND a.apellidos = 'MOZAS JEREZ'
	AND
	e.nombre = 'O\'REILLY'
;

INSERT INTO
	libros(titulo, autor_id, editorial_id, tema, anopub)
SELECT
	'ORACLE', a.id, e.id, 'INFORMÁTICA', 2003
FROM
	autores AS a
JOIN
	editoriales AS e
WHERE
	a.nombre = 'DAVID' AND a.apellidos = 'MOZAS JEREZ'
	AND
	e.nombre = 'O\'REILLY'
;

/* NOTA:
	Dado que la cantidad de datos no es elevada, en este caso
    también podríamos introducir las IDs de forma manual
    en una inserción más concisa.
    
	INSERT INTO
		libros(titulo, autor_id, editorial_id, tema, anopub)
	VALUES
		('HISTORIA DE ALEMANIA', 1, 1, 'HISTORIA', 2001),
		('HISTORIA DE ESPAÑA', 1, 1, 'HISTORIA', 2002),
		('HISTORIA DE FRANCIA', 1, 1, 'HISTORIA', 2002),
		('LA SOCIEDAD MEDIEVAL', 2, 1, 'HISTORIA', 2001),
		('ANGULAR DESDE 0', 3, 2, 'INFORMÁTICA', 2013),
		('CREPÚSCULO VAMPIROS', 4, 3, 'NOVELA', 1999),
		('CREPÚSCULO ZOMBIES', 4, 3, 'NOVELA', 1998),
		('CREPÚSCULO MONSTERS', 4, 3, 'NOVELA', 1997),
		('HARRY POTTER I', 5, 3, 'NOVELA', 2000),
		('HARRY POTTER II', 5, 3, 'NOVELA', 2001),
		('HARRY POTTER III', 5, 3, 'NOVELA', 2001),
		('HARRY POTTER IV', 5, 3, 'NOVELA', 2002),
		('LA SOCIEDAD INDUSTRIAL', 2, 1, 'HISTORIA', 1972),
		('LOS TEMPLARIOS', 6, 1, 'HISTORIA', 1998),
		('LOS ALBIGENSES', 6, 1, 'HISTORIA', 1986),
		('LOS GODOS', 6, 1, 'HISTORIA', 2001),
		('SPRING', 7, 2, 'INFORMÁTICA', 2014),
		('JQUERY', 7, 2, 'INFORMÁTICA', 2015),
		('MYSQL', 7, 2, 'INFORMÁTICA', 2016),
		('ORACLE', 7, 2, 'INFORMÁTICA', 2003)
	;
    
    Sin embargo, esto requiere comprobar las IDs en la tabla
    una por una, lo cual es ineficiente y sería imposible
    si tuviéramos un juego de datos realista.
*/
