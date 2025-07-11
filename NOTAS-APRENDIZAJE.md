Este archivo contiene reflexiones, comandos clave que costaron, errores frecuentes y sugerencias personales.

# Notas de Aprendizaje - Gentoo Evolution

## Comandos que costaron

- `eselect profile set` y entender el número correcto del perfil (confusión entre systemd y openrc)
- `emerge --sync` y sus errores por `setlocale`
- `make.conf`: errores por `SYNC` deprecado y `MAKEOPTS="-j$(nproc)"` por sustitución fallida
- Problemas de claves GPG con `emerge-webrsync`
- Saber cuándo y desde dónde ejecutar scripts (fuera o dentro de chroot)

## Sugerencias para el futuro

- Leer los mensajes de salida de `emerge` con calma (muchas advertencias importantes)
- No usar `LANG="en_US.UTF-8"` hasta tener `locale.gen` configurado
- Siempre montar `/proc`, `/sys`, `/dev`, `/run` correctamente antes del `chroot`
- Evitar editar `make.conf` dentro del chroot si no se montó bien el sistema
- Tener un archivo `.env` para definir el dispositivo y partición objetivo

## Aun no domino:
- Cuándo usar `eselect news read`
- Integración de `genkernel` y configuración manual de `USE flags`
- Cuándo se considera seguro instalar GRUB desde el pendrive

## Recomendación
Este documento debe acompañar cada sesión de instalación para mantener registro personal y repetir éxitos o evitar errores.
