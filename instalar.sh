#!/usr/bin/env bash
# Copia los skills de semillero a la carpeta de skills de usuario de Claude Code en Windows
# y crea ~/.claude/semillero con las plantillas de config si todavía no existe.
#   wsl.exe -d Ubuntu -- bash ~/projects/semillero/instalar.sh
set -euo pipefail

raiz="$(cd "$(dirname "$0")" && pwd)"
usuario_windows="$(cmd.exe /c 'echo %USERNAME%' 2>/dev/null | tr -d '\r')"
claude="/mnt/c/Users/${usuario_windows}/.claude"

mkdir -p "$claude/skills" "$claude/semillero"
for skill in "$raiz"/skills/*/; do
  nombre="$(basename "$skill")"
  rm -rf "${claude:?}/skills/$nombre"
  cp -r "$skill" "$claude/skills/$nombre"
  echo "instalado: $nombre"
done

[ -f "$claude/semillero/preferencias.md" ] || { cp "$raiz/preferencias.ejemplo.md" "$claude/semillero/preferencias.md"; echo "creado: preferencias.md (editalo o usá el skill preferencias-dev)"; }
[ -f "$claude/semillero/proyectos.md" ] || { cp "$raiz/skills/nueva-idea/plantillas/proyectos.md" "$claude/semillero/proyectos.md"; echo "creado: proyectos.md"; }
echo "listo: $claude"
