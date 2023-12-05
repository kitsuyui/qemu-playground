#!/usr/bin/env bash
set -euxo pipefail

# hello-bootloader from kitsuyui/hello-bootloader
# https://github.com/kitsuyui/hello-bootloader

bootloader_binary=hello-bootloader/bootloader_binary.bin
port=12345

qemu-system-x86_64 \
-nographic -fda ${bootloader_binary} -boot a \
&> /dev/null 2>&1 3>&1 &
PID=$!
sleep 3
kill -9 $PID 2>/dev/null || true
cat test.log
