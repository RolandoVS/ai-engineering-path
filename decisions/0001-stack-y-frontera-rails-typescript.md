# ADR 0001 — Stack del plan y frontera Rails / TypeScript

- **Fecha:** 2026-10-14
- **Estado:** propuesta — se decide en la Semana 2, tras el benchmark
- **Fase / semana:** Fase 0, Semana 0

## Contexto

Vengo de Node.js/TypeScript y Ruby on Rails, ambos a nivel senior. El plan de 26 semanas
construye 8 proyectos. Tengo que decidir en qué stack va cada uno, y hay una tensión real:

- **Rails** me da jobs, auth, caché, streaming y deploy ya resueltos. El ecosistema de IA
  en Ruby maduró en 2026 (RubyLLM: interfaz única multi-proveedor, streaming, tool calling,
  salida estructurada, `acts_as_chat` sobre ActiveRecord, pgvector con scopes).
- **TypeScript** es donde está el grueso del ecosistema y, sobre todo, donde está el
  reconocimiento del mercado laboral. El pool de ingenieros que conoce LangChain/TS es
  mayor que el que conoce RubyLLM, y los entrevistadores van a reconocer antes un proyecto
  en TS.

Esta decisión no es "cuál es mejor". Es cómo reparto el esfuerzo entre *aprender bien* y
*ser contratable*.

## Opciones consideradas

| Opción | A favor | En contra | Coste |
|---|---|---|---|
| A. Todo en Rails | Velocidad máxima, aprovecho lo que ya sé, menos infra | Portfolio menos legible para el mercado; ecosistema más delgado en agentes | Riesgo de empleabilidad |
| B. Todo en TypeScript | Máxima alineación con el mercado; ecosistema más rico | Pierdo la ventaja de Rails; reaprendo plumbing que ya domino | Más horas en infra, menos en IA |
| C. Mixto por proyecto | Lo mejor de ambos; un ADR comparativo es material de entrevista | Dos stacks que mantener; riesgo de dispersión | Disciplina |

## Decisión

**Pendiente de confirmar en la Semana 2.** Inclinación inicial: opción C, con esta regla:

- **El agente de la Fase 4 va en TypeScript**, sin excepción. Es la pieza más visible del
  portfolio y donde el ecosistema TS tiene ventaja real.
- **Los servicios de datos y recuperación (Fases 2 y 3) van en Rails**, donde ActiveRecord
  y pgvector con scopes me ahorran horas que van a contenido en vez de a plumbing.
- **El gateway de la Fase 6 va en TypeScript**, por ser infraestructura que otros leerían.
- Al cerrar la Fase 4, escribo un ADR comparando ambas experiencias con datos reales:
  líneas de código, tiempo hasta el primer streaming funcional, fricción encontrada.

## Justificación

Sin números todavía. Esa es precisamente la razón de dejarla en "propuesta": el benchmark
de la Semana 2 y el microservicio de la Fase 1 (que se construye en ambos stacks) me van a
dar la evidencia para decidir con datos en vez de con preferencia.

## Consecuencias

- **Positivas:** el ADR comparativo final es contenido de entrevista que casi nadie tiene.
- **Negativas y qué acepto:** mantener dos stacks cuesta contexto. Lo acoto congelando el
  stack al inicio de cada fase y no reabriendo la discusión a mitad.
- **Qué invalidaría esta decisión:** que el tiempo de plumbing en TS supere el 30% de las
  horas de una fase. Si pasa, consolido en Rails y lo documento.

## Medición

Al cerrar la Fase 4: horas de infraestructura vs. horas de contenido de IA, por stack.
Si la diferencia es menor al 15%, la elección de stack es irrelevante y debería consolidar
en el que mejor venda mi portfolio.
