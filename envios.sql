-- SE CREA BASE DE DATOS ENVIOS
CREATE DATABASE envios;
USE envios;

-- TABLA ESTADO
CREATE TABLE tblEstado 
(
    codigo INT AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    PRIMARY KEY(codigo)
);

-- TABLA TIPO-TRATAMIENTO
CREATE TABLE tblTipoTratamiento
(
    codigo INT AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    PRIMARY KEY(codigo)
);

-- TABLA TIPO-MERCANCIA    
CREATE TABLE tblTipoMercancia
(
    codigo INT AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    -- FK
    tipoTratamiento INT,
    PRIMARY KEY(codigo),
    -- SE TRAEN FK
    CONSTRAINT FK_tbltipomercancia_tbltipotratamiento FOREIGN KEY(tipoTratamiento)
    REFERENCES tblTipoTratamiento(codigo)
);

-- TABLA TIPO-ENVIO
CREATE TABLE tblTipoEnvio
(
    codigo INT AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    PRIMARY KEY(codigo)
);

-- TABLA DEPARTAMENTO
CREATE TABLE tblDepartamento
(
    codigo VARCHAR(2) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    PRIMARY KEY(codigo)
);

-- TABLA CIUDAD
CREATE TABLE tblCiudad
(
    codigo VARCHAR(5) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    -- FK
    departamento VARCHAR(2),
    PRIMARY KEY(codigo),
    -- SE TRAE FK
    CONSTRAINT FK_tblciudad_tblDepartemento FOREIGN KEY(departamento)
    REFERENCES tblDepartamento(codigo)
);

-- TABLA PERSONA
CREATE TABLE tblPersona 
(
    docIdentidad VARCHAR(11) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(20) NOT NULL,
    direccion VARCHAR(60) NOT NULL,
    -- PK
    ciudad VARCHAR(5),
    email VARCHAR(30) NOT NULL,
    telefono VARCHAR(10) NOT NULL,
    PRIMARY KEY(docIdentidad),
    -- SE TRAEN FK
    CONSTRAINT FK_tblpersonasciudad_tblCiudad FOREIGN KEY(ciudad)
    REFERENCES tblCiudad(codigo)
);

-- TABLA PAQUETE
CREATE TABLE tblPaquete
(
    guia INT AUTO_INCREMENT,
    -- FK
    remitente VARCHAR(11),
    -- FK 
    destinatario VARCHAR(11),
    -- 4 ES CANTIDAD DE DIGITOS Y 2 LOS DECIMALES
    peso FLOAT(4,2) NOT NULL,
    -- FK
    tipoMercancia INT,
    valorDeclarado INT(9) NOT NULL,
    -- FK
    tipoEnvio INT,
    valorEnvio INT(7) NOT NULL,
    -- FK
    estado INT,
    PRIMARY KEY(guia),
    -- SE TRAEN FK
    CONSTRAINT FK_tblPaqueteremit_tblPersona FOREIGN KEY(remitente)      
    REFERENCES tblPersona(docIdentidad),
    CONSTRAINT FK_tblPaquetedest_tblPersona FOREIGN KEY(destinatario)      
    REFERENCES tblPersona(docIdentidad),
    CONSTRAINT FK_tblPaquetetipmer_tbltipmerc FOREIGN KEY(tipoMercancia)      
    REFERENCES tblTipoMercancia(codigo),
    CONSTRAINT FK_tblPaquetetipenv_tbltipenv FOREIGN KEY(tipoEnvio)      
    REFERENCES tblTipoEnvio(codigo),
    CONSTRAINT FK_tblPaqueteestado_tblEstado FOREIGN KEY(estado)      
    REFERENCES tblEstado(codigo)
);
