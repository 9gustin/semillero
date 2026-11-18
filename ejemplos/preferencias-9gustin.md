<!--
Ejemplo real: la configuración de 9gustin. Para usarla como base, copiala a ~/.claude/semillero/preferencias.md
y cambiá lo personal (nombre, rutas, usuario de GitHub, portfolio). Explicación de cada decisión en el README.
-->

# Preferencias de desarrollo · Agus (9gustin)

Las leen los skills de semillero antes de proponer una arquitectura o un plan. Son preferencias, no reglas: si una idea pide otra cosa, se propone y se discute.

## Quién soy y con qué trabajo

- Nombre: Agus (9gustin). Fuerte en React y Next.js, hoy hago de todo (Node, SQL, AWS).
- Idioma de los docs: español rioplatense, con voseo.
- Herramienta: Claude Code (app de escritorio en Windows).
- Dónde viven los proyectos: WSL Ubuntu, `~/projects/<slug>` (desde Windows: `\\wsl.localhost\ubuntu\home\v9gustin\projects\<slug>`). Correr git y node dentro de WSL, con nvm cargado.
- Gestor de paquetes: pnpm.
- GitHub: `9gustin` (el `gh` de WSL tiene sesión). Repo remoto solo cuando lo pida.

## Modelos

- Planificar (idea, arquitectura, plan): Opus.
- Ejecutar las tareas del plan: Sonnet.
- Escalar a Opus: tareas 🧠 o una tarea que falla dos veces.

## Stack, en orden de preferencia

1. Solo front: React (Vite). Si se puede hacer simple, solo React.
2. Back simple: Next.js (App Router, route handlers).
3. Back dedicado: no se asume. Se analiza en cada caso y se justifica.

- Front: siempre React antes que otros frameworks.
- Lenguaje: TypeScript estricto.
- Estilos/UI: Tailwind + shadcn/ui.
- Base de datos: sin preferencia fija. Ya usé Supabase (Postgres, auth, storage, realtime) en recetario: proponerlo primero si hace falta base.

## Deploy

- Vercel siempre que se pueda.

## IA

- Voz a texto: API de OpenAI.
- LLM: decidir por proyecto. Ya usé la API de Claude en recetario.

## Opcionales (apagados por defecto, se discuten en cada proyecto)

- Eventos / tracking de producto.
- Analytics e información de usuarios.
- Logs y observabilidad (Sentry, logs persistidos).

## Portfolio

- Cada proyecto nuevo se registra en mi portfolio (9gustin.vercel.app) con el skill `nuevo-proyecto`, como "en progreso": archivo `src/content/proyectos/<slug>.md` en `~/projects/9gustin-site`.
- Nunca se publica (push a `main`) sin mi confirmación.
- Al cerrar cada etapa, proponer actualizar la sección "Estado" del proyecto en el portfolio.
