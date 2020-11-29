#!/bin/bash

chown -R displayuser:displayuser /opt/chromium-p1
chown -R displayuser:displayuser /home/displayuser
chown -R root:input /dev/input/

chvt 8

sudo -E -u displayuser -- /opt/chromium-p1/chrome \
    --disable-dev-shm-usage \
    --force-system-compositor-mode \
    --use-gl=egl \
    --autoplay-policy=no-user-gesture-required \
    --no-user-gesture-required \
    --disable-site-isolation-trials \
    --test-type \
    --enable-oop-rasterization \
    --enable-gpu-rasterization \
    --in-process-gpu \
    --enable-zero-copy \
    $CHROMIUM_FLAGS \
    $@
