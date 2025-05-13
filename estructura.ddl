drop database if exists comercio;
create database  comercio;
use comercio;
Create table producto(
	codigo int(10) not null auto_increment,
	nombre varchar(100) not null,
	precio double not null,
	codigo_fabricante int(10) not null, 
    primary key (codigo)
);
create table fabricante(
	codigo int(10) not null auto_increment,
	nombre varchar(100) not null,
	primary key (codigo)
);
alter table producto add constraint FKProd_Fab foreign key (codigo_fabricante) references fabricante(codigo);