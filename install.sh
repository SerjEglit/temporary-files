#!/usr/bin/env bash

echo -e "\n🛠️ Начало установки: $(date)\n"

### === УСТАНОВКА ZSH + POWERLEVEL10K === ###
echo -e "🔧 Устанавливаю Zsh и Powerlevel10k..."

# Установка zsh
sudo apt update && sudo apt install -y zsh curl git

# Установка oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "✅ oh-my-zsh уже установлен."
fi

# Установка powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
  echo "✅ Powerlevel10k уже установлена."
fi

### === КОНФИГ ZSH === ###
echo "📄 Устанавливаю .p10k.zsh..."
curl -fsSL https://raw.githubusercontent.com/SerjEglit/temporary-files/main/.p10k.zsh -o ~/.p10k.zsh || echo "⚠️ .p10k.zsh не найден."

echo "🔧 Настраиваю .zshrc..."
curl -fsSL https://raw.githubusercontent.com/SerjEglit/temporary-files/main/.zshrc -o ~/.zshrc || echo "⚠️ .zshrc не найден."

### === VPN-СКРИПТ === ###
echo "📡 Устанавливаю connect_vpngate.py..."
curl -fsSL https://raw.githubusercontent.com/SerjEglit/temporary-files/main/connect_vpngate.py -o ~/connect_vpngate.py || echo "⚠️ Скрипт VPN не найден."
chmod +x ~/connect_vpngate.py

### === DOCKER WSL CONFIG (если надо) === ###
echo "🐳 Настраиваю Docker + WSL интеграцию..."
sudo apt install -y docker.io docker-compose
sudo usermod -aG docker $USER

# WSL-specific настройка
echo -e "[wsl2]\nmemory=4GB\nprocessors=2" | sudo tee /etc/wsl.conf > /dev/null

### === ASCII-ПРИВЕТСТВИЕ === ###
cat <<'EOF'

╭────────────────────────────────────────────────────────────╮
│        🚀 Добро пожаловать в DevOps WSL-среду от ESNsey        │
│  🔧 Автоматизация. 🧠 Умные алиасы. ⚙️ Инфра как код.        │
│       🌐 ZSH • Python • Docker • K8s • Git • Cloud          │
╰────────────────────────────────────────────────────────────╯

             ╔════════════════════════════════════╗
             ║    🏗️ Архитектор системы: ESNsey    ║
             ╚════════════════════════════════════╝

EOF

### === ИТОГ === ###
echo -e "\n✅ Установка завершена. Перезапустите терминал или выполните:"
echo -e "\n  \033[1;32mexec zsh\033[0m\n"
