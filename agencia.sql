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

-- TABLA HOTELES
CREATE TABLE tblHoteles
(
    idHotel INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    -- FK
    ciudad VARCHAR(5),
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    plazasDisponibles INT NOT NULL,
    PRIMARY KEY(idHotel),
    -- SE TRAEN FK
    CONSTRAINT FK_ciudad_de_tblCiudad FOREIGN KEY(ciudad)
    REFERENCES tblCiudad(idCiudad)
);

-- TABLA AGENCIA
CREATE TABLE tblAgencia
(
    idAgencia INT AUTO_INCREMENT,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    PRIMARY KEY(idAgencia)
);

-- TABLA RESERVAS
CREATE TABLE tblReservas
(
    idReserva INT AUTO_INCREMENT,
    -- FK
    cliente VARCHAR(20),
    -- FK 
    agencia INT,
    -- FK
    vuelo INT,
    -- FK
    hotel INT,
    -- FK
    hospedaje INT,
    PRIMARY KEY(idReserva),
    -- SE TRAEN FK
    CONSTRAINT FK_cliente_tblCliente FOREIGN KEY(cliente)
    REFERENCES tblClientes(idCliente),
    CONSTRAINT FK_agencia_tblAgencia FOREIGN KEY(agencia)
    REFERENCES tblAgencia(idAgencia),
    CONSTRAINT FK_vuelo_tblVuelo FOREIGN KEY(vuelo)
    REFERENCES tblVuelos(numeroVuelo),
    CONSTRAINT FK_hotel_tblHotel FOREIGN KEY(hotel)
    REFERENCES tblHoteles(idHotel),
    CONSTRAINT FK_hospedaje_tblHospedaje FOREIGN KEY(hospedaje)
    REFERENCES tblHospedaje(idHospedaje)
);