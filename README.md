# semillero

Un framework chico para arrancar y llevar mini apps y pruebas de concepto con Claude Code.

La idea es siempre la misma: **nunca se arranca a programar de una**. Primero se charla la idea, se propone una arquitectura según tus preferencias, se registra el proyecto y se arma un plan por etapas. Después el plan se ejecuta tarea por tarea, y la documentación se mantiene al día.

## Skills

| Skill | Cuándo | Qué hace |
|---|---|---|
| `nueva-idea` | "tengo una idea", "arranquemos un proyecto nuevo" | Charla la idea, propone arquitectura, crea la carpeta con spec y plan, y registra el proyecto. No escribe código. |
| `seguir-proyecto` | "sigamos con X", "próxima tarea de X" | Retoma un proyecto, ejecuta la próxima tarea del plan y actualiza docs, registro y portfolio. |
| `mejorar-semillero` | "esto no me gustó, cambiá cómo se hace X" | Convierte la corrección en un cambio en los skills, lo anota en [`APRENDIZAJES.md`](APRENDIZAJES.md) y reinstala. |
| `preferencias-dev` | "configurá mis preferencias", "a partir de ahora prefiero X" | Crea o edita tus preferencias de stack, deploy, modelos y opcionales. |

## Configuración por usuario

Todo lo personal vive fuera del plugin, en `~/.claude/semillero/`:

- `preferencias.md`: cómo te gusta construir y desplegar. Se arma a partir de [`preferencias.ejemplo.md`](preferencias.ejemplo.md) o con el skill `preferencias-dev`.
- `proyectos.md`: registro de todos tus proyectos, con su carpeta, estado y etapa actual.

Así el plugin se puede compartir sin llevarse las decisiones de nadie.

## Instalar

En Windows con WSL (copia los skills a `C:\Users\<vos>\.claude\skills` y crea la carpeta de config si no existe):

```bash
wsl.exe -d Ubuntu -- bash ~/projects/semillero/instalar.sh
```

Corrélo de nuevo cada vez que cambies un skill.

## Qué genera en cada proyecto

```
<proyecto>/
  CLAUDE.md               reglas para el agente y links a todo
  AGENTS.md               apunta a CLAUDE.md
  README.md
  docs/SPEC.md            qué se construye y por qué, alcance por etapas
  docs/ARQUITECTURA.md    dónde se despliega, piezas, datos, API keys, opcionales
  docs/plan/README.md     cómo ejecutar, prerrequisitos, tabla de tareas
  docs/plan/etapa-NN-*.md tareas con criterios de aceptación y verificación
```
