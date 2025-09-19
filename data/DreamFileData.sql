-- Table: usuarios
CREATE TABLE usuarios (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre TEXT NOT NULL,
  nombre_usuario TEXT UNIQUE NOT NULL,
  email TEXT UNIQUE NOT NULL,
  contraseña TEXT NOT NULL,
  rol TEXT CHECK(rol IN ('usuario', 'admin')) DEFAULT 'usuario',
  es_anonimo INTEGER DEFAULT 0,
  fecha_registro TEXT DEFAULT CURRENT_TIMESTAMP
);

-- Table: sueños
CREATE TABLE sueños (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  id_usuario INTEGER NOT NULL,
  titulo TEXT NOT NULL,
  fecha TEXT NOT NULL,
  texto TEXT NOT NULL,
  visibilidad TEXT CHECK(visibilidad IN ('publico', 'privado')) DEFAULT 'publico',
  es_anonimo INTEGER DEFAULT 0,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

-- Table: etiquetas
CREATE TABLE etiquetas (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre TEXT UNIQUE NOT NULL
);

-- Table: sueños_etiquetas
CREATE TABLE sueños_etiquetas (
  id_sueño INTEGER NOT NULL,
  id_etiqueta INTEGER NOT NULL,
  FOREIGN KEY (id_sueño) REFERENCES sueños(id),
  FOREIGN KEY (id_etiqueta) REFERENCES etiquetas(id),
  UNIQUE(id_sueño, id_etiqueta)
);

-- Table: emociones
CREATE TABLE emociones (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  tipo TEXT UNIQUE NOT NULL
);

-- Table: sueños_emociones
CREATE TABLE sueños_emociones (
  id_sueño INTEGER NOT NULL,
  id_emocion INTEGER NOT NULL,
  FOREIGN KEY (id_sueño) REFERENCES sueños(id),
  FOREIGN KEY (id_emocion) REFERENCES emociones(id),
  UNIQUE(id_sueño, id_emocion)
);

-- Table: likes
CREATE TABLE likes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  id_usuario INTEGER NOT NULL,
  id_sueño INTEGER NOT NULL,
  fecha TEXT DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
  FOREIGN KEY (id_sueño) REFERENCES sueños(id),
  UNIQUE(id_usuario, id_sueño)
);
