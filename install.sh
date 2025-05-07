#!/bin/bash

echo "Installing DMR package manager"
echo ""

if [ ! -f "bin/dmr" ]; then
    echo "dmr executable not found in bin/dmr"
    exit 1
fi

sudo mkdir -p /usr/local/bin
sudo cp bin/dmr /usr/local/bin/
sudo chmod +x /usr/local/bin/dmr

sudo mkdir -p /var/cache/dmr
sudo touch /var/cache/dmr/installed.txt
sudo chown -R $(whoami) /var/cache/dmr

echo ""
echo "DMR has been successfully installed!"
echo "Now you can use:"
echo "  dmr download python3"
echo "  dmr download mc"
echo "  dmr list"
