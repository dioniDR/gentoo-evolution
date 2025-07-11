Gentoo Evolution

Repositorio documental y de respaldo para la instalación avanzada de Gentoo desde un entorno Arch Linux en un pendrive.

Objetivo

Este repositorio busca servir como bitácora personal, portafolio técnico y molde replicable para reinstalación o migración de sistemas Gentoo.

Se utiliza una estructura organizada para respaldar archivos de configuración clave, scripts de montaje automático, y registro de los pasos realizados.

Estructura del proyecto

.
├── config                 # Archivos de configuración extraídos desde el sistema Gentoo
│   ├── fstab
│   ├── locale.gen
│   └── make.conf
├── scripts               # Scripts automatizados
│   ├── mount-gentoo.sh
│   ├── apply-configs.sh
│   └── backup-configs.sh
├── log                   # (Futuro) Registro de pasos y logs importantes
├── README.md             # Este archivo

Requisitos

Un pendrive con al menos 32 GB (se recomienda > 64 GB)

Arch Linux instalado como sistema anfitrión

El sistema de destino (Gentoo) en la partición /dev/sda4

Flujo de trabajo recomendado

Clonar este repositorio:

git clone https://github.com/dioniDR/gentoo-evolution.git
cd gentoo-evolution/scripts

Montar Gentoo desde el pendrive:

./mount-gentoo.sh

Aplicar configuraciones respaldadas:

./apply-configs.sh

Ingresar al entorno chroot:
(automático desde el script anterior)

Continuar la instalación de Gentoo...

(Opcional) Respaldar configuraciones:

./backup-configs.sh

Consideraciones

Todos los scripts están pensados para ejecutarse desde el directorio scripts/

Se requiere sudo para operaciones de montaje

El entorno chroot requiere que el pendrive haya sido montado previamente
