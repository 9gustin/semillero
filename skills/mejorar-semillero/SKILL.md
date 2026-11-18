---
name: mejorar-semillero
description: Cambiar la forma de trabajar del framework semillero a partir de una corrección del usuario. Usalo cuando diga "esto no me gustó", "cambiá cómo se arma el plan", "las tareas tienen que ser más chicas", "la revisión hacela así", "de ahora en más el framework tiene que...", o cuando en medio de nueva-idea o seguir-proyecto corrija el proceso (no el proyecto). Edita la fuente del plugin, registra el aprendizaje y lo reinstala.
---

# Mejorar semillero

El framework tiene que aprender rápido: una corrección del usuario se convierte en un cambio real en los skills, en el momento, sin vueltas.

## 1. Clasificá la corrección

| Si la corrección es sobre... | Va en |
|---|---|
| Un gusto personal (stack, deploy, modelos, proveedores, opcionales, portfolio) | `~/.claude/semillero/preferencias.md` (skill `preferencias-dev`) |
| Cómo trabaja el framework (preguntas, arquitectura, formato del plan, tamaño de tareas, revisión, cierre, docs) | La fuente del plugin: `~/projects/semillero/skills/` |
| Solo este proyecto | Los docs del proyecto (`CLAUDE.md`, `docs/`) |

Si no está claro, preguntá en una línea: "¿Esto es para todos los proyectos o solo para este?".

## 2. Hacé el cambio

1. Editá la **fuente** en `~/projects/semillero` (desde Windows: `\\wsl.localhost\ubuntu\home\v9gustin\projects\semillero`), nunca la copia instalada en `~/.claude/skills`.
2. Cambiá lo mínimo que haga cumplir la corrección, en el skill, plantilla o convención que corresponde. Si una regla vieja la contradice, sacala: que no queden dos reglas peleadas.
3. Si la corrección pide un paso nuevo (por ejemplo, una revisión al cerrar cada etapa), sumalo donde ocurre ese momento, no en una sección aparte.
4. Sumá una línea a `APRENDIZAJES.md` (raíz del repo): fecha, qué pidió el usuario con sus palabras y qué archivo cambió.
5. Mostrá el diff en pocas líneas.

## 3. Instalalo

1. Commit en el repo de semillero: `Aprende: <resumen>`.
2. Reinstalá: `wsl.exe -d Ubuntu -- bash ~/projects/semillero/instalar.sh`.
3. Si hay un proyecto abierto en esta sesión, aplicá la corrección también ahí (por ejemplo, reescribir el plan con el formato nuevo) solo si el usuario quiere.

## Reglas

- No pidas permiso para aprender: si la corrección es clara, aplicala y contá qué cambiaste.
- No toques las preferencias de otra persona ni las metás en el plugin: lo personal va en `preferencias.md`.
- Antes de cambiar algo grande (sacar un paso entero, cambiar la estructura de docs), resumí el cambio en dos líneas y esperá el OK.
