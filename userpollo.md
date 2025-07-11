# Usuario está muy pollo - Recomendado Leer

Este archivo está diseñado para orientar a personas que, aunque estén avanzando en la instalación de Gentoo o explorando sistemas Linux desde cero, reconocen que aún están "pollos" (novatos) en varios conceptos clave.

---

## ❄️ Fundamentos que deberías dominar pronto

### ✏️ Archivos y estructura de Linux

* Diferencia entre `/etc`, `/usr`, `/var`, `/dev`, `/proc`, `/sys`, `/run`, `/mnt`, `/boot`
* Qué es un archivo de configuración (`.conf`, `.gen`, `.service`)
* Entender qué es un "symlink" (`ln -s`)

### ⚡ Montaje de sistemas

* `mount`, `umount`, `lsblk`, `blkid`, `df -h`
* Cuándo se monta `proc`, `sys`, `dev`, `run` y por qué
* Por qué un `chroot` necesita esos sistemas virtuales montados

### ⚙️ Portage y el ecosistema Gentoo

* `emerge`, `eselect`, `genkernel`, `USE flags`
* Dónde vive la información de los paquetes (`/var/db/repos/gentoo`, `/etc/portage/`)
* Qué es un "stage3", "profile", "ebuild"

### 🌐 Red y sincronización

* `emerge --sync`, `emerge-webrsync`, claves GPG, mirrors
* Problemas comunes con `setlocale`, errores de `SYNC`, `make.conf`

---

## 🔧 Herramientas básicas para dominar

* `nano`, `cp`, `mv`, `ls`, `tree`, `grep`, `cat`, `echo`, `chmod`, `chown`
* `sudo`, `su`, `passwd`, `whoami`
* `cd`, `pwd`, `mkdir`, `rm`, `rmdir`
* `bash`, `./script.sh`, variables de entorno `$VAR`, export

---

## ☑ Cosas que debes practicar

* Crear y ejecutar scripts en bash con seguridad
* Saber qué significa cada sección de `make.conf`
* Cuándo y cómo usar `eselect` para perfiles, noticias, etc.
* Diferencia entre sistema anfitrión y sistema objetivo (ej. Arch vs Gentoo en chroot)
* Analizar errores de `emerge` y no entrar en pánico

---

## 💭 Lecturas recomendadas

* Gentoo Handbook: [https://wiki.gentoo.org/wiki/Handbook\:Main\_Page](https://wiki.gentoo.org/wiki/Handbook:Main_Page)
* Guía sobre Portage: [https://wiki.gentoo.org/wiki/Portage](https://wiki.gentoo.org/wiki/Portage)
* Conceptos de chroot: [https://wiki.gentoo.org/wiki/Chroot](https://wiki.gentoo.org/wiki/Chroot)
* Árbol de directorios en Linux: [https://wiki.archlinux.org/title/Filesystem\_Hierarchy\_Standard](https://wiki.archlinux.org/title/Filesystem_Hierarchy_Standard)
* Guía de uso de bash para scripts: [https://linuxconfig.org/bash-scripting-tutorial-for-beginners](https://linuxconfig.org/bash-scripting-tutorial-for-beginners)

---

## 🧐 Sugerencias finales

* No temas equivocarte, pero documenta lo que hiciste
* Pregúntate siempre: “Ésto lo hice en Arch o en Gentoo (chroot)?”
* Si algo falla, no borres nada sin antes inspeccionar
* Usa comandos como `tree`, `ls -l`, `cat` y `echo` para ver, no para cambiar
* Repite los pasos exitosos como scripts

---

Este archivo crecerá contigo. Agrégale tus propios errores y aprendizajes. ¡Estás evolucionando!
