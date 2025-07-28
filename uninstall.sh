#!/bin/bash
echo "🛠️ Начинаю удаление среды ESNsey DevOps WSL: $(date)"

# Удаляем oh-my-zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "Удаляю oh-my-zsh..."
  rm -rf "$HOME/.oh-my-zsh"
else
  echo "oh-my-zsh не найден."
fi

# Удаляем powerlevel10k
if [ -d "$HOME/.powerlevel10k" ]; then
  echo "Удаляю Powerlevel10k..."
  rm -rf "$HOME/.powerlevel10k"
fi

# Удаляем zsh конфиги
echo "Удаляю конфигурационные файлы zsh..."
rm -f "$HOME/.zshrc" "$HOME/.p10k.zsh" "$HOME/.zsh_aliases"

# Удаляем connect_vpngate.py
if [ -f "$HOME/connect_vpngate.py" ]; then
  echo "Удаляю connect_vpngate.py..."
  rm -f "$HOME/connect_vpngate.py"
fi

# Очищаем zsh из системных оболочек (если нужно)
if command -v chsh >/dev/null 2>&1; then
  echo "Возвращаю оболочку по умолчанию (bash)..."
  chsh -s /bin/bash
fi

echo "✅ Удаление завершено. Рекомендуется перезапустить терминал."

exit 0
