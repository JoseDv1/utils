# ~/.profile — login shells y (a menudo) sesiones GUI en Debian/Ubuntu.
# Mantener POSIX y liviano.

# 1) PATH básico de usuario
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
export PATH

# 2) Variables de entorno “globales”
export LANG="${LANG:-es_CO.UTF-8}"
export EDITOR="${EDITOR:-nano}"      # o "vim"
export VISUAL="$EDITOR"
export PAGER="${PAGER:-less -R}"

# 3) Herramientas que necesitas también fuera de bash interactivo (opcional)
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# 4) Si la shell es Bash e interactiva, carga ~/.bashrc (aliases, shopt, etc.)
if [ -n "$BASH_VERSION" ]; then
  case $- in
    *i*) [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc" ;;
  esac
fi
