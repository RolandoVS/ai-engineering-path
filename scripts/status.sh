#!/usr/bin/env bash
# Dónde estoy: semana en curso, logs escritos, último commit.
set -euo pipefail
cd "$(dirname "$0")/.."

START="2026-10-19"
TODAY="$(date +%Y-%m-%d)"

if date -j >/dev/null 2>&1; then
  s=$(date -j -f %Y-%m-%d "$START" +%s); t=$(date -j -f %Y-%m-%d "$TODAY" +%s)
else
  s=$(date -d "$START" +%s); t=$(date -d "$TODAY" +%s)
fi
if [ "$t" -lt "$s" ]; then week=0; else week=$(( (t - s) / 604800 + 1 )); fi

echo "═══════════════════════════════════════"
echo "  ai-engineering-path"
echo "═══════════════════════════════════════"
if [ "$week" -lt 1 ]; then
  echo "  Estado:   Semana 0 (setup)"
  echo "  Arranque: lunes 19 de octubre de 2026"
else
  echo "  Semana:   $week de 26"
  pct=$(( week * 100 / 26 ))
  echo "  Avance:   ${pct}%"
fi
echo "  Fecha:    $TODAY"
echo "───────────────────────────────────────"
n=$(ls progress/semanas/*.md 2>/dev/null | wc -l | tr -d ' ')
echo "  Logs semanales escritos: $n"
echo "  ADRs:                    $(ls decisions/[0-9]*.md 2>/dev/null | wc -l | tr -d ' ')"
echo "  Golden sets:             $(ls evals/golden-sets/* 2>/dev/null | wc -l | tr -d ' ')"
echo "───────────────────────────────────────"
if [ -d .git ]; then
  echo "  Último commit:"
  git log -1 --format='    %cr — %s' 2>/dev/null || echo "    (sin commits)"
  d=$(git log -1 --format=%cd --date=short 2>/dev/null || echo "")
  if [ -n "$d" ] && [ "$d" != "$TODAY" ]; then
    echo ""
    echo "  ⚠  Hoy todavía no hay commit."
  fi
fi
echo "═══════════════════════════════════════"
