#!/bin/bash
set -e

REPO_BASE="/home/dioni/gentoo-evolution/config"
DEST_BASE="/mnt/gentoo/etc"

if ! mount | grep -q "$DEST_BASE"; then
  echo "❌ Error: $DEST_BASE no está montado. Ejecuta primero el script mount-gentoo.sh"
  exit 1
fi

echo "📤 Aplicando archivos de configuración desde $REPO_BASE hacia $DEST_BASE..."

sudo cp "$REPO_BASE/make.conf" "$DEST_BASE/portage/make.conf"
sudo cp "$REPO_BASE/fstab" "$DEST_BASE/fstab"
sudo cp "$REPO_BASE/locale.gen" "$DEST_BASE/locale.gen"

echo "✅ Archivos copiados correctamente."
