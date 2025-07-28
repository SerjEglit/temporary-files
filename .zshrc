export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh

# Алиасы ESNsey
alias ll='ls -lah --color=auto'
alias gs='git status'
alias dcu='docker compose up -d'
alias dcd='docker compose down'

# Приветствие
clear
cat << 'BANNER'
╭────────────────────────────────────────────────────────────╮
│        🚀 Добро пожаловать в DevOps WSL-среду от ESNsey        │
│  🔧 Автоматизация. 🧠 Умные алиасы. ⚙️ Инфра как код.        │
│       🌐 ZSH • Python • Docker • K8s • Git • Cloud          │
╰────────────────────────────────────────────────────────────╯
📦 Zsh        : $(zsh --version | awk '{print $2}')
🐍 Python     : $(python3 --version | awk '{print $2}')
🟢 Node.js    : $(node -v 2>/dev/null || echo "не установлен")
📅 Дата       : $(date '+%Y-%m-%d %H:%M:%S')
BANNER

echo -e "\n🎨 Архитектор ESNsey активен. Используйте терминал с мудростью.\n"
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"
