-- CREAR BASE DE DATOS VETERINARIA
CREATE DATABASE veterinaria;
USE veterinaria;

-- TABLA ESPECIE
CREATE TABLE tblEspecie
(
    codigo INT AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY(codigo)
);

-- TABLA RAZA
CREATE TABLE tblRaza 
(
    codigo INT AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    -- FK
    especie INT,
    PRIMARY KEY(codigo),
    -- SE TRAEN LAS FK
    CONSTRAINT FK_tblraza_tblespecie FOREIGN KEY(especie)
    REFERENCES tblEspecie(codigo)
);

-- TABLA VACUNA
CREATE TABLE tblVacuna
(
    codigo INT AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    PRIMARY KEY(codigo)
);

-- TABLA COLOR
CREATE TABLE tblColor 
(
    codigo VARCHAR(9) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    PRIMARY KEY(codigo)
);

-- TABLA PACIENTE
CREATE TABLE tblPaciente
(
    codigo INT AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    -- FK
    raza INT,
    -- FK
    color VARCHAR(9),
    fechaNacimiento DATE NOT NULL,
    rasgosEspeciales VARCHAR(150) NOT NULL,
    PRIMARY KEY(codigo),
    -- SE TRAE LAS FK 
    CONSTRAINT FK_tblPacienteraza_tblraza FOREIGN KEY(raza)
    REFERENCES tblRaza(codigo),
    CONSTRAINT FK_tblPacientecolor_tblraza FOREIGN KEY(color)
    REFERENCES tblColor(codigo)
);

-- TABLA PACIENTE-VACUNA
CREATE TABLE tblPacienteVacuna 
(
    codigoPaciente INT,
    codigoVacuna INT,
    fecha DATE NOT NULL,
    PRIMARY KEY(codigoPaciente, codigoVacuna),
    -- SE HACE LA RELACION
    CONSTRAINT fk_tblpacienteVacuna_tblPaciente FOREIGN KEY(codigoPaciente)
    REFERENCES tblPaciente(codigo),
    CONSTRAINT fk_tblPacienteVacna_tblVacuna FOREIGN KEY(codigoVacuna)
    REFERENCES tblVacuna(codigo)
);