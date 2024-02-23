/*
	Jorge Lázaro Ruiz
    
    Programa de Formación de Becarios de Future Space (febrero 2024)
    
    Ejercicio MySQL 6: BD BP-Consulta codificada
*/

USE jlazaro;

SELECT
	CASE
		WHEN nombre = 'RBA' THEN 'EDITORIAL 1'
        WHEN nombre = 'PLANETA' THEN 'EDITORIAL 2'
        WHEN nombre = 'O\'REILLY' THEN 'EDITORIAL 3'
        ELSE 'Desconocido'
	END
    AS descripcion_codificada
FROM
	editoriales
;
