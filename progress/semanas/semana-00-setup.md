# Semana 0 · Setup del puesto de trabajo
**Miércoles 14 → viernes 16 de octubre de 2026** · ~12 h

No es estudio. Es dejar el puesto montado para que la Semana 1 arranque sin fricción.

## Checklist

### Repo y flujo
- ☑ Repo `ai-engineering-path` creado con estructura, plantillas y tablero
- ☐ `git init` y primer commit
- ☐ Repo subido a GitHub (público — trabajar en público es parte del plan)
- ☐ `.env` creado a partir de `.env.example`

### Proveedores
- ☐ API key de proveedor 1, con **límite de gasto configurado en el panel**
- ☐ API key de proveedor 2 (necesitas dos para el comparativo de la Semana 2)
- ☐ Primera llamada de prueba desde TS y desde Ruby, respondiendo correctamente

### Base de datos
- ☐ Postgres local corriendo (Docker o nativo)
- ☐ Extensión pgvector instalada: `CREATE EXTENSION vector;`
- ☐ "Hola mundo": tabla con una columna `vector(3)`, un INSERT y un SELECT por distancia

### Contexto para las sesiones
- ☐ Proyecto creado en Claude, con `PLAN.md` adjunto como contexto permanente
- ☐ Probado que una conversación nueva arranca sabiendo en qué semana vas

### Calendario
- ☐ Los 20 bloques de 4 h de las próximas 4 semanas, puestos como eventos reales
- ☐ Sesión semanal de lunes (45 min) y de viernes (60 min), recurrentes
- ☐ Festivos marcados: 16 nov, 1 feb, 15 mar, 26 mar — mueve el bloque, no acumules deuda

## Verificación de que el setup funciona

Antes de cerrar la Semana 0, esto debe correr sin error:

```sql
CREATE EXTENSION IF NOT EXISTS vector;
CREATE TABLE prueba (id serial PRIMARY KEY, embedding vector(3));
INSERT INTO prueba (embedding) VALUES ('[1,2,3]'), ('[4,5,6]');
SELECT id, embedding <-> '[3,1,2]' AS distancia FROM prueba ORDER BY distancia LIMIT 1;
```

## Cierre
- **Horas reales:** __
- **Qué quedó pendiente y cuándo lo cierro:**
