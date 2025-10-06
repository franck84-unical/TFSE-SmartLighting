#!/usr/bin/env bash
set -euo pipefail

# USO:
#   1) Crea la repo vuota su GitHub con nome: TFSE-SmartLighting
#   2) Sostituisci USER e (se necessario) ORG nell'URL qui sotto
#   3) Esegui questo script dalla radice della repo

git init
git checkout -b main
git add .
git commit -m "Initial commit: import from J3C archive"

# Sostituisci USER con il tuo username o l'organizzazione giusta
git remote add origin git@github.com:USER/TFSE-SmartLighting.git

# Se usi HTTPS invece di SSH:
# git remote add origin https://github.com/USER/TFSE-SmartLighting.git

git push -u origin main
