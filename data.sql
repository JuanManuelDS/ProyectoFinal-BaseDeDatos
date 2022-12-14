DROP DATABASE IF EXISTS shrimpdf;

CREATE DATABASE shrimpdf;
USE shrimpdf;

DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios (
id int auto_increment,
email VARCHAR(100) UNIQUE,
nombre_usuario VARCHAR(100) UNIQUE,
contrasena VARCHAR(100),
PRIMARY KEY (id));

CREATE TABLE rol (
id int auto_increment primary key, 
name varchar(20));

insert into rol(name) values ('ADMIN'),( 'USER');

CREATE TABLE usuario_rol (
id int auto_increment primary key,
usuario int references usuario(id) on delete cascade on update cascade,
rol int references rol(id) on delete cascade on update cascade);

DROP TABLE IF EXISTS plantillas;

CREATE TABLE plantillas (
id INT AUTO_INCREMENT,
nombre_archivo VARCHAR(100),
firma VARCHAR(250),
tipo VARCHAR(30),
datos TEXT,
usuario INT REFERENCES usuarios(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id));

