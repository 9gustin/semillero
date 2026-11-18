# semillero

Una forma de trabajar con Claude Code para pasar de una idea a una mini app o prueba de concepto, sin arrancar a programar a ciegas.

Cada idea es una semilla: primero se charla, después se le arma una arquitectura y un plan por etapas, y recién ahí se planta y crece tarea por tarea. El framework se encarga de que todo quede documentado, registrado y al día.

Está hecho de **skills** de Claude Code (instrucciones que Claude carga cuando hacen falta) y de **tu configuración**, que vive aparte para que cada persona lo use con sus propias preferencias.

---

## Índice

- [Cómo funciona](#cómo-funciona)
- [Instalar](#instalar)
- [Configurar tus preferencias](#configurar-tus-preferencias)
- [Usarlo, paso a paso](#usarlo-paso-a-paso)
- [Mejorar el framework](#mejorar-el-framework)
- [Ejemplo: mi configuración, explicada](#ejemplo-mi-configuración-explicada)
- [Qué genera en cada proyecto](#qué-genera-en-cada-proyecto)
- [Cómo está armado este repo](#cómo-está-armado-este-repo)

---

## Cómo funciona

```
  idea ──► nueva-idea ──► proyecto con spec, arquitectura y plan ──► seguir-proyecto ──► tarea, tarea, tarea...
              │                                                          │
              ├─ lee tus preferencias                                    ├─ mantiene el plan al día
              ├─ propone arquitectura y la discute con vos               ├─ actualiza el registro
              └─ registra el proyecto (y tu portfolio, si querés)        └─ propone actualizar el portfolio

  "esto no me gustó" ──► mejorar-semillero ──► cambia los skills y lo anota en APRENDIZAJES.md
```

Tres reglas de fondo:

1. **Nunca se arranca a programar de una.** Una idea nueva termina en un plan, no en código.
2. **Planificar y ejecutar son cosas distintas**, y pueden ir con modelos distintos (por ejemplo, Opus planifica y Sonnet ejecuta).
3. **La documentación es parte del trabajo.** Si cambia algo, se actualiza el spec o el plan en el mismo paso.

### Los skills

| Skill | Lo disparás diciendo | Qué hace |
|---|---|---|
| `nueva-idea` | "tengo una idea...", "arranquemos un proyecto nuevo" | Charla la idea, propone arquitectura según tus preferencias, crea la carpeta con spec, arquitectura y plan, y registra el proyecto. No escribe código. |
| `seguir-proyecto` | "sigamos con X", "próxima tarea de X", "cerremos la etapa" | Retoma un proyecto, ejecuta una tarea del plan por sesión y deja todo actualizado. |
| `mejorar-semillero` | "esto no me gustó", "cambiá cómo se arma el plan" | Convierte tu corrección en un cambio real en los skills y la registra. |
| `preferencias-dev` | "configurá mis preferencias", "a partir de ahora prefiero X" | Crea o edita tus preferencias. |

No hace falta nombrar el skill: Claude lo elige por lo que decís.

---

## Instalar

Necesitás [Claude Code](https://claude.com/claude-code) (CLI, app de escritorio o IDE).

```bash
git clone <este repo> ~/projects/semillero
bash ~/projects/semillero/instalar.sh
```

El instalador:

- copia los skills a tu carpeta de skills de usuario (`~/.claude/skills`, o `C:\Users\<vos>\.claude\skills` si lo corrés desde WSL),
- crea `~/.claude/semillero/` con un `preferencias.md` y un `proyectos.md` vacíos, **sin pisar** los que ya tengas.

Desde Windows con el repo en WSL:

```bash
wsl.exe -d Ubuntu -- bash ~/projects/semillero/instalar.sh
```

Volvé a correrlo cada vez que cambie un skill (`mejorar-semillero` lo hace solo).

---

## Configurar tus preferencias

Tus preferencias viven en `~/.claude/semillero/preferencias.md`, fuera del plugin. Hay dos formas de armarlas:

- **Charlando:** abrí Claude Code y decí "configurá mis preferencias de semillero". Te hace una ronda de preguntas y escribe el archivo.
- **A mano:** editá el archivo partiendo de [`preferencias.ejemplo.md`](preferencias.ejemplo.md), o de [mi configuración](ejemplos/preferencias-9gustin.md) si se parece a cómo trabajás.

Qué se configura:

| Sección | Qué define | Para qué la usa el framework |
|---|---|---|
| Quién soy y con qué trabajo | Idioma de los docs, herramienta, dónde viven los proyectos, gestor de paquetes | Dónde crea las carpetas, en qué idioma escribe, qué comandos pone en el plan |
| Modelos | Con qué modelo se planifica, con cuál se ejecuta y cuándo se escala | Avisa si estás con el modelo equivocado y marca las tareas difíciles (🧠) |
| Stack, en orden de preferencia | Una escalera: solo front, back simple, back dedicado | Propone siempre el escalón más bajo que alcance y justifica cada subida |
| Deploy | Dónde preferís desplegar | Arma la arquitectura y los prerrequisitos para esa plataforma |
| IA | Proveedores para voz, LLM, etc. | Los usa por defecto cuando una idea los necesita |
| Opcionales | Cosas que no se suman solas (analytics, logs, eventos...) | Te las muestra apagadas en cada proyecto para que decidas |
| Portfolio | Si los proyectos se registran en algún lado, y cómo | Registra cada proyecto nuevo y propone actualizarlo al cerrar etapas |

Son preferencias, no reglas: si una idea pide otra cosa, Claude lo propone y lo discute.

Para cambiar algo después, decilo como te salga: "a partir de ahora prefiero Bun antes que pnpm".

---

## Usarlo, paso a paso

### 1. Contá la idea

En cualquier sesión (idealmente con tu modelo de planificar):

> Tengo una nueva idea: un asistente al que le hablo desde una pantallita para anotar pendientes...

Claude te hace **una sola ronda** de preguntas con lo que falte: el problema, para quién es, el caso principal, qué entra en la primera etapa.

### 2. Discutí la arquitectura

Te propone, en corto:

- **Piezas** y dónde se despliega cada una, subiendo de escalón solo si hace falta.
- **Datos** y cómo se identifica al usuario.
- **API keys y cuentas** necesarias, y cuáles tenés que crear vos.
- **Opcionales**, todos apagados, con lo que aportaría cada uno.
- **Decisiones abiertas** y **etapas**.

Ajustás lo que quieras y das el OK.

### 3. Recibí el proyecto

Se crea la carpeta con `git init`, la spec, la arquitectura y el plan por etapas, con un commit inicial. El proyecto queda anotado en `~/.claude/semillero/proyectos.md` y, si lo configuraste, en tu portfolio (sin publicar).

### 4. Ejecutá el plan

Abrí una sesión nueva **en la carpeta del proyecto**, con tu modelo de ejecutar:

> Sigamos con hoy.

Claude busca la próxima tarea, te cuenta qué va a hacer, la implementa, la verifica, marca el avance y hace commit. Una tarea por sesión. Los pasos que son tuyos (crear cuentas, cargar claves, conectar hardware) aparecen marcados con 👤 y te los pide.

### 5. Cerrá etapas

Al terminar una etapa, te propone actualizar el estado en el portfolio. Cuando el proyecto termina, lo marca como terminado.

---

## Mejorar el framework

semillero está pensado para cambiarse rápido. Cuando algo no te guste, decilo así nomás:

> Esto no me gustó: las tareas tienen que ser más chicas.
>
> De ahora en más, al cerrar cada etapa quiero una revisión de seguridad.

`mejorar-semillero` decide dónde va el cambio:

| Si es sobre... | Va en |
|---|---|
| Un gusto tuyo (stack, deploy, modelos) | Tus preferencias |
| Cómo trabaja el framework (preguntas, plan, revisión, docs) | Los skills de este repo |
| Solo un proyecto | Los docs de ese proyecto |

Cambia lo mínimo, saca reglas que queden contradichas, anota el cambio en [`APRENDIZAJES.md`](APRENDIZAJES.md), hace commit y reinstala. La próxima vez ya sale así.

---

## Ejemplo: mi configuración, explicada

Así lo uso yo ([archivo completo](ejemplos/preferencias-9gustin.md)). Sirve como punto de partida si trabajás parecido.

| Decisión | Mi elección | Por qué |
|---|---|---|
| Herramienta | Claude Code, app de escritorio en Windows | Es donde trabajo todos los días |
| Proyectos | En WSL Ubuntu, `~/projects/<slug>` | Node, git y las herramientas andan mejor en Linux |
| Idioma | Español rioplatense, con voseo | Los docs los leo yo |
| Planificar | Opus | La arquitectura y el plan son lo que más pesa; vale la pena el mejor modelo |
| Ejecutar | Sonnet | Con un plan bien escrito, alcanza y es más rápido y barato |
| Escalar | A Opus en tareas 🧠 o si una falla dos veces | Para no trabarse en lo difícil |
| Solo front | React con Vite | Si se puede hacer simple, solo React |
| Back simple | Next.js en Vercel | Web y API en un solo deploy, sin servidor que mantener |
| Back dedicado | No se asume | Se justifica caso por caso (websockets, procesos largos, colas) |
| Base de datos | Sin preferencia fija; primero Supabase | Base, login, archivos y tiempo real en uno, y ya lo conozco |
| UI | Tailwind + shadcn/ui | Rápido y prolijo |
| Deploy | Vercel siempre que se pueda | Cada push se publica solo |
| Voz a texto | API de OpenAI | Buena calidad en español |
| LLM | Se decide por proyecto | Depende de la latencia y el costo que pida cada uno |
| Opcionales | Eventos, analytics de usuarios y logs, apagados | En una prueba de concepto suelen sobrar; se prenden si aportan |
| Portfolio | Cada proyecto se registra en [9gustin.vercel.app](https://9gustin.vercel.app) como "en progreso", nunca se publica sin mi OK | El portfolio cuenta lo que voy construyendo, y así no queda desactualizado |

---

## Qué genera en cada proyecto

```
<proyecto>/
  CLAUDE.md               reglas para el agente y links a todo
  AGENTS.md               apunta a CLAUDE.md (para otros agentes)
  README.md               qué es y por dónde empezar
  docs/SPEC.md            problema, funciones, alcance por etapas, supuestos, decisiones abiertas
  docs/ARQUITECTURA.md    piezas, deploy, datos, API, API keys, opcionales, riesgos
  docs/plan/README.md     cómo ejecutar, prerrequisitos 👤, tabla de tareas, etapas futuras
  docs/plan/etapa-NN-*.md tareas con objetivo, archivos, pasos, criterios y verificación
```

Las tareas siguen las [convenciones del plan](skills/nueva-idea/convenciones-plan.md): una sesión cada una, con criterios de aceptación y una verificación concreta.

---

## Cómo está armado este repo

```
semillero/
  README.md                  esto
  APRENDIZAJES.md            cada corrección que cambió el framework
  preferencias.ejemplo.md    plantilla vacía de preferencias
  ejemplos/                  configuraciones reales, explicadas
  instalar.sh                instala los skills y crea tu config
  .claude-plugin/plugin.json metadatos del plugin
  skills/
    nueva-idea/              SKILL.md, convenciones del plan y plantillas de docs
    seguir-proyecto/
    mejorar-semillero/
    preferencias-dev/
```

Tu configuración personal **no** vive acá: está en `~/.claude/semillero/` (`preferencias.md` y `proyectos.md`).
