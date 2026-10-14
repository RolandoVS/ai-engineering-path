# ai-engineering-path

De Senior Backend (Node/TS · Rails) a **AI Software Engineer**.
26 semanas · 20 h/semana · **19 oct 2026 → 30 abr 2027**

Este repo es la fuente de verdad del plan. El chat no lo es.
Si un día no hay commit ni log, ese día no ocurrió.

---

## Tablero de progreso

Marca la semana cuando su log esté escrito y el entregable commiteado.

| ✓ | S | Semana del | Fase | Foco | Entregable |
|---|---|---|---|---|---|
| ☐ | 0 | 14 oct (mié–vie) | — | Setup del puesto de trabajo | Repo, keys, pgvector, calendario |
| ☐ | 1 | 19 oct 2026 | 0 | Modelo mental del LLM, tokenización | — |
| ☐ | 2 | 26 oct 2026 | 0 | Economía de la inferencia | **Benchmark + calculadora** |
| ☐ | 3 | 2 nov 2026 | 1 | Prompting y salidas estructuradas | — |
| ☐ | 4 | 9 nov 2026 | 1 | Streaming, tool calling, resiliencia | — |
| ☐ | 5 | 16 nov 2026 | 1 | Context engineering | **Microservicio extracción** |
| ☐ | 6 | 23 nov 2026 | 2 | Embeddings y chunking | — |
| ☐ | 7 | 30 nov 2026 | 2 | pgvector a fondo | — |
| ☐ | 8 | 7 dic 2026 | 2 | Híbrida y reranking | **Motor de búsqueda** |
| ☐ | 9 | 14 dic 2026 | 3 | Pipeline de ingesta | — |
| — | — | **21 dic – 1 ene** | — | **Pausa navideña** | — |
| ☐ | 10 | 4 ene 2027 | 3 | Query understanding | — |
| ☐ | 11 | 11 ene 2027 | 3 | Recuperación agéntica | — |
| ☐ | 12 | 18 ene 2027 | 3 | Evaluación sistemática | **Servicio multi-tenant** |
| ☐ | 13 | 25 ene 2027 | 4 | Anatomía del agente · **CHECKPOINT** | — |
| ☐ | 14 | 1 feb 2027 | 4 | Frameworks y protocolos | — |
| ☐ | 15 | 8 feb 2027 | 4 | Durabilidad y HITL | — |
| ☐ | 16 | 15 feb 2027 | 4 | Seguridad agéntica | **Agente durable + MCP** |
| ☐ | 17 | 22 feb 2027 | 5 | Routing y cascadas | — |
| ☐ | 18 | 1 mar 2027 | 5 | Destilación y LoRA | — |
| ☐ | 19 | 8 mar 2027 | 5 | Serving y make-vs-buy | **Informe de coste** |
| ☐ | 20 | 15 mar 2027 | 6 | Observabilidad · **REVISIÓN PLAN** | — |
| ☐ | 21 | 22 mar 2027 | 6 | Evals continuos y A/B | — |
| ☐ | 22 | 29 mar 2027 | 6 | Seguridad y gobierno | — |
| ☐ | 23 | 5 abr 2027 | 6 | Escala y fiabilidad | **LLM Gateway** |
| ☐ | 24 | 12 abr 2027 | 7 | Capstone: construcción | — |
| ☐ | 25 | 19 abr 2027 | 7 | Capstone: endurecimiento | — |
| ☐ | 26 | 26 abr 2027 | 7 | System design y portfolio | **Capstone + portfolio** |

**Buffer restante:** 2 semanas. Si las usas, cierre el 14 de mayo de 2027.

---

## Cómo se trabaja aquí

**Ritmo diario (4 h):**

| Tramo | Qué |
|---|---|
| 0:00–0:15 | Relees el objetivo de la semana y el log de ayer |
| 0:15–2:15 | Bloque profundo 1 — implementación, sin notificaciones |
| 2:15–2:30 | Descanso real, lejos de la pantalla |
| 2:30–3:45 | Bloque profundo 2 |
| 3:45–4:00 | **Escribes el log** |

Esos 15 minutos finales sostienen todo lo demás.

**Ritmo semanal:**

- **Lunes (30–45 min)** — pegas `progress/semanas/<semana>.md` en el chat. Se define el entregable y los 5 bloques.
- **Viernes (45–60 min)** — pegas lo hecho. Code review, cuestionamiento de decisiones, ajuste de la siguiente semana.
- **Fin de fase** — simulación de entrevista de 45 min. El checklist de la fase es una puerta, no una sugerencia.

**Comandos:**

```bash
./scripts/new-day.sh      # crea el log de hoy desde la plantilla
./scripts/status.sh       # resumen: semana actual, racha, pendientes
```

---

## Estructura

```
PLAN.md                 El plan completo (v2, oct 2026)
progress/
  semanas/              Un fichero por semana, con los 5 días dentro
decisions/              ADRs. Uno por módulo, mínimo
projects/               Un directorio por entregable de fase
evals/                  Golden sets y resultados de evaluación
docs/                   Notas y borradores de artículos
scripts/                Utilidades del flujo de trabajo
```

## Reglas

1. Todo lo que afirmes en un README tiene un número detrás que tú mediste.
2. El eval se escribe antes que la feature.
3. Un ADR por módulo, mínimo.
4. Cuando el plan contradiga a la documentación oficial del día, **gana la documentación**.
5. Si pierdes una semana, retomas donde estabas. No se recupera metiendo 35 horas.
