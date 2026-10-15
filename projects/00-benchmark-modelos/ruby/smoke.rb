# frozen_string_literal: true
#
# Smoke test — Semana 0.
# El equivalente en Rails del smoke.ts. Compararlos es el primer dato
# del ADR 0001 (frontera Rails / TypeScript).
#
#   cd projects/00-benchmark-modelos/ruby && bundle install && bundle exec ruby smoke.rb

require "dotenv"
require "anthropic"
require "benchmark"

Dotenv.load(File.expand_path("../../../.env", __dir__))

MODELO = :"claude-haiku-5-5"

# fetch, no [] — queremos que reviente aquí y no con un 401 ambiguo.
api_key = ENV.fetch('ANTHROPIC_API_KEY') do
  warn '✗ Falta ANTHROPIC_API_KEY. ¿Copiaste .env.example a .env?'
  exit 1
end

client = Anthropic::Client.new(api_key: api_key)

mensaje = nil
segundos = Benchmark.realtime do
  mensaje = client.messages.create(
    model: MODELO,
    max_tokens: 64,
    messages: [{ role: "user", content: "Responde solo con: ok" }]
  )
end

texto = mensaje.content.select { |b| b.type == :text }.map(&:text).join

puts "✓ Ruby conectado"
puts "  modelo:    #{mensaje.model}"
puts "  respuesta: #{texto.strip}"
puts "  tokens:    #{mensaje.usage.input_tokens} in / #{mensaje.usage.output_tokens} out"
puts "  latencia:  #{(segundos * 1000).round} ms"

# --- Streaming: mide TTFT ---
inicio = Process.clock_gettime(Process::CLOCK_MONOTONIC)
ttft = nil

client.messages.stream(
  model: MODELO,
  max_tokens: 64,
  messages: [{ role: "user", content: "Cuenta del uno al diez." }]
).each do |evento|
  ttft ||= Process.clock_gettime(Process::CLOCK_MONOTONIC) - inicio if evento.type == :content_block_delta
end

total = Process.clock_gettime(Process::CLOCK_MONOTONIC) - inicio

puts "✓ Streaming"
puts "  TTFT:      #{ttft ? (ttft * 1000).round : '?'} ms"
puts "  total:     #{(total * 1000).round} ms"
