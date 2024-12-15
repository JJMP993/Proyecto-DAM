        -- Libros
-- Libro bloqueado
INSERT INTO Libro (titulo, enPrestamo, esPrestable, autor, ISBN, fechaPublicacion) 
VALUES ('bloqueado', 0, 0, 'Autor Bloqueado', '9783161484100', '2010-01-01');

-- Libros en préstamo (5 para un cliente, 4 para otro cliente)
INSERT INTO Libro (titulo, enPrestamo, esPrestable, autor, ISBN, fechaPublicacion) 
VALUES ('prestado 1', 1, 1, 'Autor 1', '9781234567890', '2015-03-01');
INSERT INTO Libro (titulo, enPrestamo, esPrestable, autor, ISBN, fechaPublicacion) 
VALUES ('prestado 2', 1, 1, 'Autor 2', '9781234567891', '2016-04-01');
INSERT INTO Libro (titulo, enPrestamo, esPrestable, autor, ISBN, fechaPublicacion) 
VALUES ('prestado 3', 1, 1, 'Autor 3', '9781234567892', '2017-05-01');
INSERT INTO Libro (titulo, enPrestamo, esPrestable, autor, ISBN, fechaPublicacion) 
VALUES ('prestado 4', 1, 1, 'Autor 4', '9781234567893', '2018-06-01');
INSERT INTO Libro (titulo, enPrestamo, esPrestable, autor, ISBN, fechaPublicacion) 
VALUES ('prestado 5', 1, 1, 'Autor 5', '9781234567894', '2019-07-01');

INSERT INTO Libro (titulo, enPrestamo, esPrestable, autor, ISBN, fechaPublicacion) 
VALUES ('prestado 6', 1, 1, 'Autor 6', '9781234567895', '2020-08-01');
INSERT INTO Libro (titulo, enPrestamo, esPrestable, autor, ISBN, fechaPublicacion) 
VALUES ('prestado 7', 1, 1, 'Autor 7', '9781234567896', '2021-09-01');
INSERT INTO Libro (titulo, enPrestamo, esPrestable, autor, ISBN, fechaPublicacion) 
VALUES ('prestado 8', 1, 1, 'Autor 8', '9781234567897', '2022-10-01');
INSERT INTO Libro (titulo, enPrestamo, esPrestable, autor, ISBN, fechaPublicacion) 
VALUES ('prestado 9', 1, 1, 'Autor 9', '9781234567898', '2023-11-01');

-- Libros en préstamo pasado
INSERT INTO Libro (titulo, enPrestamo, esPrestable, autor, ISBN, fechaPublicacion, estado) 
VALUES ('prestado pasado', 1, 1, 'Autor Pasado', '9783161484101', '2009-12-01', 'Bien');
INSERT INTO Libro (titulo, enPrestamo, esPrestable, autor, ISBN, fechaPublicacion) 
VALUES ('Prestamo pasado', 1, 1, 'Autor Aleatorio 1', '9783161484102', '2020-01-01');

-- Libros prestables (sin préstamo)
INSERT INTO Libro (titulo, enPrestamo, esPrestable, autor, ISBN, fechaPublicacion) 
VALUES ('aleatorio 1', 0, 1, 'Autor Aleatorio 1', '9783161484103', '2021-02-01');
INSERT INTO Libro (titulo, enPrestamo, esPrestable, autor, ISBN, fechaPublicacion) 
VALUES ('aleatorio 2', 0, 1, 'Autor Aleatorio 2', '9783161484104', '2022-03-01');
INSERT INTO Libro (titulo, enPrestamo, esPrestable, autor, ISBN, fechaPublicacion) 
VALUES ('aleatorio 3', 0, 1, 'Autor Aleatorio 3', '9783161484105', '2023-04-01');
INSERT INTO Libro (titulo, enPrestamo, esPrestable, autor, ISBN, fechaPublicacion) 
VALUES ('aleatorio 4', 0, 1, 'Autor Aleatorio 4', '9783161484106', '2024-05-01');


        -- Clientes
-- Cliente con 5 préstamos activos 'prestamos 5 limite'
INSERT INTO Cliente (nombre, apellidos, dni, telefono, email, estaPenalizado, estaPenalizadoPerm, numPrestamosActivos, numSanciones) 
VALUES ('prestamos 5 limite', 'Apellido1', '12345678A', '600123456', 'cliente1@example.com', 0, 0, 5, 0);

-- Cliente con 4 préstamos activos 'prestamos 4'
INSERT INTO Cliente (nombre, apellidos, dni, telefono, email, estaPenalizado, estaPenalizadoPerm, numPrestamosActivos, numSanciones) 
VALUES ('prestamos 4', 'Apellido2', '23456789B', '600234567', 'cliente2@example.com', 0, 0, 4, 0);

-- Cliente con 2 préstamos pasados 'prestamo pasado'
INSERT INTO Cliente (nombre, apellidos, dni, telefono, email, estaPenalizado, estaPenalizadoPerm, numPrestamosActivos, numSanciones) 
VALUES ('prestamo pasado', 'Apellido3', '34567890C', '600345678', 'cliente3@example.com', 0, 0, 2, 0);

-- Cliente penalizado con 4 sanciones 'penalizado'
INSERT INTO Cliente (nombre, apellidos, dni, telefono, email, estaPenalizado, estaPenalizadoPerm, numPrestamosActivos, numSanciones) 
VALUES ('penalizado', 'Apellido4', '45678901D', '600456789', 'cliente4@example.com', 1, 0, 0, 4);

-- Cliente con 2 sanciones activas 'doble Sancion'
INSERT INTO Cliente (nombre, apellidos, dni, telefono, email, estaPenalizado, estaPenalizadoPerm, numPrestamosActivos, numSanciones) 
VALUES ('doble Sancion', 'Apellido5', '56789012E', '600567890', 'cliente5@example.com', 1, 0, 0, 2);

-- Cliente con sanción acabada (sigue con estaPenalizado en true) 'sanción acabada'
INSERT INTO Cliente (nombre, apellidos, dni, telefono, email, estaPenalizado, estaPenalizadoPerm, numPrestamosActivos, numSanciones) 
VALUES ('sanción acabada', 'Apellido6', '67890123F', '600678901', 'cliente6@example.com', 1, 0, 0, 1);

-- Cliente bloqueado permanentemente 'bloqueado'
INSERT INTO Cliente (nombre, apellidos, dni, telefono, email, estaPenalizado, estaPenalizadoPerm, numPrestamosActivos, numSanciones) 
VALUES ('bloqueado', 'Apellido7', '78901234G', '600789012', 'cliente7@example.com', 1, 1, 0, 0);

-- Cliente sin penalizaciones y sin préstamos 'Cliente limpio'
INSERT INTO Cliente (nombre, apellidos, dni, telefono, email, estaPenalizado, estaPenalizadoPerm, numPrestamosActivos, numSanciones) 
VALUES ('Cliente limpio', 'Apellido8', '89012345H', '600890123', 'cliente8@example.com', 0, 0, 0, 0);


        -- Prestamos
-- Préstamos del cliente "prestamos 5 limite"
INSERT INTO Prestamo (idCliente, idLibro, finPrestamo) VALUES (1, 2, DATE_ADD(CURRENT_DATE, INTERVAL 10 DAY));
INSERT INTO Prestamo (idCliente, idLibro, finPrestamo) VALUES (1, 3, DATE_ADD(CURRENT_DATE, INTERVAL 11 DAY));
INSERT INTO Prestamo (idCliente, idLibro, finPrestamo) VALUES (1, 4, DATE_ADD(CURRENT_DATE, INTERVAL 40 DAY));
INSERT INTO Prestamo (idCliente, idLibro, finPrestamo) VALUES (1, 5, DATE_ADD(CURRENT_DATE, INTERVAL 9 DAY));
INSERT INTO Prestamo (idCliente, idLibro, finPrestamo) VALUES (1, 6, DATE_ADD(CURRENT_DATE, INTERVAL 5 DAY));

-- Préstamos del cliente "prestamos 4"
INSERT INTO Prestamo (idCliente, idLibro, finPrestamo) VALUES (2, 7, DATE_ADD(CURRENT_DATE, INTERVAL 8 DAY));
INSERT INTO Prestamo (idCliente, idLibro, finPrestamo) VALUES (2, 8, DATE_ADD(CURRENT_DATE, INTERVAL 7 DAY));
INSERT INTO Prestamo (idCliente, idLibro, finPrestamo) VALUES (2, 9, DATE_ADD(CURRENT_DATE, INTERVAL 6 DAY));
INSERT INTO Prestamo (idCliente, idLibro, finPrestamo) VALUES (2, 10, DATE_ADD(CURRENT_DATE, INTERVAL 4 DAY));

-- Préstamo pasado del cliente "prestamo pasado"
INSERT INTO Prestamo (idCliente, idLibro, finPrestamo) VALUES (3, 11, DATE_SUB(CURRENT_DATE, INTERVAL 3 DAY));
INSERT INTO Prestamo (idCliente, idLibro, finPrestamo) VALUES (3, 12, DATE_SUB(CURRENT_DATE, INTERVAL 5 DAY));


        -- Sanciones
-- Sanciones del cliente "penalizado"
INSERT INTO Sancion (idCliente, dni, motivo, diaFinSancion, estaActivo) 
VALUES (4, '45678901D', 'penalizado pasada', DATE_SUB(CURRENT_DATE, INTERVAL 2 DAY), 0);
INSERT INTO Sancion (idCliente, dni, motivo, diaFinSancion, estaActivo) 
VALUES (4, '45678901D', 'penalizado pasada', DATE_SUB(CURRENT_DATE, INTERVAL 3 DAY), 0);
INSERT INTO Sancion (idCliente, dni, motivo, diaFinSancion, estaActivo) 
VALUES (4, '45678901D', 'penalizado pasada', DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), 0);
INSERT INTO Sancion (idCliente, dni, motivo, diaFinSancion, estaActivo) 
VALUES (4, '45678901D', 'penalizado vigente', DATE_ADD(CURRENT_DATE, INTERVAL 4 DAY), 1);

-- Sanciones del cliente "doble Sancion"
INSERT INTO Sancion (idCliente, dni, motivo, diaFinSancion, estaActivo) 
VALUES (5, '56789012E', 'doble sancion activa', DATE_ADD(CURRENT_DATE, INTERVAL 3 DAY), 1);
INSERT INTO Sancion (idCliente, dni, motivo, diaFinSancion, estaActivo) 
VALUES (5, '56789012E', 'doble sancion activa', DATE_ADD(CURRENT_DATE, INTERVAL 3 DAY), 1);

-- Sanción acabada del cliente "sanción acabada" (estaActivo sigue en true)
INSERT INTO Sancion (idCliente, dni, motivo, diaFinSancion, estaActivo) 
VALUES (6, '67890123F', 'sancion acabada', DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), 1);


        -- Trabajadores
-- Trabajador 1: Auxiliar
INSERT INTO Trabajador (dni, nombre, nombreUsuario, password, nivelRol, direccion, fechaNacimiento, telefono, email, activo)
VALUES (
    '12345678A',                             -- DNI ficticio
    'auxiliar',                              -- Nombre
    'auxiliar',                              -- nombreUsuario
    'c9cb8ec45a13d891d9879a49944b7b6dbefc916c56203637645c7e6cf7c',     -- Contraseña cifrada 'auxiliar'
    1,                                       -- nivelRol
    'Calle Falsa 123',                       -- Dirección ficticia
    '1985-01-15',                            -- Fecha de nacimiento ficticia
    '600000000',                             -- Teléfono ficticio
    'auxiliar@example.com',                  -- Email ficticio
    true                                     -- activo
);

-- Trabajador 2: Bibliotecario
INSERT INTO Trabajador (dni, nombre, nombreUsuario, password, nivelRol, direccion, fechaNacimiento, telefono, email, activo)
VALUES (
    '23456789B',                             -- DNI ficticio
    'bibliotecario',                         -- Nombre
    'bibliotecario',                         -- nombreUsuario
    '8e133e19f9bcdc34fa2ea1af34b47337eeb7d951ad4fb32ad502ccbaf4f8d52', -- Contraseña cifrada 'bibliotecario'
    2,                                       -- nivelRol
    'Calle Falsa 124',                       -- Dirección ficticia
    '1982-05-22',                            -- Fecha de nacimiento ficticia
    '600000001',                             -- Teléfono ficticio
    'bibliotecario@example.com',             -- Email ficticio
    true                                     -- activo
);

-- Trabajador 3: Encargado
INSERT INTO Trabajador (dni, nombre, nombreUsuario, password, nivelRol, direccion, fechaNacimiento, telefono, email, activo)
VALUES (
    '34567890C',                             -- DNI ficticio
    'encargado',                             -- Nombre
    'encargado',                             -- nombreUsuario
    'c2c121e023468d59921f346426f1dec4e68f9a075776eba5beb2d88ee782c4',    -- Contraseña cifrada 'encargado'
    3,                                       -- nivelRol
    'Calle Falsa 125',                       -- Dirección ficticia
    '1978-11-30',                            -- Fecha de nacimiento ficticia
    '600000002',                             -- Teléfono ficticio
    'encargado@example.com',                 -- Email ficticio
    true                                     -- activo
);

-- Trabajador 4: Director
INSERT INTO Trabajador (dni, nombre, nombreUsuario, password, nivelRol, direccion, fechaNacimiento, telefono, email, activo)
VALUES (
    '45678901D',                             -- DNI ficticio
    'director',                              -- Nombre
    'director',                              -- nombreUsuario
    'ef7d74898c22a4bfbe437d3987bc945310dcdf1ddb48a6bce085f376b32ae',     -- Contraseña cifrada 'director'
    4,                                       -- nivelRol
    'Calle Falsa 126',                       -- Dirección ficticia
    '1975-09-12',                            -- Fecha de nacimiento ficticia
    '600000003',                             -- Teléfono ficticio
    'director@example.com',                  -- Email ficticio
    false                                    -- activo en false
);