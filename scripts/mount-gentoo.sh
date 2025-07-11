#!/bin/bash
set -e

# Variables de configuración
TARGET_DISK="/dev/sda"
TARGET_PART="${TARGET_DISK}4"
MOUNT_POINT="/mnt/gentoo"
LABEL_ARCH="/run/media/$USER/ARCH"
LABEL_GENTOO="/run/media/$USER/GENTOO"

echo "🔧 Desmontando posibles montajes automáticos..."
for LABEL in "$LABEL_ARCH" "$LABEL_GENTOO"; do
    if mountpoint -q "$LABEL"; then
        echo "🗑️ Desmontando $LABEL..."
        sudo umount -l "$LABEL"
    fi
done

echo "📁 Asegurando punto de montaje $MOUNT_POINT"
sudo mkdir -p "$MOUNT_POINT"

echo "✅ Montando $TARGET_PART en $MOUNT_POINT"
sudo mount "$TARGET_PART" "$MOUNT_POINT"

echo "📂 Montando sistemas virtuales necesarios..."
sudo mount -t proc /proc "$MOUNT_POINT/proc"
sudo mount --rbind /sys "$MOUNT_POINT/sys"
sudo mount --make-rslave "$MOUNT_POINT/sys"
sudo mount --rbind /dev "$MOUNT_POINT/dev"
sudo mount --make-rslave "$MOUNT_POINT/dev"
sudo mount --bind /run "$MOUNT_POINT/run"

echo "🚪 Entrando al entorno chroot Gentoo..."
sudo chroot "$MOUNT_POINT" /bin/bash --login <<'EOT'
source /etc/profile
export PS1="(chroot) gentoo # "
exec bash
EOT
