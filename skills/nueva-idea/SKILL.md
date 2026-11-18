---
name: nueva-idea
description: Arrancar un proyecto nuevo desde una idea (mini app, prueba de concepto, producto) con el framework semillero. Usalo cuando el usuario diga "tengo una nueva idea", "nuevo proyecto", "arranquemos un proyecto", "quiero armar una app que..." o cuente una idea para construir desde cero. Charla la idea, propone la arquitectura según sus preferencias (front, back, base de datos, deploy, API keys, opcionales), crea la carpeta con spec, arquitectura y plan por etapas, y registra el proyecto. Nunca escribe código de la app. Para sumar al portfolio un proyecto que ya existe, usá nuevo-proyecto.
---

# Nueva idea

Convertís una idea en un proyecto listo para ejecutar: spec, arquitectura y plan por etapas. **No escribís código de la app**: el código lo hace otra sesión siguiendo el plan (skill `seguir-proyecto`).

## 0. Cargá el contexto

1. Leé `~/.claude/semillero/preferencias.md` (en Windows: `C:\Users\<usuario>\.claude\semillero\preferencias.md`). Si no existe, corré antes el skill `preferencias-dev`.
2. Leé `~/.claude/semillero/proyectos.md` para no repetir un slug y ver si la idea se parece a algo que ya existe.
3. Fijate con qué modelo estás corriendo. Si no es el de "planificar" de las preferencias, avisalo en una línea y seguí.

## 1. Entendé la idea

Escuchá todo lo que cuenta. Después hacé **una sola ronda** de preguntas, agrupadas y solo de lo que falte:

- Qué problema resuelve y qué usa hoy en su lugar.
- Para quién es (solo para mí, unos pocos, público) y si hay usuarios con cuenta.
- El caso de uso principal, con un ejemplo concreto.
- Dónde se usa: web, celular, hardware, CLI, otra app.
- Qué entra en la **primera etapa** y qué queda para después.
- Integraciones o hardware que ya tiene.

Si algo se puede decidir con las preferencias o con una opción razonable, no lo preguntes: decidilo y anotalo como supuesto.

## 2. Proponé la arquitectura

Seguí la escalera de las preferencias y subí un escalón solo si hace falta, diciendo por qué:

1. ¿Alcanza con solo front?
2. ¿Hace falta un back simple (API, secretos, base de datos)?
3. ¿Hace falta un back dedicado? Nunca se asume: justificalo con algo concreto (procesos largos, websockets, colas, límites de la plataforma) y mostrá la alternativa.

Presentá, corto y en este orden:

- **Piezas**: front, back, base de datos, servicios externos, y dónde se despliega cada una.
- **Datos**: entidades principales y cómo se identifica al usuario.
- **API keys y cuentas** que hacen falta, y quién las crea (👤).
- **Opcionales** de las preferencias (eventos, analytics, logs...) en una tabla, todos apagados por defecto, con una línea de qué aportaría cada uno en este proyecto. Que el usuario decida cuáles prende.
- **Decisiones abiertas**: lo que no se puede decidir sin el usuario.
- **Etapas**: una línea por etapa. Cada etapa termina en algo que se puede usar.

Esperá el OK o los cambios antes del paso 3. Si el usuario pidió explícitamente el plan completo de una, escribilo igual y dejá las decisiones abiertas marcadas en los docs.

## 3. Creá el proyecto

1. Elegí un slug (minúscula, sin tildes, con guiones). Si es provisorio, decilo.
2. Creá la carpeta donde dicen las preferencias, con `git init`. No crees repo remoto ni hagas push sin que te lo pidan.
3. Escribí los archivos con las [plantillas](plantillas/) y las [convenciones del plan](convenciones-plan.md):
   - `CLAUDE.md` y `AGENTS.md` (este último solo dice "Leé y seguí CLAUDE.md")
   - `README.md` (dos párrafos: qué es y cómo arrancar)
   - `docs/SPEC.md`
   - `docs/ARQUITECTURA.md`
   - `docs/plan/README.md` y un `docs/plan/etapa-NN-<nombre>.md` por etapa del alcance acordado, con todas sus tareas. Las etapas futuras van como una línea en el README del plan.
4. Commit inicial: `Plan inicial: spec, arquitectura y etapas`.

## 4. Registralo

1. Sumá una fila a `~/.claude/semillero/proyectos.md` (si no existe, creala desde [plantillas/proyectos.md](plantillas/proyectos.md)).
2. Seguí la sección **Portfolio** de las preferencias. Si dice que se registra con un skill, usalo, dejá el proyecto "en progreso" y **no publiques** sin confirmación. Anotá en el `CLAUDE.md` del proyecto dónde quedó la entrada, para que `seguir-proyecto` la mantenga al día.

## 5. Cerrá

Decí, corto:

- Dónde quedó todo (links a los archivos).
- Qué tiene que hacer la persona antes de la primera tarea (prerrequisitos 👤).
- Cómo arrancar: sesión nueva en la carpeta del proyecto, con el modelo de "ejecutar", y "sigamos con <slug>".
- Las decisiones abiertas.

## Reglas

- No escribas código de la app, ni siquiera "un esqueleto rápido". El plan es el entregable.
- No inventes requisitos. Lo que supongas, anotalo en `docs/SPEC.md` como supuesto.
- No prendas opcionales por tu cuenta.
- Los docs van en el idioma y la voz de las preferencias.
- Si el usuario corrige **cómo** trabaja el framework (no la idea), aplicá la corrección acá y pasala al plugin con el skill `mejorar-semillero`, para que la próxima vez ya salga así.
