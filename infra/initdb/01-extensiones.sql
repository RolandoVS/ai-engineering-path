-- Se ejecuta automáticamente la primera vez que se crea el volumen.

CREATE EXTENSION IF NOT EXISTS vector;
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;
-- Búsqueda por trigramas: la vas a necesitar para la búsqueda híbrida (Fase 2),
-- donde full-text y vectorial se combinan con RRF.
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- Una base por fase evita que un experimento contamine al siguiente.
CREATE DATABASE fase02_busqueda OWNER ai_path;
CREATE DATABASE fase03_rag      OWNER ai_path;
