#!/bin/bash
set -e

REPO_BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_BASE="/mnt/gentoo"
DEST_BASE="$REPO_BASE/config"

echo "🔁 Copiando archivos desde Gentoo montado en $SRC_BASE..."

cp -v "$SRC_BASE/etc/portage/make.conf" "$DEST_BASE/make.conf"
cp -v "$SRC_BASE/etc/locale.gen" "$DEST_BASE/locale.gen"
cp -v "$SRC_BASE/etc/fstab" "$DEST_BASE/fstab"

echo "✅ Respaldo completo en: $DEST_BASE"
