#!/usr/bin/env bash
set -euo pipefail

A="Pixel_AI_brush_1.jpg"
B="Pixel_AI_brush_4.jpg"
OUT="Pixel_AI_brush_glitch.gif"

WORK=".glitch_frames"
rm -rf "$WORK"
mkdir -p "$WORK"

magick "$A" -resize 1024x1024\! "$WORK/a.png"
magick "$B" -resize 1024x1024\! "$WORK/b.png"

magick \
  -delay 200 "$WORK/a.png" \
  -delay 6   "$WORK/b.png" \
  -delay 300 "$WORK/a.png" \
  -delay 4   "$WORK/b.png" \
  -delay 400 "$WORK/a.png" \
  -loop 0 \
  -layers Optimize \
  "$OUT"

echo "Created: $OUT"
