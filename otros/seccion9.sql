# Eliminar la base de datos ya existente
drop database if exists curso_sql;

show databases;

create database if not exists curso_sql;
use curso_sql;
CREATE TABLE IF NOT EXISTS usuario (
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    correo VARCHAR(100),
    PRIMARY KEY (nombre)
);
insert into usuario values('Juan', 'Pérez', 'juan@juan.com');
#insert into usuario values('Juan', 'López', 'juan@lopez.com');	-- Da error porque ya hay un Juan
describe usuario;

CREATE TABLE IF NOT EXISTS producto (
    id INT(11) AUTO_INCREMENT,
    producto VARCHAR(50),
    descripcion TEXT,
    precio FLOAT(11 , 2 ),
    PRIMARY KEY (id)
);

 describe producto;
 insert into producto values(null, 'Portátil', 'Este portátil es la caña', 128.6);
 SELECT 
    *
FROM
    producto

truncate table producto;
