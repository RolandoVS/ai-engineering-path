# Microservicio de extracción con presupuesto de contexto

**Fase 1 · Semanas 3–5**

## Qué hay que entregar

- ☐ Endpoint que devuelve JSON validado contra schema estricto
- ☐ Streaming SSE con cancelación limpia
- ☐ Middleware de contabilidad de tokens/coste persistido en BD
- ☐ Reintentos, circuit breaker y fallback a modelo secundario
- ☐ ContextBuilder con presupuesto por sección y compactación al superar umbral
- ☐ 30+ casos de test de prompt con aserciones reales

## Checklist de dominio

No avances de fase sin esto.

- ☐ Implemento streaming con cancelación en Node y en Rails
- ☐ Tengo patrón reutilizable de reintento + validación de salida estructurada
- ☐ Mi ContextBuilder reporta ocupación de la ventana por sección en cada llamada
- ☐ Mis prompts están versionados y tienen tests que fallan si degradan
- ☐ Puedo mostrar un dashboard de coste por feature

## Resultados medidos

> Rellena esta sección conforme midas. Es lo que un entrevistador va a leer primero.

| Métrica | Valor | Cómo se midió |
|---|---|---|
| | | |

## Decisiones

Enlaza aquí los ADRs de esta fase.

## Qué haría distinto

> Se escribe al cerrar la fase. Vale oro en una entrevista.
