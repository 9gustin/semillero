#!/usr/bin/env bash
# Instala los skills de semillero en la carpeta de skills de usuario de Claude Code
# y crea ~/.claude/semillero con la config inicial si todavía no existe.
#
#   bash ~/projects/semillero/instalar.sh
#   wsl.exe -d Ubuntu -- bash ~/projects/semillero/instalar.sh   (desde Windows, repo en WSL)
#
# En WSL instala en la carpeta de Windows (C:\Users\<vos>\.claude), que es la que usa
# Claude Code de escritorio. En Linux o macOS instala en ~/.claude.
set -euo pipefail

raiz="$(cd "$(dirname "$0")" && pwd)"

if command -v cmd.exe >/dev/null 2>&1; then
  usuario_windows="$(cmd.exe /c 'echo %USERNAME%' 2>/dev/null | tr -d '\r')"
  claude="/mnt/c/Users/${usuario_windows}/.claude"
else
  claude="${CLAUDE_HOME:-$HOME/.claude}"
fi

mkdir -p "$claude/skills" "$claude/semillero"
for skill in "$raiz"/skills/*/; do
  nombre="$(basename "$skill")"
  rm -rf "${claude:?}/skills/$nombre"
  cp -r "$skill" "$claude/skills/$nombre"
  echo "instalado: $nombre"
done

if [ ! -f "$claude/semillero/preferencias.md" ]; then
  cp "$raiz/preferencias.ejemplo.md" "$claude/semillero/preferencias.md"
  echo "creado: preferencias.md (completalo, o decile a Claude \"configurá mis preferencias de semillero\")"
fi
if [ ! -f "$claude/semillero/proyectos.md" ]; then
  cp "$raiz/skills/nueva-idea/plantillas/proyectos.md" "$claude/semillero/proyectos.md"
  echo "creado: proyectos.md"
fi
echo "listo: $claude"
