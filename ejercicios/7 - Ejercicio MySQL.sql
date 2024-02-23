/*
	Jorge Lázaro Ruiz
    
    Programa de Formación de Becarios de Future Space (febrero 2024)
    
    Ejercicio MySQL 6: BD BP-Consulta codificada
*/

USE jlazaro;

DROP FUNCTION IF EXISTS dif;

## Creación de la función
DELIMITER //
CREATE FUNCTION dif (
	old_unidades SMALLINT,
    new_unidades SMALLINT
)
RETURNS INT
BEGIN
	DECLARE diferencia SMALLINT;
    SET diferencia = new_unidades - old_unidades;	-- Así, los préstamos son valores negativos y las devoluciones, positivos.
    RETURN(diferencia);
END//

DELIMITER ;

## Modificación de la tabla del histórico
ALTER TABLE historico
	ADD diferencia INT
;

## Modificación del disparador
DROP TRIGGER IF EXISTS actualizar_historico;

DELIMITER //
CREATE TRIGGER actualizar_historico
    BEFORE UPDATE
    ON stock		
    FOR EACH ROW
BEGIN
	IF NEW.unidades <> OLD.unidades THEN
		INSERT INTO historico (libro_id, formato_id, unidades, fecha, diferencia)
		VALUES (OLD.libro_id, OLD.formato_id, OLD.unidades, OLD.fecha, dif(OLD.unidades, NEW.unidades));
	END IF;
END//
DELIMITER ;

/* CASO DE PRUEBA
	INSERT INTO stock VALUES (1, 1, 10, '2000-01-01');
	SELECT * from stock;
	SELECT * from historico;
	UPDATE stock SET unidades = 9 WHERE libro_id = 1;
	SELECT * from stock;
	SELECT * from historico;
*/
