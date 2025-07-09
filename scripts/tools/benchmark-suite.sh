#!/bin/bash

MOUNTPOINT="/mnt/benchmarks"
DEVICE="/dev/nvme0n1p8"
HOSTNAME=$(hostname | tr '[:upper:]' '[:lower:]')
OUT_DIR="${MOUNTPOINT}/${HOSTNAME}"

# 1. Montar si no está montado
if ! mountpoint -q "$MOUNTPOINT"; then
  echo "📦 /mnt/benchmarks no está montado. Intentando montar $DEVICE..."
  sudo mkdir -p "$MOUNTPOINT"
  sudo mount "$DEVICE" "$MOUNTPOINT" || {
    echo "❌ Error al montar $DEVICE. Abortando."
    exit 1
  }
else
  echo "✅ $MOUNTPOINT ya está montado."
fi

# 2. Crear carpeta para este sistema
mkdir -p "$OUT_DIR"

# 3. Ejecutar benchmark
OUTFILE="$OUT_DIR/results_$(date +%Y%m%d_%H%M%S).txt"
echo "🔍 Benchmark for: $HOSTNAME" > "$OUTFILE"
echo "🕒 Date: $(date)" >> "$OUTFILE"
echo >> "$OUTFILE"

# Boot time
if command -v systemd-analyze &> /dev/null; then
  echo "⏱️ Boot Time:" >> "$OUTFILE"
  systemd-analyze >> "$OUTFILE" 2>&1
  echo >> "$OUTFILE"
fi

# CPU benchmark (simulado)
echo "🧠 CPU test (fake compile):" >> "$OUTFILE"
(time echo "Pretend compiling...") 2>> "$OUTFILE"
echo >> "$OUTFILE"

# Memoria
echo "🧠 Memory:" >> "$OUTFILE"
free -h >> "$OUTFILE"
echo >> "$OUTFILE"

# I/O test
echo "💾 Disk I/O:" >> "$OUTFILE"
dd if=/dev/zero of="$OUT_DIR/testfile" bs=1M count=256 conv=fdatasync oflag=direct >> "$OUTFILE" 2>&1
rm -f "$OUT_DIR/testfile"
echo >> "$OUTFILE"

echo "✅ Benchmark saved to: $OUTFILE"