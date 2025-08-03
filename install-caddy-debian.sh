#!/bin/bash
set -e

echo "[*] Installing dependencies..."
sudo apt update
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https curl gnupg

echo "[*] Adding Caddy GPG key..."
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' \
  | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg

echo "[*] Adding Caddy APT repo..."
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' \
  | sudo tee /etc/apt/sources.list.d/caddy-stable.list

echo "[*] Setting proper permissions..."
sudo chmod o+r /usr/share/keyrings/caddy-stable-archive-keyring.gpg
sudo chmod o+r /etc/apt/sources.list.d/caddy-stable.list

echo "[*] Updating package index..."
sudo apt update

echo "[*] Installing Caddy..."
sudo apt install -y caddy

echo "[✔] Caddy installed successfully!"