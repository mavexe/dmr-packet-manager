#!/bin/bash

echo "Installing DMR package manager..."

# Проверяем наличие основного скрипта
if [ ! -f "bin/dmr" ]; then
    echo "Error: dmr executable not found in bin/dmr"
    echo "Please run this script from the root of dmr repository"
    exit 1
fi

# Устанавливаем зависимости
echo "Checking dependencies..."
for cmd in curl tar sudo; do
    if ! command -v $cmd >/dev/null 2>&1; then
        echo "Error: $cmd is required but not installed"
        exit 1
    fi
done

# Копируем основной скрипт
echo "Copying dmr to /usr/local/bin..."
sudo cp bin/dmr /usr/local/bin/
sudo chmod +x /usr/local/bin/dmr

# Создаем необходимые директории
echo "Creating cache directory..."
sudo mkdir -p /var/cache/dmr
sudo touch /var/cache/dmr/installed.txt
sudo chown -R $(whoami) /var/cache/dmr

echo "Creating log file..."
sudo touch /var/log/dmr.log
sudo chown $(whoami) /var/log/dmr.log

echo ""
echo "DMR has been successfully installed!"
echo "Now you can use:"
echo "  dmr download python3"
echo "  dmr download mc"
echo "  dmr list"
