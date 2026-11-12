# Semana 0 · Setup del puesto de trabajo
**Miércoles 14 → viernes 16 de octubre de 2026** · ~12 h

No es estudio. Es dejar el puesto montado para que la Semana 1 arranque sin fricción.

## Checklist

### Repo y flujo
- ☑ Repo `ai-engineering-path` creado con estructura, plantillas y tablero
- ☑ `git init` y primer commit
- ☑ Repo subido a GitHub (público — trabajar en público es parte del plan)
- ☑ `.env` creado a partir de `.env.example`

### Proveedores
- ☑ API key de proveedor 1, con **límite de gasto configurado en el panel**
- ☑ API key de proveedor 2 (necesitas dos para el comparativo de la Semana 2)
- ☑ Primera llamada de prueba desde TS y desde Ruby, respondiendo correctamente

### Base de datos
- ☑ Docker Desktop corriendo
- ☑ `docker compose up -d` desde la raíz del repo (con `PGPORT=5433`: el 5432 lo ocupa `adara_db`)
- ☑ `docker compose ps` dice **healthy**
- ☑ `./scripts/db-check.sh` pasa entero

### Contexto para las sesiones
- ☑ Proyecto creado en Claude, con `PLAN.md` adjunto como contexto permanente
- ☑ Probado que una conversación nueva arranca sabiendo en qué semana vas

### Calendario
- ⊘ ~Los 20 bloques de 4 h de las próximas 4 semanas, puestos como eventos reales~ — descartado por decisión propia
- ⊘ ~Sesión semanal de lunes (45 min) y de viernes (60 min), recurrentes~ — descartado por decisión propia
- ⊘ ~Festivos marcados: 16 nov, 1 feb, 15 mar, 26 mar — mueve el bloque, no acumules deuda~ — descartado por decisión propia

## Verificación de que el setup funciona

```bash
cd ~/Documents/Projects/ai-engineering-path
docker compose up -d
./scripts/db-check.sh
```

Debe imprimir versión de Postgres, versión de pgvector, los ajustes de memoria,
y las tres filas de prueba ordenadas por distancia.

**Lo que vas a ver y conviene que entiendas:** el `EXPLAIN` final dice *sequential
scan*. Con tres filas es correcto — el planificador decide que recorrerlas es más
barato que usar el índice. Con volumen real, ese mismo mensaje sería un bug, y es
uno de los modos de fallo silenciosos de pgvector que atacas en la Fase 2.

## Cierre
- **Horas reales:** 4 (de ~12 planeadas)
- **Qué quedó pendiente y cuándo lo cierro:** nada. El calendario se descartó a propósito; el seguimiento del atraso vive en `progress/deuda.md` y `scripts/status.sh`. Repo público: https://github.com/RolandoVS/ai-engineering-path
