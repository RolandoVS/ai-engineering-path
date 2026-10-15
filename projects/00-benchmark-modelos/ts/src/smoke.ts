/**
 * Smoke test — Semana 0.
 * Verifica que la key funciona y deja a la vista los números que van a
 * importar el resto del plan: tokens, latencia y TTFT.
 *
 *   cd projects/00-benchmark-modelos/ts && npm install && npm run smoke
 */
import Anthropic from "@anthropic-ai/sdk";

const MODELO = "claude-haiku-5-5"; // el más barato: esto es una prueba de fontanería

// Falla ruidosamente. Una key ausente produce un 401 confuso tres capas más abajo.
const apiKey = process.env.ANTHROPIC_API_KEY;
if (!apiKey) {
  console.error("✗ Falta ANTHROPIC_API_KEY. ¿Copiaste .env.example a .env?");
  process.exit(1);
}

const client = new Anthropic({ apiKey });

const t0 = performance.now();
const res = await client.messages.create({
  model: MODELO,
  max_tokens: 64,
  messages: [{ role: "user", content: "Responde solo con: ok" }],
});
const ms = performance.now() - t0;

const texto = res.content
  .filter((b) => b.type === "text")
  .map((b) => b.text)
  .join("");

console.log("✓ TypeScript conectado");
console.log(`  modelo:    ${res.model}`);
console.log(`  respuesta: ${texto.trim()}`);
console.log(`  tokens:    ${res.usage.input_tokens} in / ${res.usage.output_tokens} out`);
console.log(`  latencia:  ${ms.toFixed(0)} ms`);

// --- Streaming: mide TTFT, que es lo que percibe el usuario ---
const t1 = performance.now();
let ttft: number | null = null;

const stream = client.messages.stream({
  model: MODELO,
  max_tokens: 64,
  messages: [{ role: "user", content: "Cuenta del uno al diez." }],
});

stream.on("text", () => {
  ttft ??= performance.now() - t1;
});

await stream.finalMessage();
const total = performance.now() - t1;

console.log("✓ Streaming");
console.log(`  TTFT:      ${ttft?.toFixed(0) ?? "?"} ms`);
console.log(`  total:     ${total.toFixed(0)} ms`);
console.log(`\n  TTFT es lo que siente el usuario. La latencia total, lo que paga tu servidor.`);
