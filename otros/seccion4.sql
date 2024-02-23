drop database curso_sql;
create database curso_sql;
use curso_sql;

create table usuario(
nombre varchar(50),
edad int(15)
);

show tables;
describe usuario;
drop table usuarios;

create table alumnos(
nombre varchar(50),
apellido varchar(50),
direccion varchar(100),
telefono varchar(15),
edad int(11)
);

insert into alumnos(nombre, apellido, direccion, telefono, edad) values(
'Juan', 'Martinez', 'Barrio Duarte', '18583254', 35);
insert into alumnos values('Pedro', 'Montero', '27 de febrero', '6654321587', 15);

select * from alumnos;
select nombre, direccion from alumnos;

select * from alumnos where nombre = 'Juan';

SELECT 
    *
FROM
    alumnos;
delete from alumnos where nombre = 'Juan';

update alumnos set edad = 33;
update alumnos set direccion = 'Mendoza', telefono = '546786354' where nombre = 'Pedro'
