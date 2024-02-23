/*
	Jorge Lázaro Ruiz
    
    Programa de Formación de Becarios de Future Space (febrero 2024)
    
    Ejercicio MySQL 3: BD BP-Consulta Libros de Historia
*/

USE jlazaro;

SELECT
	libros.*
FROM
	libros
JOIN
	autores ON libros.autor_id = autores.id
WHERE
	(autores.nombre = 'FERNANDO' AND autores.apellidos = 'MARTOS ETXEBERRIA') AND libros.tema = 'NOVELA'
    OR
    (autores.nombre = 'MIGUEL' AND autores.apellidos = 'LIMÓN IGNACIO') AND libros.titulo = 'LOS GODOS'
ORDER BY
	libros.anopub
;
