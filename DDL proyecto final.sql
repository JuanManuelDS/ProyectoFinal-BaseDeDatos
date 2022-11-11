CREATE DATABASE shrimpdf;
USE shrimpdf;

CREATE TABLE usuarios (
email VARCHAR(100),
nombre_usuario VARCHAR(100),
contrasena VARCHAR(100),
PRIMARY KEY (email));

CREATE TABLE plantillas (
nombre_archivo VARCHAR(100),
firma VARCHAR(500),
usuario VARCHAR(100) REFERENCES usuarios(email) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (nombre_archivo));

CREATE TABLE curriculums (
nombre_archivo VARCHAR(100) REFERENCES plantillas(nombre_archivo) ON DELETE CASCADE ON UPDATE CASCADE,
texto_presentacion TEXT,
imagen VARCHAR(250),
PRIMARY KEY (nombre_archivo));

CREATE TABLE otros (
id INT AUTO_INCREMENT,
descripcion TEXT,
curriculum VARCHAR(100) REFERENCES curriculums(nombre_archivo) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id));

CREATE TABLE datos (
id INT AUTO_INCREMENT,
nombre VARCHAR(100),
apellidos VARCHAR(100),
edad TINYINT,
email VARCHAR(155),
telefono VARCHAR(25),
codigo_postal VARCHAR (10),
ciudad VARCHAR (100),
curriculum VARCHAR(100) REFERENCES curriculums(nombre_archivo) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id));

CREATE TABLE experiencia_laboral (
id INT AUTO_INCREMENT,
puesto VARCHAR(120),
descripcion TEXT,
fecha_inicio DATE,
fecha_fin DATE,
curriculum VARCHAR(100) REFERENCES curriculums(nombre_archivo) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id));

CREATE TABLE estudios (
id INT AUTO_INCREMENT,
titulo VARCHAR(120),
descripcion TEXT,
fecha_inicio DATE,
fecha_fin DATE,
curriculum VARCHAR(100) REFERENCES curriculums(nombre_archivo) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id));

CREATE TABLE idiomas (
id INT AUTO_INCREMENT,
idioma VARCHAR(100),
nivel_escrito VARCHAR(40),
nivel_oral VARCHAR(40),
curriculum VARCHAR(100) REFERENCES curriculums(nombre_archivo) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id));

CREATE TABLE listado (
titulo_lista VARCHAR(100),
nombre_archivo VARCHAR(100) REFERENCES plantillas(nombre_archivo) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (nombre_archivo));

CREATE TABLE entradas (
id INT AUTO_INCREMENT,
nombre VARCHAR(100),
unidades MEDIUMINT,
listado VARCHAR(100) REFERENCES listado(nombre_archivo) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id));

CREATE TABLE cartas_restaurantes (
nombre_restaurante VARCHAR(100),
nombre_archivo VARCHAR(100) REFERENCES plantillas(nombre_archivo) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (nombre_archivo));

CREATE TABLE secciones (
id INT AUTO_INCREMENT,
nombre VARCHAR(100),
imagen VARCHAR(255),
carta VARCHAR(100) REFERENCES cartas_restaurantes(nombre_archivo) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id));

CREATE TABLE platos (
id INT AUTO_INCREMENT,
nombre VARCHAR(100),
descripcion VARCHAR(250),
precio MEDIUMINT,
seccion INT REFERENCES secciones(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(id));

CREATE TABLE menu (
id INT AUTO_INCREMENT,
nombre VARCHAR(100),
imagen VARCHAR(255),
precio_menu MEDIUMINT,
nombre_archivo VARCHAR(100) REFERENCES cartas_restaurantes(nombre_archivo) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id));

CREATE TABLE plato_menus (
id_menu INT REFERENCES menu(id) ON DELETE CASCADE ON UPDATE CASCADE,
id_plato INT REFERENCES platos(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(id_menu, id_plato));

