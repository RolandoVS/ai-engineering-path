#!/usr/bin/env bash
# Verifica que Postgres + pgvector están listos. Parte del checklist de Semana 0.
set -euo pipefail
cd "$(dirname "$0")/.."

PSQL="docker compose exec -T db psql -U ai_path -d ai_path_dev -v ON_ERROR_STOP=1"

echo "── Contenedor ─────────────────────────"
if ! docker compose ps --status running --quiet db >/dev/null 2>&1 \
   || [ -z "$(docker compose ps --status running --quiet db 2>/dev/null)" ]; then
  echo "  ✗ El contenedor no está corriendo."
  echo "    docker compose up -d"
  exit 1
fi
echo "  ✓ corriendo"

echo "── Versiones ──────────────────────────"
$PSQL -tAc "SELECT 'postgres ' || current_setting('server_version');" | sed 's/^/  /'
$PSQL -tAc "SELECT 'pgvector ' || extversion FROM pg_extension WHERE extname='vector';" | sed 's/^/  /'

echo "── Memoria para índices ───────────────"
$PSQL -tAc "SELECT '  shared_buffers       ' || current_setting('shared_buffers');"
$PSQL -tAc "SELECT '  maintenance_work_mem ' || current_setting('maintenance_work_mem');"

echo "── Búsqueda por distancia ─────────────"
$PSQL -tAc "
  SELECT '  ' || etiqueta || '  d=' || round((embedding <-> '[1,1,1]')::numeric, 3)
  FROM verificacion_pgvector
  ORDER BY embedding <-> '[1,1,1]';"

echo "── ¿Usa el índice? ────────────────────"
$PSQL -q <<'SQL'
CREATE INDEX IF NOT EXISTS idx_verif_hnsw
  ON verificacion_pgvector USING hnsw (embedding vector_l2_ops);
SQL
plan=$($PSQL -tAc "
  EXPLAIN (FORMAT TEXT)
  SELECT id FROM verificacion_pgvector ORDER BY embedding <-> '[1,1,1]' LIMIT 1;")
echo "$plan" | sed 's/^/  /'
if echo "$plan" | grep -qi 'seq scan'; then
  echo ""
  echo "  ⚠  Sequential scan: con 3 filas es NORMAL — el planificador"
  echo "     decide que recorrerlas es más barato que usar el índice."
  echo "     Con volumen real, un seq scan aquí sería un bug."
fi
echo "───────────────────────────────────────"
echo "  ✓ Entorno listo"
