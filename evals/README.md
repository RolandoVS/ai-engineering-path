# Evals

El principio del plan: **el eval se escribe antes que la feature.**

## Estructura

```
evals/
  golden-sets/<proyecto>.jsonl     Casos anotados a mano. El activo más valioso del repo.
  reports/<fecha>-<proyecto>.md    Resultado de cada corrida, con fecha y versión
```

## Reglas

1. Un golden set se construye **a mano**. Generado por LLM sin revisión, no cuenta.
2. Mínimo 50 casos para búsqueda, 100 para recuperación completa.
3. Cada caso lleva la respuesta esperada y, cuando aplica, los documentos que deberían recuperarse.
4. El eval corre en CI y **bloquea el merge** si la métrica cae del umbral.
5. Si usas LLM-as-a-judge, calíbralo primero contra tu propio juicio en 20 casos y anota la concordancia.

## Métricas por tipo

| Sistema | Métricas |
|---|---|
| Búsqueda / recuperación | Recall@k, MRR, NDCG, context precision, context recall |
| Generación con fuentes | Faithfulness, answer relevancy, tasa de "no lo sé" correcta |
| Extracción estructurada | Exactitud por campo, tasa de JSON inválido |
| Agente | Tasa de completado, pasos por tarea, coste por ejecución, resistencia a injection |

## Plantilla de caso

```json
{"id": "q001", "query": "...", "expected_answer": "...", "expected_docs": ["doc_12#3"], "notes": "caso límite: el término aparece también en otro contexto"}
```
