import requests
import os
from time import sleep

URL = "https://www.vpngate.net/api/iphone/"
LOG = os.path.expanduser("~/vpngate_log.txt")

def log(msg):
    with open(LOG, "a") as f:
        f.write(f"[VPNGate] {msg}\n")

def fetch_configs():
    try:
        log("🛰️ Запрашиваю данные с vpngate.net...")
        resp = requests.get(URL, timeout=10)
        resp.raise_for_status()
        log("✅ Данные получены успешно.")
        # Пример обработки: сохраним CSV
        with open(os.path.expanduser("~/vpngate_list.csv"), "w") as f:
            f.write(resp.text)
        log("📄 Список серверов сохранён.")
    except requests.exceptions.RequestException as e:
        log(f"❌ Ошибка при получении данных: {e}")

if __name__ == "__main__":
    log("🚀 Запуск connect_vpngate.py")
    fetch_configs()
