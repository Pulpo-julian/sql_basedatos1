-- SE CREA BASE DE DATOS AGENCIA
CREATE DATABASE agencia;
USE agencia;

-- SE HACE LA TABLA CIUDAD
CREATE TABLE tblCiudad
(
    idCiudad VARCHAR(5) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY(idCiudad)
);

-- SE CREA LA TABLA HOSPEDAJE
CREATE TABLE tblHospedaje
(
    idHospedaje INT AUTO_INCREMENT,
    nombreHospedaje VARCHAR(50) NOT NULL,
    fechaLLegada DATE NOT NULL,
    fechaRegreso DATE NOT NULL,
    PRIMARY KEY(idHospedaje) 
);

-- SE HACE LA TABLA CLIENTES
CREATE TABLE tblClientes
(
    idCliente VARCHAR(20) NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    PRIMARY KEY(idCliente)
);


-- TABLA VUELOS
CREATE TABLE tblVuelos
(
    numeroVuelo INT AUTO_INCREMENT,
    fechaHora DATE NOT NULL,
    -- FK
    ciudadUno VARCHAR(5),
    -- FK
    ciudadDos VARCHAR(5),
    puestosTotales INT NOT NULL,
    puestosTurista INT NOT NULL,
    PRIMARY KEY(numeroVuelo),
    -- SE TRAEN FK
    CONSTRAINT FK_ciudadUno_detblCiudad FOREIGN KEY(ciudadUno)
    REFERENCES tblCiudad(idCiudad),
    CONSTRAINT FK_ciudadDos_detblCiudad FOREIGN KEY(ciudadDos)
    REFERENCES tblCiudad(idCiudad)
);