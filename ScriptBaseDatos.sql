CREATE DATABASE saludDigna;

USE saludDigna;

CREATE TABLE estudios (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Estudio VARCHAR(255) NOT NULL,
    Detalle VARCHAR(255),
    Estatus BIT
);

CREATE TABLE sucursales (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Ubicacion VARCHAR(255) NOT NULL,
    Sucursal VARCHAR(255) NOT NULL,
    Estatus BIT
);

INSERT INTO estudios (Estudio, Detalle, Estatus)
VALUES
    ('Laboratorio', 'Pruebas de laboratorio', 1),
    ('Ultrasonido', 'Estudios de ultrasonido', 1),
    ('Lentes', 'Evaluación y fabricación de lentes', 1),
    ('Rayos X', 'Radiografías', 1),
    ('Mastografía', 'Mamografías', 1),
    ('Papanicolaou', 'Examen Papanicolaou', 1),
    ('Densitometría', 'Densitometría ósea', 1),
    ('Electrocardiograma', 'Electrocardiograma', 1),
    ('Tomografía', 'Tomografía computarizada', 1),
    ('Nutrición', 'Asesoría nutricional', 1),
    ('Resonancia magnética', 'Resonancia magnética', 1);
   
   INSERT INTO sucursales (Ubicacion, Sucursal, Estatus)
VALUES
    ('Aguascalientes', 'Sucursal Aguascalientes', 1),
    ('Baja California', 'Sucursal Baja California', 1),
    ('Baja California Sur', 'Sucursal Baja California Sur', 1),
    ('Campeche', 'Sucursal Campeche', 1),
    ('Chiapas', 'Sucursal Chiapas', 1),
    ('Chihuahua', 'Sucursal Chihuahua', 1),
    ('Coahuila', 'Sucursal Coahuila', 1),
    ('Colima', 'Sucursal Colima', 1),
    ('Durango', 'Sucursal Durango', 1),
    ('Guanajuato', 'Sucursal Guanajuato', 1);

CREATE PROCEDURE GetEstudiosActivos
AS
BEGIN
    SELECT * FROM estudios WHERE Estatus = 1;
END;

CREATE PROCEDURE GetSucursalesActivas
AS
BEGIN
    SELECT * FROM sucursales WHERE Estatus = 1;
END;

   

SELECT * FROM estudios WHERE Estatus = 1;

UPDATE saludDigna.dbo.sucursales SET  Estatus=0 WHERE Id in (1,2,3,4,5);
UPDATE saludDigna.dbo.sucursales SET  Estatus=1 WHERE Id in (1,2,3,4,5);

UPDATE saludDigna.dbo.estudios SET  Estatus=0 WHERE Id in (1,3,5,7,9);
UPDATE saludDigna.dbo.estudios SET  Estatus=1 WHERE Id in (1,3,5,7,9);

SELECT * from estudios;
SELECT * from sucursales;

EXEC GetSucursalesActivas;

EXEC GetEstudiosActivos;

