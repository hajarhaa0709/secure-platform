#!/bin/bash

set -euo pipefail

echo "[1] Installation des outils de sécurité"

apt-get update
apt-get install -y auditd apparmor

echo "[2] Création des répertoires"

mkdir -p /etc/docker
mkdir -p /var/log/secure-platform

echo "[3] Activation des services"

systemctl enable auditd
systemctl start auditd

echo "[4] Chargement des règles Auditd"

augenrules --load

echo "[5] Vérification Docker"

docker info

echo "Durcissement de base terminé."
