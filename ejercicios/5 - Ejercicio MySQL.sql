/*
	Jorge Lázaro Ruiz
    
    Programa de Formación de Becarios de Future Space (febrero 2024)
    
    Ejercicio MySQL 5: BD BP-Trigger
*/

USE jlazaro;

DROP TABLE IF EXISTS historico, stock, formatos;

## Creación de la tabla de formatos
CREATE TABLE formatos (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,	-- Como identificador único, tiene sentido que esta sea la clave primaria
	descripcion VARCHAR(50)
);

INSERT INTO formatos(descripcion)
	VALUES
    ('Tapa blanda'),
    ('Tapa dura')
;

## Creación de la tabla de stock
CREATE TABLE stock (
	libro_id INT UNSIGNED NOT NULL,
    formato_id INT UNSIGNED NOT NULL,
    unidades SMALLINT,	-- Previsiblemente no tendremos más de 32 767 copias de un libro en stock
    fecha DATE,
    PRIMARY KEY (libro_id, formato_id),
    FOREIGN KEY (libro_id) REFERENCES libros(id),
    FOREIGN KEY (formato_id) REFERENCES formatos(id)
);
# NOTA: Inicialmente quería declarar el campo de las unidades como `UNSIGNED`,
# pero me encontré con problemas posteriormente en el ejercicio 7, ya que
# una resta podía dar números negativos fuera del rango.

## Creación de la tabla del histórico
CREATE TABLE historico (
	libro_id INT NOT NULL,
    formato_id INT NOT NULL,
    unidades SMALLINT,
    fecha DATE
);

## Creación del disparador
DROP TRIGGER IF EXISTS actualizar_historico;

DELIMITER //
CREATE TRIGGER actualizar_historico
    BEFORE UPDATE
    ON stock		
    FOR EACH ROW
BEGIN
	IF NEW.unidades <> OLD.unidades THEN
		INSERT INTO historico (libro_id, formato_id, unidades, fecha)
		VALUES (OLD.libro_id, OLD.formato_id, OLD.unidades, OLD.fecha);
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