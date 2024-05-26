CREATE DATABASE PROYLF;
USE PROYLF;

CREATE TABLE duenos (
    id_dueno INT AUTO_INCREMENT PRIMARY KEY,
    nombre_dueno VARCHAR(100)
);
CREATE TABLE mascotas (
    id_mascota INT AUTO_INCREMENT PRIMARY KEY,
    nombre_mascota VARCHAR(100),
    especie_mascota VARCHAR(100),
    edad_mascota INT,
    color_mascota VARCHAR(50),
    ubicacion_mascota VARCHAR(100),
    id_dueno INT,
    FOREIGN KEY (id_dueno) REFERENCES duenos(id_dueno)
);

INSERT INTO duenos (nombre_dueno) VALUES 
('Juan'),
('María'),
('Pedro'),
('Ana'),
('Carlos'),
('Laura'),
('Miguel'),
('Sofía'),
('Luis'),
('Elena');

INSERT INTO mascotas (nombre_mascota, especie_mascota, edad_mascota, color_mascota, ubicacion_mascota, id_dueno) VALUES
('Luna', 'Gato', 3, 'Negro', 'Casa', 1),
('Max', 'Perro', 5, 'Marrón', 'Jardín', 2),
('Nemo', 'Pez', 1, 'Naranja', 'Acuario', 3),
('Pablo', 'Loro', 10, 'Verde', 'Jaula', 4),
('Bella', 'Gato', 2, 'Blanco', 'Casa', 5),
('Toby', 'Perro', 4, 'Negro', 'Jardín', 6),
('Dory', 'Pez', 2, 'Azul', 'Acuario', 7),
('Kiara', 'León', 6, 'Amarillo', 'Safari', 8),
('Simba', 'León', 5, 'Amarillo', 'Safari', 9),
('Nala', 'León', 4, 'Amarillo', 'Safari', 10);
