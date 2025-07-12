#!/bin/bash
set -e

echo "🔧 Aplicando fixes conocidos para evitar errores comunes..."

# Verificar que estamos en chroot
if [[ ! -f /etc/portage/make.conf ]]; then
    echo "❌ Error: Este script debe ejecutarse dentro del chroot de Gentoo"
    echo "   Ejecuta primero: ./mount-gentoo.sh"
    exit 1
fi

echo "📋 Fix 1: Configurando licencias de firmware..."
# Fix 1: Licencias de firmware para linux-firmware
if ! grep -q "linux-fw-redistributable" /etc/portage/make.conf; then
    echo 'ACCEPT_LICENSE="linux-fw-redistributable"' >> /etc/portage/make.conf
    echo "   ✅ Licencia linux-fw-redistributable agregada"
else
    echo "   ✅ Licencia ya configurada"
fi

echo "📋 Fix 2: Configurando targets de Python..."
# Fix 2: Python targets preventivo para genkernel
mkdir -p /etc/portage/package.use
if [[ ! -f /etc/portage/package.use/python-fixes ]]; then
    cat > /etc/portage/package.use/python-fixes << 'EOF'
# Auto-generated Python targets for genkernel compatibility
# Prevents python_targets_python3_11 errors during emerge
dev-python/gpep517 python_targets_python3_11
dev-python/setuptools python_targets_python3_11
dev-python/jaraco-collections python_targets_python3_11
dev-python/jaraco-functools python_targets_python3_11
dev-python/jaraco-text python_targets_python3_11
dev-python/more-itertools python_targets_python3_11
dev-python/packaging python_targets_python3_11
dev-python/platformdirs python_targets_python3_11
dev-python/wheel python_targets_python3_11
dev-python/setuptools-scm python_targets_python3_11
dev-python/trove-classifiers python_targets_python3_11
dev-python/flit-core python_targets_python3_11
dev-python/jaraco-context python_targets_python3_11
dev-python/backports-tarfile python_targets_python3_11
dev-python/installer python_targets_python3_11
EOF
    echo "   ✅ Python targets configurados"
else
    echo "   ✅ Python targets ya configurados"
fi

echo "📋 Fix 3: Configurando locales..."
# Fix 3: Locales para eliminar warnings
if ! grep -q "^en_US.UTF-8 UTF-8" /etc/locale.gen; then
    sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
    locale-gen
    eselect locale set 3
    env-update
    echo "   ✅ Locales configurados y generados"
else
    echo "   ✅ Locales ya configurados"
fi

echo ""
echo "✅ Todos los fixes aplicados correctamente"
echo "💡 Ahora puedes ejecutar: emerge genkernel"
echo ""
