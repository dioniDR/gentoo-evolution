# 🔄 MIGRACIÓN A OTROS PCs

## ⚠️ **PARÁMETROS A CAMBIAR EN OTROS ENTORNOS**

### **Si usas en PC diferente, DEBES cambiar:**

#### **1. Dispositivo de almacenamiento**
```bash
# scripts/mount-gentoo.sh líneas 5-6:
TARGET_DISK="/dev/sda"    # Cambiar por tu dispositivo
TARGET_PART="${TARGET_DISK}4"    # Cambiar número de partición

# EJEMPLOS para otros PCs:
# TARGET_DISK="/dev/nvme0n1"     # Para NVMe
# TARGET_DISK="/dev/sdb"         # Para segundo disco
# TARGET_PART="${TARGET_DISK}3"  # Si Gentoo está en partición 3
2. Optimizaciones de CPU
