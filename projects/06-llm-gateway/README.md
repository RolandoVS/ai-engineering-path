# LLM Gateway con observabilidad y gobierno

**Fase 6 · Semanas 20–23**

## Qué hay que entregar

- ☐ Interfaz unificada sobre 2+ proveedores con fallback y circuit breaker
- ☐ Rate limiting y cuotas de coste por tenant/API key, con corte y alerta
- ☐ Tracing OpenTelemetry exportado a Langfuse o equivalente
- ☐ Caché de dos niveles (exacto + semántico) con hit rate y ahorro
- ☐ Redacción de PII configurable en la entrada
- ☐ Versión de prompt y modelo en cada traza, con rollback
- ☐ Evals continuos sobre muestra de tráfico real
- ☐ Auditoría escrita de un proyecto anterior contra el OWASP Top 10 agéntico
- ☐ Runbook de incidentes: proveedor caído, coste 10x, calidad caída

## Checklist de dominio

No avances de fase sin esto.

- ☐ Trazo una petición completa a través de recuperación + agente + herramientas
- ☐ Tengo alertas que detectan degradación de calidad, no solo errores 500
- ☐ Mi sistema sobrevive a la caída total del proveedor principal
- ☐ Audité un sistema propio contra el OWASP agéntico y documenté remediaciones
- ☐ Escribí un runbook y ejecuté un simulacro de incidente
- ☐ Atribuyo el coste de IA por cliente y por feature

## Resultados medidos

> Rellena esta sección conforme midas. Es lo que un entrevistador va a leer primero.

| Métrica | Valor | Cómo se midió |
|---|---|---|
| | | |

## Decisiones

Enlaza aquí los ADRs de esta fase.

## Qué haría distinto

> Se escribe al cerrar la fase. Vale oro en una entrevista.
