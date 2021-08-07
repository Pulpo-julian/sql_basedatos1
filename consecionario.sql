-- SE CREA BASE DE DATOS CONSECIONARIO
CREATE DATABASE consecionario;
USE consecionario;

-- TABLA COLOR
CREATE TABLE tblColor 
(
    codigo VARCHAR(7) NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    PRIMARY KEY(codigo)
);

-- TABLA MARCA
CREATE TABLE tblMarca
(
    codigo INT AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY(codigo)
);

-- TABLA TIPO-VEHICULO
CREATE TABLE tblTipoVehiculo
(
    codigo INT AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY(codigo)
);

-- TABLA SERIE
CREATE TABLE tblSerie 
(
    codigo INT AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    -- FK
    marca INT,
    -- FK 
    tipoVehiculo INT,
    PRIMARY KEY(codigo),
    -- SE TRAEN FK
    CONSTRAINT FK_tblserie_tblmarca FOREIGN KEY(marca)
    REFERENCES tblMarca(codigo),
    CONSTRAINT FK_tblserie_tbltipovehiculo FOREIGN KEY(tipoVehiculo)
    REFERENCES tblTipoVehiculo(codigo)
);

-- TABLA VEHICULO
CREATE TABLE tblVehiculo
(
    placa VARCHAR(6) NOT NULL,
    -- FK
    serie INT,
    modelo INT(4) NOT NULL,
    -- FK
    color VARCHAR(7) NOT NULL,
    numeroMotor VARCHAR(12) NOT NULL,
    numeroChasis VARCHAR(17) NOT NULL,
    caracteristicas VARCHAR(200) NOT NULL,
    valorCargoFijo INT(6) NOT NULL,
    valorKilometro INT(4) NOT NULL,
    PRIMARY KEY(placa),
    -- SE TRAEN LAS FK
    CONSTRAINT FK_tblvehiculo_tblserie FOREIGN KEY(serie)
    REFERENCES tblSerie(codigo),
    CONSTRAINT FK_tblVehiculocolor_tblserie FOREIGN KEY(color)
    REFERENCES tblColor(codigo)
);



