drop database if exists comercio;
create database  comercio;
use comercio;
Create table producto(
	codigo int(10) auto_increment,
	nombre varchar(100),
	precio double,
	codigo_fabricante int(10), 
    primary key (codigo)
);
create table fabricante(
	codigo int(10) auto_increment,
	nombre varchar(100),
	primary key (codigo)
);

alter table producto add constraint FKProd_Fab foreign key (codigo_fabricante) references fabricante(codigo);