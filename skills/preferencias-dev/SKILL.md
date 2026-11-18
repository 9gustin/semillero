---
name: preferencias-dev
description: Crear, ver o cambiar las preferencias de desarrollo del usuario para semillero (stack, deploy, modelos para planificar y ejecutar, proveedores de IA, opcionales, portfolio). Usalo cuando diga "configurá mis preferencias", "qué preferencias tengo", "a partir de ahora prefiero X", "guardá como preferencia que...", o cuando nueva-idea no encuentre el archivo de preferencias.
---

# Preferencias de desarrollo

Las preferencias viven en `~/.claude/semillero/preferencias.md` (en Windows: `C:\Users\<usuario>\.claude\semillero\preferencias.md`). Son del usuario, no del plugin: nunca las pises con las de otra persona.

## Si no existen

1. Copiá la estructura de `preferencias.ejemplo.md` (está en la raíz del repo de semillero; si no la encontrás, usá las secciones de abajo).
2. Preguntá en **una sola ronda**, con opciones concretas:
   - Herramienta (Claude Code CLI, app de escritorio, web) y dónde viven los proyectos.
   - Idioma de los docs.
   - Modelo para planificar y modelo para ejecutar.
   - Stack en escalera: solo front, back simple, back dedicado.
   - Base de datos preferida, si tiene.
   - Dónde despliega.
   - Proveedores de IA (voz a texto, LLM).
   - Opcionales que se discuten por proyecto (eventos, analytics, logs...).
   - Si quiere registrar cada proyecto en un portfolio, y cómo.
3. Escribí el archivo y mostrale el resultado.

## Si existen

- "Qué preferencias tengo": resumilas en pocas líneas.
- Un cambio ("a partir de ahora prefiero X"): editá solo esa línea, en la sección que corresponde, y confirmá el cambio en una línea. Si contradice otra preferencia, preguntá cuál gana.

## Secciones

Quién soy y con qué trabajo · Modelos · Stack, en orden de preferencia · Deploy · IA · Opcionales · Portfolio.
