#!/bin/bash

PROJECT_DIR="$HOME/shvirtd-example-python"

if [ ! -d "$PROJECT_DIR" ]; then
  mkdir -p /opt
  cd /opt
  git clone https://github.com/victorialugi/shvirtd-example-python.git
fi

cd "$PROJECT_DIR"

# Обновляем репозиторий
git pull origin main

# Останавливаем старый compose
docker compose down

# Скачиваем свежие образы
docker compose pull

# Запускаем
docker compose up -d

echo "Проект запущен. Проверка: curl -L http://127.0.0.1:8090"
