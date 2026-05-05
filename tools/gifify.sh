#!/usr/bin/env bash
set -euo pipefail

input="${1:?Usage: $0 input-video [width] [fps]}"
width="${2:-400}"
fps="${3:-10}"

base="${input%.*}"
output="${base}.gif"

ffmpeg -hide_banner -y \
  -i "$input" \
  -vf "fps=${fps},scale=${width}:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
  -loop 0 \
  "$output"

echo "Created: $output"
