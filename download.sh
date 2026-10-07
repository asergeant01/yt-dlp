#!/usr/bin/env bash
# Downloads the highest quality video+audio for a given URL, merged into downloads/.
set -euo pipefail

if [[ $# -ne 1 ]]; then
	echo "Usage: $0 <video-url>" >&2
	exit 1
fi

URL="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$SCRIPT_DIR/downloads"

mkdir -p "$OUTPUT_DIR"

yt-dlp \
	-f "bestvideo+bestaudio/best" \
	--merge-output-format mp4 \
	-o "$OUTPUT_DIR/%(title)s.%(ext)s" \
	"$URL"
