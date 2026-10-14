# Motor de búsqueda semántica sobre corpus real

**Fase 2 · Semanas 6–8**

## Qué hay que entregar

- ☐ Ingesta idempotente con detección de cambios por hash y backfill incremental
- ☐ 3 estrategias de chunking comparadas con Recall@k, MRR y NDCG sobre 50 queries anotadas
- ☐ Búsqueda híbrida con RRF + reranking
- ☐ Benchmark de HNSW con 3 configuraciones de parámetros
- ☐ Test que FALLA si alguna consulta de similitud cae en sequential scan

## Checklist de dominio

No avances de fase sin esto.

- ☐ Justifico mi chunking con métricas, no con intuición
- ☐ Sé tunear HNSW y explicar el trade-off que elijo
- ☐ Reconozco los 6 modos de fallo de pgvector en producción y sé diagnosticar cada uno
- ☐ Conozco de memoria los umbrales de escala y qué hacer en cada tramo
- ☐ Tengo plan de reindexado sin downtime escrito y probado

## Resultados medidos

> Rellena esta sección conforme midas. Es lo que un entrevistador va a leer primero.

| Métrica | Valor | Cómo se midió |
|---|---|---|
| | | |

## Decisiones

Enlaza aquí los ADRs de esta fase.

## Qué haría distinto

> Se escribe al cerrar la fase. Vale oro en una entrevista.
