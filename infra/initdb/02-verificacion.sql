-- Prueba de humo de pgvector. Si esto corre, el entorno está listo.

CREATE TABLE IF NOT EXISTS verificacion_pgvector (
  id        serial PRIMARY KEY,
  etiqueta  text NOT NULL,
  embedding vector(3) NOT NULL
);

INSERT INTO verificacion_pgvector (etiqueta, embedding) VALUES
  ('origen',  '[0,0,0]'),
  ('cercano', '[1,1,1]'),
  ('lejano',  '[9,9,9]')
ON CONFLICT DO NOTHING;
