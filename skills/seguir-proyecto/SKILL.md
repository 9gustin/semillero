---
name: seguir-proyecto
description: Retomar un proyecto creado con semillero y avanzar su plan de desarrollo. Usalo cuando el usuario diga "sigamos con X", "próxima tarea de X", "en qué quedamos con X", "ejecutá T2.3", "cerremos la etapa" o "actualizá el estado de X". Ubica el proyecto, ejecuta una tarea del plan por sesión y mantiene al día el plan, el registro de proyectos y la entrada del portfolio.
---

# Seguir proyecto

Avanzás un proyecto de semillero una tarea por vez, y dejás la documentación al día para que nunca quede desactualizada.

## 1. Ubicate

1. Leé `~/.claude/semillero/preferencias.md` y `~/.claude/semillero/proyectos.md`. Buscá el proyecto por slug o por nombre.
2. Si la sesión no está en la carpeta del proyecto, movela ahí (o trabajá con rutas absolutas). Si el proyecto vive en WSL, corré git y node dentro de WSL.
3. `git status` y `git log -5`: puede haber trabajo de otra sesión.
4. Leé `CLAUDE.md` y `docs/plan/README.md`. La próxima tarea es la primera sin `[x]` en la tabla, salvo que te pidan otra.
5. Si la tarea es 🧠 y no estás con el modelo de "planificar", o es normal y estás con el de "planificar", avisalo en una línea y seguí.

## 2. Ejecutá la tarea

Seguí el prompt de "Cómo ejecutar una tarea" de `docs/plan/README.md` y las reglas de `CLAUDE.md`. En corto:

- Contá en 5 líneas qué vas a hacer y qué archivos vas a tocar.
- Solo esa tarea. Pasos 👤: pedilos y esperá.
- Corré la verificación. Si falla, arreglá.
- Decisiones fuera del spec: a "Notas de ejecución" de la etapa.
- Marcá `[x]` en la etapa y en la tabla, y commit `T<etapa>.<n>: <resumen>`.

## 3. Mantené la documentación al día

Después de cada tarea:

- Si cambió el alcance o una decisión técnica, actualizá `docs/SPEC.md` o `docs/ARQUITECTURA.md` en el mismo commit.
- Actualizá la columna "Etapa actual" del proyecto en `~/.claude/semillero/proyectos.md`.

Al cerrar una etapa (todas sus tareas con `[x]`):

- Proponé actualizar la entrada del portfolio según la sección **Portfolio** de las preferencias (por ejemplo, la sección "Estado" o el stack). Publicar siempre con confirmación.
- Si el proyecto terminó, marcá "terminado" en el registro y avisá al portfolio que ya no está en progreso.

## Si algo sale mal

- Tarea trabada: anotá dónde quedó en "Notas de ejecución" y sugerí retomarla en otra sesión con el modelo de "planificar".
- Tarea más grande de lo pensado: partila en `T3.2a` y `T3.2b` dentro de la etapa y hacé solo la primera.
- El usuario corrige **cómo** se ejecuta o se revisa (no el proyecto): usá `mejorar-semillero` para que el cambio quede en el framework.
- El plan no sirve más: pará y proponé replanificar con `nueva-idea` sobre el mismo proyecto (sin borrar lo hecho).
