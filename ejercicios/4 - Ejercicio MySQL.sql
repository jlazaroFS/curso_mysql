/*
	Jorge Lázaro Ruiz
    
    Programa de Formación de Becarios de Future Space (febrero 2024)
    
    Ejercicio MySQL 4: BD BP-Consulta Autores
*/

SELECT
	autores.*,
    count(libros.id) AS cuenta
FROM
	autores
LEFT JOIN	-- Así mostramos también los autores con 0 libros
	libros ON libros.autor_id = autores.id
GROUP BY
	autores.id
;
