#!/bin/bash

echo "🚀 Добро пожаловать в DevOps WSL-среду от ESNsey!"
echo "🌐 Установка началась..."

# 1. Обновление системы
sudo apt update && sudo apt upgrade -y

# 2. Установка необходимых пакетов
sudo apt install -y zsh git curl wget unzip python3-pip net-tools

# 3. Установка Oh My Zsh
echo "⚙️ Установка Oh My Zsh..."
export RUNZSH=no
export CHSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 4. Установка Powerlevel10k
echo "🎨 Установка Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# 5. Подключение темы Powerlevel10k в .zshrc
sed -i 's|^ZSH_THEME=.*|ZSH_THEME="powerlevel10k/powerlevel10k"|' ~/.zshrc

# 6. Скачать кастомную конфигурацию Powerlevel10k от ESNsey
echo "🧠 Кастомизация Powerlevel10k от ESNsey..."
curl -fsSL https://raw.githubusercontent.com/SerjEglit/temporary-files/main/.p10k.zsh -o ~/.p10k.zsh

# Добавим в .zshrc строку, если её ещё нет
if ! grep -q '[ -f ~/.p10k.zsh ]' ~/.zshrc; then
    echo '[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh' >> ~/.zshrc
fi

# 7. Скачать скрипт VPN-подключения от ESNsey
echo "🔐 Установка скрипта VPN Gate..."
mkdir -p ~/scripts
curl -fsSL https://raw.githubusercontent.com/SerjEglit/temporary-files/main/connect_vpngate.py -o ~/scripts/connect_vpngate.py
chmod +x ~/scripts/connect_vpngate.py

# 8. Добавим alias для запуска VPN-скрипта
if ! grep -q 'connect_vpn' ~/.zshrc; then
    echo 'alias connect_vpn="python3 ~/scripts/connect_vpngate.py"' >> ~/.zshrc
fi

# 9. Установим Python-зависимости
echo "🐍 Установка зависимостей Python..."
pip3 install --user requests beautifulsoup4

# 10. Изменим оболочку на zsh
echo "🐚 Установка zsh как основной оболочки..."
chsh -s $(which zsh)

# 11. Завершение
echo ""
echo "✅ Установка завершена!"
echo "💡 Перезапусти терминал или введи команду: zsh"
echo "🔧 При первом запуске Powerlevel10k ты можешь вручную донастроить стиль, или он уже применится из .p10k.zsh"
echo ""
echo "— С уважением, ESNsey"
