#!/bin/bash

echo "🛠️ Удаление DevOps-среды ESNSey: $(date)"

echo "Удаляем oh-my-zsh..."
rm -rf ~/.oh-my-zsh

echo "Удаляем Powerlevel10k..."
rm -rf "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

echo "Удаляем конфиги .zshrc, .p10k.zsh, ascii.txt и connect_vpngate.py..."
rm -f ~/.zshrc ~/.p10k.zsh ~/ascii.txt ~/connect_vpngate.py ~/connect_vpngate.log

echo "Удаляем логи и фоновые процессы..."
pkill -f connect_vpngate.py

echo "✅ Среда ESNSey полностью удалена."
