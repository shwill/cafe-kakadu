#!/bin/bash
set -e
cd "$(dirname "$0")"

echo "=== Café Kakadu Build ==="

# 1. Convert menu.yml → menu.json
echo "Converting menu.yml → menu.json..."
python3 -c "
import yaml, json
with open('data/menu.yml') as f:
    data = yaml.safe_load(f)
with open('data/menu.json', 'w') as f:
    json.dump(data, f, ensure_ascii=False, indent=2)
print(f'  {len(data)} categories')
"

# 2. Convert any jpg/png in gallery to webp
echo "Processing gallery images..."
converted=0
for img in images/gallery/*.jpg images/gallery/*.jpeg images/gallery/*.png; do
    [ -f "$img" ] || continue
    base="${img%.*}"
    magick "$img" -quality 80 "${base}.webp"
    rm "$img"
    converted=$((converted + 1))
done
echo "  Converted $converted images to webp"

# 3. Generate gallery.json from webp files
echo "Generating gallery.json..."
python3 -c "
from PIL import Image
import json, os, glob

gallery = []
for path in sorted(glob.glob('images/gallery/*.webp')):
    img = Image.open(path)
    w, h = img.size
    gallery.append({'file': os.path.basename(path), 'w': w, 'h': h})

with open('data/gallery.json', 'w') as f:
    json.dump(gallery, f, indent=2)
print(f'  {len(gallery)} images')
"

echo "=== Done ==="
