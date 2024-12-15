-- 1. Tabla Libro (no tiene dependencias)
CREATE TABLE Libro (
    idLibro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL, 
    autor VARCHAR(200) NOT NULL, 
    ISBN VARCHAR(13) NOT NULL, -- ISBN tiene solo 13 cifras
    fechaPublicacion DATE, -- fecha de publicación del libro 
    esPrestable BOOLEAN, -- Determina si el libro es prestable
    enPrestamo BOOLEAN DEFAULT false, -- Determina si esta prestado el libro
    estado VARCHAR(255) -- Descripción libre sobre el libro
);

-- 2. Tabla RolesFunciones
CREATE TABLE RolesFunciones (
    nivelRol INT PRIMARY KEY CHECK (nivelRol >= 1 AND nivelRol <= 5), -- Cambiar si se quiere añadir más roles
    nombre VARCHAR(100), -- nombre del rol
    gestionUsuarios BOOLEAN, -- Permisos sobre la aplicación
    generarInformes BOOLEAN, -- Permisos sobre la aplicación
    gestionColecciones BOOLEAN, -- Permisos sobre la aplicación
    perdonarSanciones BOOLEAN, -- Permisos sobre la aplicación
    gestionConfiguracion BOOLEAN, -- Permisos sobre la aplicación
    gestionTrabajadoresPermisos BOOLEAN -- Permisos sobre la aplicación
);

-- 3. Tabla Configuración (independiente)
CREATE TABLE Configuracion (
    idConfiguracion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL, -- Nombre configuración
    direccion VARCHAR(255) NOT NULL, -- Direccion fisica
    maximaCantidadPrestamos TINYINT NOT NULL CHECK (maximaCantidadPrestamos BETWEEN 0 AND 100), -- Cambiar si la biblioteca quiere permitir mas prestamos simultaneos
    maximaCantidadSanciones TINYINT NOT NULL CHECK (maximaCantidadSanciones BETWEEN 0 AND 100), -- Cambiar si la biblioteca quiere permitir mas sanciones.
    tiempoPrestamos TINYINT NOT NULL CHECK (TiempoPrestamos BETWEEN 0 AND 100), -- Cambiar si se contemplan prestamos de mas de 3 meses y 10 dias
    tiempoPenalizacion TINYINT NOT NULL CHECK (tiempoPenalizacion BETWEEN 0 AND 100), -- Cambiar si se contemplan sanciones de mas de 3 meses y 10 dias
    activo BOOLEAN DEFAULT false -- Atributo que determina que configuración esta activa
);

-- 4. Tabla Trabajador
CREATE TABLE Trabajador (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(9) NOT NULL UNIQUE, -- DNI identificación
    nombre VARCHAR(100) NOT NULL, -- Nombre del trabajador
    apellidos VARCHAR(100) NOT NULL, -- apellidos del trabajador
    direccion VARCHAR(255), -- dirección física del trabajador
    fechaNacimiento DATE,
    telefono VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    nombreUsuario VARCHAR(100) NOT NULL UNIQUE, -- Usuario para el login en la aplicación
    password VARCHAR(255) NOT NULL, -- Contraseña para el login en la aplicación, se almacena encriptado
    nivelRol INT, -- id de rol al que pertenece
    activo BOOLEAN DEFAULT true -- sirve para saber si el trabajador puede logear en la aplicación
);

-- 5. Tabla Cliente (independiente)
CREATE TABLE Cliente (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(9) NOT NULL UNIQUE, -- DNI identificación
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    fechaNacimiento DATE,
    telefono VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    numPrestamosActivos TINYINT(100) DEFAULT 0, -- Prestamos simultaneos del cliente
    numSanciones TINYINT(100) DEFAULT 0, -- numero total de sanciones en el usuario
    estaPenalizado BOOLEAN DEFAULT false, -- Booleano que nos dice si tiene activa una penalización
    estaPenalizadoPerm BOOLEAN DEFAULT false -- Booleano que nos avisa si esta bloqueado el cliente
);

-- 6. Tabla Prestamo (depende de Libro)
CREATE TABLE Prestamo (
    idPrestamo INT AUTO_INCREMENT PRIMARY KEY,
    idLibro INT NOT NULL, -- id de libro prestado
    idCliente INT NOT NULL, -- id de cliente al que se le presta
    inicioPrestamo DATE DEFAULT CURRENT_DATE, -- Se establece automáticamente a la hora de creación
    finPrestamo DATE, -- Determina la fecha a partir de la cual se sancionaria el prestamo
    CONSTRAINT FK_Prestamo_Libro FOREIGN KEY (idLibro) REFERENCES Libro(idLibro) ON DELETE CASCADE -- Si se borra un libro se borra los prestamos asociados
);

-- 7. Tabla Sancion (depende de Cliente)
CREATE TABLE Sancion (
    idSancion INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT NOT NULL, -- ID de cliente sancionado
    dni VARCHAR(20) NOT NULL, -- DNI de cliente sancionado
    motivo VARCHAR(255), -- Motivo de sanción
    diaInicioSancion DATE DEFAULT CURRENT_DATE, -- Se establece automáticamente a la fecha de creación
    diaFinSancion DATE, -- Día que acaba la sanción
    estaActivo BOOLEAN DEFAULT true, -- Booleano que dice si la sanción se esta aplicando, predeterminado a true
    CONSTRAINT FK_Sancion_Cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idUsuario) ON DELETE CASCADE -- Borrar sanciones cuando se elimina cliente
);

-- Inserción de roles en la tabla RolesFunciones
INSERT INTO RolesFunciones (nivelRol, nombre, gestionUsuarios, generarInformes, GestionColecciones, PerdonarSanciones, gestionConfiguracion, gestionTrabajadoresPermisos)
VALUES
(1, 'Auxiliar', true, true, false, false, false, false),
(2, 'Bibliotecario', true, true, true, false, false, false),
(3, 'Encargado', true, true, true, true, false, false),
(4, 'Director', true, true, true, true, true, true),
(5, 'Administrador', true, true, true, true, true, true);

-- Inserción de configuración predeterminada
INSERT INTO Configuracion (nombre, direccion, maximaCantidadPrestamos, maximaCantidadSanciones, tiempoPrestamos, tiempoPenalizacion, activo)
VALUES ('Configuración base', 'Cambie la direccion', 5, 5, 15, 20, true);

INSERT INTO Trabajador (idUsuario, dni, nombre, apellidos, direccion, fechaNacimiento, telefono, email, nombreUsuario, password, nivelRol, activo)
VALUES (NULL, '00000000Z', 'admin', 'admin', 'administrador', CURRENT_DATE, '00', '00', 'administrador', 'administrador', 5, false);