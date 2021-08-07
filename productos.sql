-- SE CREA BASE DE DATOS PRODUCTOS
CREATE DATABASE productos;
USE productos;

-- TABLA CATEGORIA
CREATE TABLE tblCategoria 
(
    codigo INT AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY(codigo)
);

-- TABLA SUBCATEGORIA
CREATE TABLE tblSubcategoria
(
    codigo INT AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    -- LA SIGUIENTE ES FK
    categoria INT,
    PRIMARY KEY(codigo),
    -- SE TRAE FK
    CONSTRAINT FK_tblSubcategoria_tblcategoria FOREIGN KEY(categoria)
    REFERENCES tblCategoria(codigo)
);

-- TABLA PROVEEDOR
CREATE TABLE tblProveedor
(
    nit VARCHAR(15) NOT NULL,
    nombres VARCHAR(30) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    telefonoFijo VARCHAR(7) NULL,
    telefonoMovil VARCHAR(10) NULL,
    email VARCHAR(50) NOT NULL,
    contacto VARCHAR(30) NULL,
    PRIMARY KEY(nit)
);

-- TABLA MARCA
CREATE TABLE tblMarca
(
    codigo INT AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    PRIMARY KEY(codigo)
);

-- TABLA PROVEEDOR-MARCA
CREATE TABLE tblProveedorMarca
(
    nitProveedor VARCHAR(15),
    codigoMarca INT,
    PRIMARY KEY(nitProveedor, codigoMarca),
    -- SE CREA LA RELACION
    CONSTRAINT fk_tblProvmarc_tblProvedor FOREIGN KEY(nitProveedor)
    REFERENCES tblProveedor(nit),
    CONSTRAINT fk_tblProvmarc_tblmarca FOREIGN KEY(codigoMarca)
    REFERENCES tblMarca(codigo)
);

-- TABLA UNIDAD-MEDIDA
CREATE TABLE tblUnindadMedida
(
    codigo INT AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    PRIMARY KEY(codigo)
);

-- TABLA PRODUCTO
CREATE TABLE tblProducto
(
    codigo INT AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    -- SIGUIENTE LINEA ES FK
    unidadMedida INT,
    costo INT(8) NOT NULL,
    existencia INT(6) NOT NULL,
    valorVenta INT(8) NOT NULL,
    -- SIGUIENTE LINEA ES FK
    marca INT,
    -- SIGUIENTE ES FK
    subcategoria INT,
    fechaUltimaCompra DATE,
    PRIMARY KEY(codigo),
    -- SE TRAEN LAS FK
    CONSTRAINT FK_tblProducto_tblUnidadmedida FOREIGN KEY(unidadMedida)
    REFERENCES tblUnindadMedida(codigo),
    CONSTRAINT FK_tblProducto_tblmarca FOREIGN KEY(marca)
    REFERENCES tblMarca(codigo),
    CONSTRAINT FK_tblProducto_tblSubcategoria FOREIGN KEY(subcategoria)
    REFERENCES tblSubcategoria(codigo)
);