DROP DATABASE IF EXISTS dreamfile;
CREATE DATABASE dreamfile;
USE dreamfile;

-- Tabla de usuarios
CREATE TABLE usuarios (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  nombre_usuario VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  contrasena VARCHAR(255) NOT NULL,
  rol ENUM('usuario', 'admin') DEFAULT 'usuario',
  fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de suenos
CREATE TABLE suenos (
  id_sueno INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  titulo VARCHAR(100) NOT NULL,
  fecha DATE NOT NULL,
  texto TEXT NOT NULL,
  visibilidad ENUM('publico', 'privado') DEFAULT 'publico',
  es_anonimo BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Tabla de etiquetas
CREATE TABLE etiquetas (
  id_etiqueta INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE
);

-- Relacion N:N entre suenos y etiquetas
CREATE TABLE suenos_etiquetas (
  id_sueno INT NOT NULL,
  id_etiqueta INT NOT NULL,
  FOREIGN KEY (id_sueno) REFERENCES suenos(id_sueno),
  FOREIGN KEY (id_etiqueta) REFERENCES etiquetas(id_etiqueta),
  UNIQUE(id_sueno, id_etiqueta)
);

-- Tabla de emociones
CREATE TABLE emociones (
  id_emocion INT AUTO_INCREMENT PRIMARY KEY,
  tipo VARCHAR(50) NOT NULL UNIQUE
);

-- Relacion N:N entre suenos y emociones
CREATE TABLE suenos_emociones (
  id_sueno INT NOT NULL,
  id_emocion INT NOT NULL,
  FOREIGN KEY (id_sueno) REFERENCES suenos(id_sueno),
  FOREIGN KEY (id_emocion) REFERENCES emociones(id_emocion),
  UNIQUE(id_sueno, id_emocion)
);

-- Tabla de likes
CREATE TABLE likes (
  id_like INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  id_sueno INT NOT NULL,
  fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
  FOREIGN KEY (id_sueno) REFERENCES suenos(id_sueno),
  UNIQUE(id_usuario, id_sueno)
);

INSERT INTO usuarios (nombre, nombre_usuario, email, contrasena, rol)
VALUES 
('Manuel Ortega', 'manuel_dreamer', 'manuel@example.com', 'clave_segura123', 'usuario'),
('Lucia Torres', 'lucia_admin', 'lucia@example.com', 'adminpass456', 'admin'),
('Carlos Ruiz', 'carlos_rz', 'carlos@example.com', 'carlosclave789', 'usuario');

INSERT INTO suenos (id_usuario, titulo, fecha, texto, visibilidad, es_anonimo)
VALUES 
(1, 'El bosque que habla', '2025-09-20', 'Sone que los arboles susurraban secretos antiguos...', 'publico', TRUE),
(2, 'Caida infinita', '2025-09-18', 'Sentia que caia sin fin, pero no tenia miedo...', 'privado', FALSE),
(3, 'La ciudad flotante', '2025-09-19', 'Una metropolis suspendida en el cielo, llena de luces...', 'publico', TRUE);

INSERT INTO emociones (tipo)
VALUES ('misterio'), ('miedo'), ('calma'), ('asombro');

INSERT INTO suenos_emociones (id_sueno, id_emocion)
VALUES 
(1, 1), -- misterio
(1, 3), -- calma
(2, 2), -- miedo
(3, 4); -- asombro

INSERT INTO etiquetas (nombre)
VALUES ('naturaleza'), ('bosque'), ('caida'), ('ciudad'), ('fantasia');

INSERT INTO suenos_etiquetas (id_sueno, id_etiqueta)
VALUES 
(1, 1), (1, 2),
(2, 3),
(3, 4), (3, 5);

INSERT INTO likes (id_usuario, id_sueno)
VALUES 
(2, 1), -- Lucia le da like al sueno de Manuel
(3, 1), -- Carlos tambien
(1, 3); -- Manuel le da like al sueno de Carlos
