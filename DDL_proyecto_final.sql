DROP DATABASE IF EXISTS shrimpdf;

CREATE DATABASE shrimpdf;
USE shrimpdf;

DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios (
id int auto_increment,
email VARCHAR(100),
nombre_usuario VARCHAR(100),
contrasena VARCHAR(100),
PRIMARY KEY (id));

DROP TABLE IF EXISTS plantillas;

CREATE TABLE plantillas (
id int auto_increment,
nombre_archivo VARCHAR(100),
firma VARCHAR(500),
usuario int REFERENCES usuarios(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id));

DROP TABLE IF EXISTS curriculums;

CREATE TABLE curriculums (
id int REFERENCES plantillas(id) ON DELETE CASCADE ON UPDATE CASCADE,
texto_presentacion TEXT,
imagen VARCHAR(250),
PRIMARY KEY (id));

DROP TABLE IF EXISTS otros;

CREATE TABLE otros (
id INT AUTO_INCREMENT,
descripcion TEXT,
curriculum int REFERENCES curriculums(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id));

DROP TABLE IF EXISTS datos;

CREATE TABLE datos (
id INT AUTO_INCREMENT,
nombre VARCHAR(100),
apellidos VARCHAR(100),
edad TINYINT,
email VARCHAR(155),
telefono VARCHAR(25),
codigo_postal VARCHAR (10),
ciudad VARCHAR (100),
curriculum int REFERENCES curriculums(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id));

DROP TABLE IF EXISTS experiencia_laboral;

CREATE TABLE experiencia_laboral (
id INT AUTO_INCREMENT,
puesto VARCHAR(120),
descripcion TEXT,
fecha_inicio DATE,
fecha_fin DATE,
curriculum int REFERENCES curriculums(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id));

DROP TABLE IF EXISTS estudios;

CREATE TABLE estudios (
id INT AUTO_INCREMENT,
titulo VARCHAR(120),
descripcion TEXT,
fecha_inicio DATE,
fecha_fin DATE,
curriculum int REFERENCES curriculums(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id));

DROP TABLE IF EXISTS idiomas;

CREATE TABLE idiomas (
id INT AUTO_INCREMENT,
idioma VARCHAR(100),
nivel_escrito VARCHAR(40),
nivel_oral VARCHAR(40),
curriculum int REFERENCES curriculums(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id));

DROP TABLE IF EXISTS listado;

CREATE TABLE listado (
id int REFERENCES plantillas(id) ON DELETE CASCADE ON UPDATE CASCADE,
titulo_lista VARCHAR(100),
PRIMARY KEY (id));

DROP TABLE IF EXISTS entradas;

CREATE TABLE entradas (
id INT AUTO_INCREMENT,
nombre VARCHAR(100),
unidades MEDIUMINT,
listado int REFERENCES listado(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id));

DROP TABLE IF EXISTS cartas_restaurantes;

CREATE TABLE cartas_restaurantes (
id int REFERENCES plantillas(id) ON DELETE CASCADE ON UPDATE CASCADE,
nombre_restaurante VARCHAR(100),
PRIMARY KEY (id));

DROP TABLE IF EXISTS secciones;

CREATE TABLE secciones (
id INT AUTO_INCREMENT,
nombre VARCHAR(100),
imagen VARCHAR(255),
carta int REFERENCES cartas_restaurantes(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id));

DROP TABLE IF EXISTS platos;

CREATE TABLE platos (
id INT AUTO_INCREMENT,
nombre VARCHAR(100),
descripcion VARCHAR(250),
precio MEDIUMINT,
seccion INT REFERENCES secciones(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(id));

DROP TABLE IF EXISTS menus;

CREATE TABLE menus (
id INT AUTO_INCREMENT,
nombre VARCHAR(100),
imagen VARCHAR(255),
precio_menu MEDIUMINT,
carta int REFERENCES cartas_restaurantes(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id));

DROP TABLE IF EXISTS plato_menus;

CREATE TABLE plato_menus (
id_menu INT REFERENCES menu(id) ON DELETE CASCADE ON UPDATE CASCADE,
id_plato INT REFERENCES platos(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(id_menu, id_plato));
