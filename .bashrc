# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# ------------ Mejora de HISTORIAL ------------
# Sin duplicados y con timestamps; comparte entre sesiones
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=100000
export HISTFILESIZE=200000
export HISTTIMEFORMAT='%F %T '
shopt -s histappend cmdhist
# Anexa y vuelve a leer el historial en cada prompt
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"



## ------------ Calidad de vida ------------
shopt -s checkwinsize # actualiza LÍNEAS y COLUMNAS al cambiar tamaño de ventana
shopt -s cdspell      # corrige errores menores al usar cd
shopt -s dirspell     # corrige errores menores al usar nombres de archivos
# shopt -s autocd       # cambia a un directorio solo con escribir su nombre / # desactivado por usar zoxide



# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# ------------ Alias definitions ------------
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ------------BUN ------------
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -d /mnt/d/packages/bun/install/cache ] && export BUN_INSTALL_CACHE_DIR=/mnt/d/packages/bun/install/cache


# ------------ OLLAMA ------------
export OLLAMA_MODELS=/mnt/c/Users/JoseDv/.ollama/models

# ------------ Rust ------------
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Zoxide 
export PATH="$HOME/.local/bin:$PATH"
eval "$(zoxide init bash --cmd cd)"


# ------------ NVM (Node Version Manager) - Lazy Load ------------
export NVM_DIR="$HOME/.nvm"
_load_nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
}
# Sobrescribe funciones hasta primer uso real
nvm()  { unset -f nvm;  _load_nvm; nvm  "$@"; }
node() { unset -f node; _load_nvm; node "$@"; }
npm()  { unset -f npm;  _load_nvm; npm  "$@"; }
npx()  { unset -f npx;  _load_nvm; npx  "$@"; }
pnpm() { unset -f pnpm; _load_nvm; pnpm "$@"; }
corepack() { unset -f corepack; _load_nvm; corepack "$@"; }
