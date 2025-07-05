CREATE DATABASE IF NOT EXISTS site_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE site_db;

CREATE TABLE IF NOT EXISTS Usuario (
  id_usuario   INT AUTO_INCREMENT PRIMARY KEY,
  nome         VARCHAR(100) NOT NULL,
  email        VARCHAR(150) NOT NULL UNIQUE,
  senha        VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Categoria (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nome         VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Livro (
  id_livro     INT AUTO_INCREMENT PRIMARY KEY,
  titulo       VARCHAR(200) NOT NULL,
  autor        VARCHAR(150) NOT NULL,
  preco        DECIMAL(10,2) NOT NULL,
  id_categoria INT NOT NULL,
  id_vendedor  INT NOT NULL,
  CONSTRAINT fk_livro_categoria
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria),
  CONSTRAINT fk_livro_vendedor
    FOREIGN KEY (id_vendedor)  REFERENCES Usuario(id_usuario)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Anuncio (
  id_anuncio   INT AUTO_INCREMENT PRIMARY KEY,
  id_livro     INT NOT NULL UNIQUE,
  id_usuario   INT NOT NULL,
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status       ENUM('ativo','vendido','cancelado') NOT NULL DEFAULT 'ativo',
  CONSTRAINT fk_anuncio_livro
    FOREIGN KEY (id_livro ) REFERENCES Livro(id_livro),
  CONSTRAINT fk_anuncio_usuario
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Negociacao (
  id_negociacao   INT AUTO_INCREMENT PRIMARY KEY,
  id_anuncio      INT NOT NULL,
  id_comprador    INT NOT NULL,
  data_negociacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  valor_final     DECIMAL(10,2) NOT NULL,
  status          ENUM('pendente','concluida','recusada') NOT NULL DEFAULT 'pendente',
  CONSTRAINT fk_negociacao_anuncio
    FOREIGN KEY (id_anuncio ) REFERENCES Anuncio(id_anuncio),
  CONSTRAINT fk_negociacao_comprador
    FOREIGN KEY (id_comprador) REFERENCES Usuario(id_usuario)
) ENGINE=InnoDB;
