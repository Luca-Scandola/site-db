CREATE DATABASE IF NOT EXISTS `site-db`;
USE `site-db`;

CREATE TABLE Usuario (
  id         VARCHAR(36),
  nome       TEXT,
  email      TEXT,
  senha      TEXT
);

CREATE TABLE Categoria (
  id         VARCHAR(36),
  nome       TEXT
);

CREATE TABLE Livro (
  id               VARCHAR(36),
  titulo           TEXT,
  autor            TEXT,
  preco            TEXT,
  categoria_id     VARCHAR(36),
  vendedor_id      VARCHAR(36),
  data_lancamento  INT
);

CREATE TABLE Anuncio (
  id            VARCHAR(36),
  livro_id      VARCHAR(36),
  usuario_id    VARCHAR(36),
  data_criacao  INT,
  status        TEXT
);

CREATE TABLE Negociacao (
  id              VARCHAR(36),
  anuncio_id      VARCHAR(36),
  comprador_id    VARCHAR(36),
  data_negociacao INT,
  valor_final     TEXT,
  status          TEXT
);
