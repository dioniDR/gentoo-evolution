#!/bin/bash
set -e

# Obtener la ruta absoluta del repositorio
REPO_BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_BASE="$REPO_BASE/config"
DEST_BASE="/mnt/gentoo"

echo "📤 Aplicando configuraciones desde $CONFIG_BASE hacia $DEST_BASE..."

# Verificar que Gentoo está montado
if ! mountpoint -q "$DEST_BASE"; then
    echo "❌ Error: $DEST_BASE no está montado."
    echo "   Ejecuta primero: ./mount-gentoo.sh"
    exit 1
fi

# Verificar que los archivos de configuración existen
if [[ ! -f "$CONFIG_BASE/make.conf" ]]; then
    echo "❌ Error: No se encontraron archivos de configuración en $CONFIG_BASE"
    echo "   Estructura esperada:"
    echo "   $CONFIG_BASE/make.conf"
    echo "   $CONFIG_BASE/fstab"
    echo "   $CONFIG_BASE/locale.gen"
    exit 1
fi

echo "📂 Creando directorios necesarios..."
sudo mkdir -p "$DEST_BASE/etc/portage"

echo "📄 Copiando make.conf..."
sudo cp "$CONFIG_BASE/make.conf" "$DEST_BASE/etc/portage/make.conf"
echo "   ✅ make.conf aplicado"

echo "📄 Copiando fstab..."
sudo cp "$CONFIG_BASE/fstab" "$DEST_BASE/etc/fstab"
echo "   ✅ fstab aplicado"

echo "📄 Copiando locale.gen..."
sudo cp "$CONFIG_BASE/locale.gen" "$DEST_BASE/etc/locale.gen"
echo "   ✅ locale.gen aplicado"

echo ""
echo "✅ Todas las configuraciones aplicadas correctamente"
echo "💡 Ahora puedes entrar al chroot con: ./mount-gentoo.sh"
echo ""
