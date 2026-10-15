# Banco de pruebas y calculadora de decisión

**Fase 0 · Semanas 1–2**

## Qué hay que entregar

- ☐ Misma tarea contra 4 modelos de distintos tiers
- ☐ Tabla con latencia p50/p95, TTFT, tokens in/out, coste por 1.000 ejecuciones
- ☐ Métrica de calidad definida por ti
- ☐ Calculadora: recuperar vs. contexto largo, con punto de cruce
- ☐ ADR de una página con la conclusión

## Checklist de dominio

No avances de fase sin esto.

- ☐ Puedo estimar el coste de una feature antes de escribirla
- ☐ Tengo calculadora propia de recuperación vs. contexto largo con números actuales
- ☐ Sé explicar TTFT vs. latencia total y por qué importa para UX
- ☐ Nombro los 4 modos de fallo del contexto y los reconozco en un sistema real

## Resultados medidos

> Rellena esta sección conforme midas. Es lo que un entrevistador va a leer primero.

| Métrica | Valor | Cómo se midió |
|---|---|---|
| | | |

## Decisiones

Enlaza aquí los ADRs de esta fase.

## Qué haría distinto

> Se escribe al cerrar la fase. Vale oro en una entrevista.

---

## Cómo correr el smoke test (Semana 0)

Verifica que las keys funcionan y que ambos stacks hablan con la API.
Este código es la semilla del benchmark de la Semana 2: no es un script desechable.

```bash
# TypeScript
cd ts && npm install && npm run smoke

# Ruby
cd ruby && bundle install && bundle exec ruby smoke.rb
```

Ambos leen `ANTHROPIC_API_KEY` del `.env` de la raíz del repo.

**Qué deberías ver:** modelo, respuesta, tokens in/out, latencia total y TTFT.
Esos cinco números son el vocabulario del resto del plan.

**Lo primero que vas a notar:** el TTFT es una fracción de la latencia total. Esa brecha
es la razón de que el streaming exista. Apúntala en el log del día.

### Estructura

```
ts/     Smoke test en TypeScript. En la S2 crece a benchmark multi-modelo.
ruby/   El mismo smoke test en Ruby. Comparar ambos es el primer dato del ADR 0001.
```

### Si falla

| Error | Causa probable |
|---|---|
| `Falta ANTHROPIC_API_KEY` | No copiaste `.env.example` a `.env`, o está en otra ruta |
| 401 | Key mal pegada (espacios al final) o revocada |
| 429 en la primera llamada | Cuenta sin crédito, o límite de gasto en cero |
| `not_found_error` sobre el modelo | El ID de modelo cambió. Compruébalo en la documentación oficial |

Ese último caso es el plan en miniatura: **cuando el código contradiga a la documentación
del día, gana la documentación.**
