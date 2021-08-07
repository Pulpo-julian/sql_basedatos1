-- CREAR BASE DE DATOS DE UNIVERSIDAD

CREATE DATABASE universidad;
USE universidad;

-- TABLA FACULTAD
CREATE TABLE tblFacultad
(
    codigo INT AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY(codigo)
);

-- TABLA CARRERA
CREATE TABLE tblCarrera
(
    codigo INT AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    facultad INT,
    PRIMARY KEY(codigo),
    CONSTRAINT FK_tblCarrera_tblFacultad FOREIGN KEY(facultad)
    REFERENCES tblFacultad(codigo)
);

-- TABLA MATERIA
CREATE TABLE tblMateria 
(
    codigo INT AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    PRIMARY KEY(codigo)
);

-- TABLA CIUDAD
CREATE TABLE tblCiudad
(
    codigo VARCHAR(4) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY(codigo)
);

-- TABLA BARRIO
CREATE TABLE tblBarrio
(
    codigo VARCHAR(6) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    ciudad VARCHAR(4),
    PRIMARY KEY(codigo),
    CONSTRAINT FK_tblbarrio_tblCiudad FOREIGN KEY(ciudad)
    REFERENCES tblCiudad(codigo)
);


-- TABLA ESTUDIANTES
CREATE TABLE tblEstudiantes
(
    codigo INT AUTO_INCREMENT,
    docIdentidad VARCHAR(11) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    direccion VARCHAR(80) NOT NULL,
    -- LA SIGUIENTE LINEA ES CLAVE FORANEA
    barrio VARCHAR(6),
    -- LA SIGUIENTE LINEA ES CLAVE FORANEA
    carrera INT,
    valorMatricula INT(8) NOT NULL,
    semestre INT(2) NOT NULL,
    PRIMARY KEY(codigo),
    -- SE TRAEN LAS FK    
    CONSTRAINT FK_tblestudiantesbarrio_tblbarrio FOREIGN KEY(barrio)
    REFERENCES tblBarrio(codigo),
    CONSTRAINT FK_tblestudiantescarrera_tblcarrera FOREIGN KEY(carrera)
    REFERENCES tblCarrera(codigo)
);

-- TABLA ESTUDIANTE-MATERIA
CREATE TABLE tblEstudianteMateria 
(
    codigoEstudiante INT,
    codigoMateria INT,
    -- 5 ES LA CANTIDAD DE DIGITOS Y EL 2 CANTIDAD DE DECIMALES
    nota FLOAT(5,2) NOT NULL,
    PRIMARY KEY(codigoEstudiante, codigoMateria),
    -- SE CREA LA RELACION 
    CONSTRAINT fk_estuMatcodiEst_tblEstudiante FOREIGN KEY(codigoEstudiante)
    REFERENCES tblEstudiantes(codigo),
    CONSTRAINT FK_estuMatcodMateria_tblMateria FOREIGN KEY(codigoMateria)
    REFERENCES tblMateria(codigo)
);
