-- Tabla Vademecum
CREATE TABLE Vademecum (
    id_vademecum INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(100) NOT NULL,
    principio_activo VARCHAR(100) NOT NULL,
    registro_ministerio VARCHAR(50) NOT NULL,
    dosis_autorizada DECIMAL(5,2) NOT NULL
);

-- Tabla Producto
CREATE TABLE Producto (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    registro_ministerio VARCHAR(50) NOT NULL,
    autorizado BOOLEAN NOT NULL,
    id_vademecum INT,
    FOREIGN KEY (id_vademecum) REFERENCES Vademecum(id_vademecum)
);


-- Tabla Almacen
CREATE TABLE Almacen (
    id_almacen INT PRIMARY KEY AUTO_INCREMENT,
    cantidad INT NOT NULL,
    precio DECIMAL(7,2) NOT NULL,
    fecha DATE NOT NULL
);

-- Tabla Roles
CREATE TABLE Roles (
    id_rol INT PRIMARY KEY AUTO_INCREMENT,
    nombre_rol VARCHAR(50) NOT NULL,
    permisos TEXT NULL
);

-- Tabla Usuarios
CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    id_rol INT,
    FOREIGN KEY (id_rol) REFERENCES Roles(id_rol)
);

-- Tabla Parcela
CREATE TABLE Parcela (
    id_parcela INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    coordenadas VARCHAR(100) NULL,
    provincia VARCHAR(50) NOT NULL,
    municipio VARCHAR(50) NOT NULL,
    paraje VARCHAR(50) NULL,
    poligono VARCHAR(20) NULL,
    superficie_ha DECIMAL(6,2) NOT NULL,
    foto_perimetro VARCHAR(255) NULL,
    ficha_tecnica TEXT NULL
);

-- Tabla Plagas
CREATE TABLE Plagas (
    id_plaga INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    foto VARCHAR(255) NULL,
    tipo VARCHAR(50) NULL,
    descripcion TEXT NULL,
    zona_afectada VARCHAR(100) NULL,
    nivel_riesgo VARCHAR(20) NULL,
    fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Tabla Tratamientos
CREATE TABLE Tratamientos (
    id_tratamiento INT PRIMARY KEY AUTO_INCREMENT,
    dosis DECIMAL(5,2) NOT NULL,
    metodo VARCHAR(100) NOT NULL,
    EPIs VARCHAR(100) NULL,
    fecha DATE NOT NULL,
    id_parcela INT,
    id_plaga INT,
    id_producto INT,
    FOREIGN KEY (id_parcela) REFERENCES Parcela(id_parcela),
    FOREIGN KEY (id_plaga) REFERENCES Plagas(id_plaga),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

-- Tabla Albaranes
CREATE TABLE Albaranes (
    id_albaran INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    observaciones TEXT NULL,
    tipo VARCHAR(50) NOT NULL
);

-- Tabla Albaran_Detalle
CREATE TABLE Albaran_Detalle (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    cantidad INT NOT NULL,
    precio DECIMAL(7,2) NOT NULL,
    id_producto INT,
    id_albaran INT,
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    FOREIGN KEY (id_albaran) REFERENCES Albaranes(id_albaran)
);
