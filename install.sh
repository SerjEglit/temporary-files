#!/bin/bash

echo "🛠️ Начинаем установку DevOps-среды ESNSey: $(date)"

# Проверка и установка Zsh
if ! command -v zsh &>/dev/null; then
  echo "🔧 Устанавливаем Zsh..."
  sudo apt update && sudo apt install -y zsh curl git
else
  echo "✅ Zsh уже установлен."
fi

# Установка Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "🔧 Устанавливаем Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "✅ Oh My Zsh уже установлен."
fi

# Установка Powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  echo "🔧 Устанавливаем Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
else
  echo "✅ Powerlevel10k уже установлен."
fi

# Установка .p10k.zsh из репозитория
echo "📄 Загружаем конфиг .p10k.zsh..."
curl -fsSL https://raw.githubusercontent.com/SerjEglit/temporary-files/main/.p10k.zsh -o ~/.p10k.zsh \
  && echo "✅ Конфиг .p10k.zsh установлен." || echo "❌ Ошибка загрузки .p10k.zsh"

# Установка connect_vpngate.py с логированием и обработкой ошибок
echo "📡 Устанавливаем connect_vpngate.py..."
curl -fsSL https://raw.githubusercontent.com/SerjEglit/temporary-files/main/connect_vpngate.py -o ~/connect_vpngate.py \
  && chmod +x ~/connect_vpngate.py && echo "✅ connect_vpngate.py установлен." || echo "❌ Ошибка загрузки connect_vpngate.py"

# Настройка .zshrc с включением Powerlevel10k и вызовом ascii-приветствия
echo "🔧 Настраиваем .zshrc..."
cat > ~/.zshrc << 'EOF'
# ESNSey DevOps WSL Environment .zshrc

# Локализация
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git docker docker-compose zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Загружаем конфиг Powerlevel10k
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Приветствие с ASCII-артом ESNSey
if [[ $- == *i* ]]; then
  cat ~/ascii.txt
  echo "🎨 Архитектор ESNSey активен. Используйте терминал с мудростью."
fi

# Автозапуск connect_vpngate.py в фоне с логированием
if ! pgrep -f "connect_vpngate.py" > /dev/null; then
  nohup ~/connect_vpngate.py >> ~/connect_vpngate.log 2>&1 &
fi

EOF

echo "✅ .zshrc настроен."

echo "🎉 Установка завершена. Перезапустите терминал или выполните: exec zsh"

