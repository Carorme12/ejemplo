-- Crear la base de datos
CREATE DATABASE ProyectoFundamentos;
GO

-- Usar la base de datos
USE ProyectoFundamentos;
GO

CREATE TABLE Departamentos (
    DeptoID INT PRIMARY KEY,
    NombreDepto VARCHAR(100),
	MontoDisponible decimal,
);

-- Tabla de Roles
CREATE TABLE Roles (
    RolID INT PRIMARY KEY,
    NombreRol VARCHAR(50)
);

-- Tabla de Usuarios
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY, -- Código Usuario
    Nombre VARCHAR(50),
    CorreoElectronico VARCHAR(100),
    Contraseña VARCHAR(50),
    Telefono VARCHAR(25),
	DeptoID int,
	RolID int,
	FOREIGN KEY (DeptoID) REFERENCES Departamentos(DeptoID),
	FOREIGN KEY (RolID) REFERENCES Roles(RolID)
    -- RolID (puedes añadirlo si decides asociar roles directamente con usuarios)
);

-- Tabla de Proveedor
CREATE TABLE Proveedor (
    idProveedor INT PRIMARY KEY, -- CodigoProveedor
	CodigoProveedor varchar(100),
    NombreRepresentante VARCHAR(75),
    TipoProveedor VARCHAR(50),
    NombreEmpresa VARCHAR(100),
    Contacto VARCHAR(50),
    Correo VARCHAR(50),
    Departamento VARCHAR(100),
    Provincia VARCHAR(75),
    Direccion VARCHAR(200),
    Estado varchar(200)

    -- CategoriaProveedorID (añadir si deseas asociar proveedores con categorías)
);


-- Tabla de Productos
CREATE TABLE Productos (
    idProducto INT PRIMARY KEY, -- CodigoProducto
    NombreProducto VARCHAR(75),
    Precio MONEY,
	CategoriaProducto varchar(200),
    ProveedorID INT, -- añadir la columna para la clave foránea
    FOREIGN KEY (ProveedorID) REFERENCES Proveedor(idProveedor)
);

-- Tabla de Asignación de Roles a Usuarios
--CREATE TABLE AsignacionRoles (
--    AsignacionID INT PRIMARY KEY,
--    UsuarioID INT,
--    RolID INT,
--    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
--    FOREIGN KEY (RolID) REFERENCES Roles(RolID)
--);

-- Tabla de Compras
CREATE TABLE Compras (
    CompraID INT PRIMARY KEY,
	NumeroOrden varchar(200),
	Prioridad varchar (200),
	Solicitante varchar(200),
	Cantidad varchar(100),
	UsuarioID INT,
    ProductoID INT, -- nueva columna para la conexión con Productos
	Proveedorid int,
	Estado VARCHAR(50),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(idProducto),
	FOREIGN KEY (Proveedorid) REFERENCES Proveedor(idProveedor)
);

CREATE TABLE AsignacionRecursos (
    AsignacionRecursosID INT PRIMARY KEY,
	Monto decimal,
	Fecha Date,
	DeptoID int,
    FOREIGN KEY (DeptoID) REFERENCES Departamentos(DeptoID),

);

