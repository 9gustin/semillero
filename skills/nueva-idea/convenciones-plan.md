# Convenciones del plan

El plan lo ejecuta otro modelo (el de "ejecutar" en las preferencias), una tarea por sesión, sin el contexto de la charla donde se armó. Todo lo que necesite saber tiene que estar escrito.

## Etapas

- `etapa-00-fundaciones` siempre existe: repo, tooling, deploy vacío funcionando, chequeos mínimos.
- Cada etapa termina en algo que se puede usar o probar a mano.
- Entre 3 y 8 tareas por etapa. Si son más, partila.

## Tareas

ID `T<etapa>.<n>` (ej. `T2.3`). Cada una entra en una sesión. Formato:

```markdown
### T2.3 · Título corto  [ ]

**Objetivo:** una o dos líneas.
**Spec:** secciones de SPEC.md / ARQUITECTURA.md que aplica.
**Archivos:** los que crea o toca.
**Pasos:**
1. ...
**Criterios de aceptación:**
- ...
**Verificación:** comando o prueba manual concreta.
```

Marcas:

- 👤 paso que hace la persona (cuentas, consolas web, claves, hardware). El agente lo pide y espera.
- 🧠 tarea difícil o crítica: ejecutarla con el modelo de "planificar" o revisarla con él.

## Al final de cada archivo de etapa

```markdown
## Notas de ejecución

(El agente anota acá las decisiones que tomó y no estaban en el spec.)
```
