# ⚙️ CONFIGURACIÓN ESPECÍFICA DE HARDWARE

## 🖥️ **SISTEMA DE LABORATORIO ACTUAL**

Este proyecto está configurado específicamente para:

### **Hardware Target**
- **CPU**: AMD Ryzen AI 9 365 (20 cores)
- **RAM**: 23GB disponible
- **Almacenamiento**: NVMe + SSD
- **Partición Gentoo**: /dev/sda4
- **Sistema Anfitrión**: Arch Linux en pendrive

### **Configuraciones Hardcodeadas**
```bash
# EN scripts/mount-gentoo.sh:
TARGET_DISK="/dev/sda"          # ← ESPECÍFICO para este PC
TARGET_PART="${TARGET_DISK}4"   # ← Gentoo en partición 4

# EN config/make.conf:
MAKEOPTS="-j20"                 # ← ESPECÍFICO para 20 cores
COMMON_FLAGS="-march=native"    # ← ESPECÍFICO para AMD Ryzen AI 9 365
