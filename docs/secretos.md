# Dónde viven las API keys

## Regla única

**Nunca en el código. Nunca en el historial de git. Nunca pegadas en un chat.**

## Dónde ponerlas

`.env` en la raíz del repo. Está en `.gitignore` y verificado como ignorado.

```bash
cp .env.example .env
$EDITOR .env
```

Leerlas:

```ts
// TypeScript — Node 20+ carga .env con --env-file
const key = process.env.ANTHROPIC_API_KEY;
if (!key) throw new Error("Falta ANTHROPIC_API_KEY en .env");
```

```ruby
# Ruby — gem dotenv
ENV.fetch("ANTHROPIC_API_KEY")  # fetch, no [], para que falle ruidosamente
```

Usa siempre la forma que **falla si la variable no existe**. Una key ausente que devuelve
`undefined` produce un 401 confuso tres capas más abajo.

## Si vas a tener varios proyectos del plan

Un `.env` por proyecto se desincroniza. Alternativa: un fichero central fuera de todo repo.

```bash
mkdir -p ~/.config/ai-path
chmod 700 ~/.config/ai-path
$EDITOR ~/.config/ai-path/env        # las mismas líneas KEY=valor
chmod 600 ~/.config/ai-path/env
```

Y en `~/.zshrc`:

```bash
[ -f ~/.config/ai-path/env ] && set -a && . ~/.config/ai-path/env && set +a
```

Así están disponibles en cualquier shell y no hay copias repartidas por el disco.

## Protecciones activas en este repo

| Qué | Dónde | Estado |
|---|---|---|
| `.env` ignorado por git | `.gitignore` | verificado |
| Hook que bloquea keys en el commit | `.githooks/pre-commit` | verificado |

El hook se activó con `git config core.hooksPath .githooks`. Esa config es **local a tu
clon**: si clonas el repo en otra máquina, vuelve a ejecutarla.

Saltar el hook a propósito: `git commit --no-verify`.

## Higiene de keys

- **Límite de gasto en el panel del proveedor**, antes de la primera llamada. Es la única
  protección real contra un bucle infinito a las dos de la mañana.
- Una key distinta por proyecto cuando el proveedor lo permita. Revocar una no tumba el resto.
- Rótalas al terminar cada fase. Son 8 rotaciones en 26 semanas y te deja el hábito hecho.

## Si una key se filtra

1. **Revócala en el panel del proveedor.** Primero, antes que nada.
2. Genera una nueva.
3. Solo después, limpia el código.

Borrarla del fichero y commitear no sirve: sigue en el historial y en cualquier clon.
Una key publicada se considera comprometida desde el segundo en que salió, no desde que
alguien la usó.
