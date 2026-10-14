# Servicio de recuperación multi-tenant con las tres estrategias

**Fase 3 · Semanas 9–12**

## Qué hay que entregar

- ☐ API con auth, cuotas por tenant y aislamiento aplicado en la capa de datos
- ☐ Ingesta asíncrona con estados observables y reprocesado
- ☐ Las TRES rutas seleccionables: RAG precargado, recuperación agéntica, contexto largo
- ☐ Informe comparativo de las tres sobre el mismo golden set
- ☐ Respuestas con citas trazables al documento y posición original
- ☐ Golden set de 100 preguntas con evals en cada PR
- ☐ Caché semántico con métricas de hit rate

## Checklist de dominio

No avances de fase sin esto.

- ☐ Tengo golden set propio y evals corriendo en CI
- ☐ Implementé y medí las tres estrategias sobre el mismo benchmark
- ☐ Puedo defender con números cuándo usar cada una
- ☐ Diagnostico con datos si un fallo es de recuperación o de generación
- ☐ Mi pipeline de ingesta es idempotente, reanudable y observable
- ☐ La autorización vive en la capa de datos, no en el prompt

## Resultados medidos

> Rellena esta sección conforme midas. Es lo que un entrevistador va a leer primero.

| Métrica | Valor | Cómo se midió |
|---|---|---|
| | | |

## Decisiones

Enlaza aquí los ADRs de esta fase.

## Qué haría distinto

> Se escribe al cerrar la fase. Vale oro en una entrevista.
