#!/usr/bin/env bash
# Añade el bloque de hoy al fichero de la semana en curso.
set -euo pipefail
cd "$(dirname "$0")/.."

START="2026-10-19"   # lunes de la Semana 1
TODAY="$(date +%Y-%m-%d)"

if date -j >/dev/null 2>&1; then   # macOS
  s=$(date -j -f %Y-%m-%d "$START" +%s)
  t=$(date -j -f %Y-%m-%d "$TODAY" +%s)
else                                # GNU
  s=$(date -d "$START" +%s)
  t=$(date -d "$TODAY" +%s)
fi

if [ "$t" -lt "$s" ]; then week=0; else week=$(( (t - s) / 604800 + 1 )); fi
f=$(printf "progress/semanas/semana-%02d.md" "$week")

if [ ! -f "$f" ]; then
  echo "No existe $f"
  echo "Créalo copiando la plantilla:"
  echo "  cp progress/TEMPLATE-semana.md $f"
  exit 1
fi

dia=$(LC_TIME=es_ES.UTF-8 date +%A 2>/dev/null || date +%A)
{
  echo ""
  echo "---"
  echo ""
  echo "## ${dia} $(date '+%d %b') · Xh"
  echo ""
  echo "**Hecho**"
  echo "- "
  echo ""
  echo "**Aprendido (lo no obvio)**"
  echo "- "
  echo ""
  echo "**Bloqueado / dudas**"
  echo "- "
  echo ""
  echo "**Mañana**"
  echo "- "
} >> "$f"

echo "Bloque añadido a $f"
command -v "${EDITOR:-}" >/dev/null 2>&1 && "$EDITOR" "$f" || true
