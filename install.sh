#!/bin/bash

echo ""
echo "🛠️ Начало установки: $(date)"
echo ""

# Путь к домашней директории
HOME_DIR="$HOME"

# ---- ZSH и Powerlevel10k ----
echo "🔧 Устанавливаю Zsh и Powerlevel10k..."

# Установка zsh
sudo apt update
sudo apt install -y zsh curl git wget fonts-powerline

# Установка oh-my-zsh
if [ ! -d "$HOME_DIR/.oh-my-zsh" ]; then
    echo "📦 Устанавливаю Oh My Zsh..."
    RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "✅ oh-my-zsh уже установлен."
fi

# Установка Powerlevel10k
if [ ! -d "$HOME_DIR/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    echo "📦 Устанавливаю Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        "$HOME_DIR/.oh-my-zsh/custom/themes/powerlevel10k"
else
    echo "✅ Powerlevel10k уже установлена."
fi

# ---- Конфигурация Powerlevel10k ----
echo "📄 Устанавливаю .p10k.zsh..."
wget -q https://raw.githubusercontent.com/SerjEglit/temporary-files/main/.p10k.zsh -O "$HOME_DIR/.p10k.zsh" || echo "⚠️ Не удалось загрузить .p10k.zsh"

# ---- .zshrc настройка ----
echo "🔧 Настраиваю .zshrc..."
wget -q https://raw.githubusercontent.com/SerjEglit/temporary-files/main/.zshrc -O "$HOME_DIR/.zshrc"

# ---- Aliases и полезные скрипты ----
echo "📡 Устанавливаю connect_vpngate.py..."
wget -q https://raw.githubusercontent.com/SerjEglit/temporary-files/main/connect_vpngate.py -O "$HOME_DIR/connect_vpngate.py"
chmod +x "$HOME_DIR/connect_vpngate.py"

# ---- Финальное сообщение ----
echo ""
cat <<'EOF'
╭────────────────────────────────────────────────────────────╮
│        🚀 Добро пожаловать в DevOps WSL-среду от ESNsey        │
│  🔧 Автоматизация. 🧠 Умные алиасы. ⚙️ Инфра как код.        │
│       🌐 ZSH • Python • Docker • K8s • Git • Cloud          │
╰────────────────────────────────────────────────────────────╯
🖋 Автор: Архитектор ESNsey | GitHub: https://github.com/SerjEglit
📦 Zsh        : $(zsh --version)
🐍 Python     : $(python3 --version)
🟢 Node.js    : $(node --version 2>/dev/null || echo "не установлен")
📅 Дата       : $(date)

🎉 Установка завершена! Перезапустите терминал или выполните:

  exec zsh
EOF
