USE site_db;

UPDATE Anuncio
  SET status = 'vendido'
  WHERE id_anuncio = 1;

DELETE FROM Livro
  WHERE preco < 30.00;

SELECT c.nome   AS categoria,
       l.titulo AS livro
  FROM Livro l
  JOIN Categoria c ON l.id_categoria = c.id_categoria
  ORDER BY c.nome, l.titulo;

SELECT u.nome,
       COUNT(a.id_anuncio) AS total_anuncios
  FROM Usuario u
  LEFT JOIN Anuncio a ON u.id_usuario = a.id_usuario
  GROUP BY u.id_usuario;
