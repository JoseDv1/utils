alias ci='code-insiders'
alias cih='ci . -r'

# Quality of life
alias sudo='sudo '        # respeta alias tras sudo
alias ..='cd ..'
alias take='mkdir -p "$1" && cd "$1"'

# Docker
alias d='docker'
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dcu='docker compose up -d'
alias dcd='docker compose down'

# Git
alias gs='git status -sb'
alias ga='git add -A'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph --decorate -n 20'
alias gco='git switch'
alias gcb='git switch -c'
alias gpl='git pull'
alias gcl='git clone'

# Utils
alias src='source ~/.bashrc'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


