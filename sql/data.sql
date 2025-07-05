USE site_db;

INSERT INTO Usuario (nome, email, senha) VALUES
  ('Alice', 'alice@mail.com', 'senha123'),
  ('Bruno', 'bruno@mail.com', 'brunoPwd');

INSERT INTO Categoria (nome) VALUES
  ('Ficcao'),
  ('Nao-Ficcao'),
  ('Romance');

INSERT INTO Livro (titulo, autor, preco, id_categoria, id_vendedor) VALUES
  ('O Senhor dos Aneis','J.R.R. Tolkien', 50.00, 1, 1),
  ('Aprendendo SQL'     ,'Alan Beaulieu', 80.00, 2, 2);

INSERT INTO Anuncio (id_livro, id_usuario, status) VALUES
  (1, 1, 'ativo'),
  (2, 2, 'ativo');

INSERT INTO Negociacao (id_anuncio, id_comprador, valor_final, status) VALUES
  (1, 2, 48.00, 'pendente');
