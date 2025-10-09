#!/usr/bin/env bash
set -euo pipefail

# ─────────────────────────────────────────────
# Parse flags
# ─────────────────────────────────────────────
SLUG=""
INTAKE=""

while [[ "$#" -gt 0 ]]; do
  case "$1" in
    --slug) SLUG="$2"; shift 2 ;;
    --intake) INTAKE="$2"; shift 2 ;;
    *) echo "Unknown parameter: $1" && exit 1 ;;
  esac
done

if [[ -z "$SLUG" || -z "$INTAKE" ]]; then
  echo "Usage: $0 --slug <folder-slug> --intake <path/to/client.yaml>"
  exit 1
fi

OUT_DIR="../client-$SLUG"
echo ""
echo "🔁 Duplicating template → $OUT_DIR"

# ─────────────────────────────────────────────
# Step 1 — Duplicate template
# ─────────────────────────────────────────────
bash site-template-starter/scripts/duplicate.sh \
  --out "$OUT_DIR" \
  --intake "$INTAKE" \
  --init-git

cd "$OUT_DIR"

# ─────────────────────────────────────────────
# Step 2 — Install dependencies
# ─────────────────────────────────────────────
echo ""
echo "📦 Installing dependencies (this may take a minute)..."
if npm ci --silent 2>/dev/null; then
  echo "✅ Installed via npm ci."
else
  echo "⚠️  npm ci failed, falling back to npm install..."
  npm install --silent
  echo "✅ Installed via npm install."
fi

# ─────────────────────────────────────────────
# Step 3 — Ensure npm run watch exists
# ─────────────────────────────────────────────
if ! npm run | grep -q "watch"; then
  echo "⚠️  No 'watch' script found in package.json — adding a default Nuxt command..."
  npx npm-add-script -k "watch" -v "nuxt dev --port 3000 --host 0.0.0.0" || true
fi

# ─────────────────────────────────────────────
# Step 4 — Prepare Codex interactive instruction
# ─────────────────────────────────────────────
INSTRUCTION=$(
  cat <<'EOF'
Use site-template-starter/codex.md as the runbook and site-template-starter/intake/client.yaml as intake.
Run site-template-starter/scripts/setup.sh using intake values - this applies client branding (colors, fonts) to tailwind.config.js and site.config.ts.
Verify branding was applied: check tailwind.config.js has client colors (brand-primary, brand-accent, brand-dark, brand-light) and fonts.
Apply creative styling variations: adjust button styles, spacing, border radius, or component layouts to make this site visually distinct.
Pick a hero and services layout from site-template-starter/catalog/sections.json that differs from previous builds.
Generate Home + 3 Service pages from prompts/home.md and prompts/service.md, plus FAQs from prompts/faq.md.
Add LocalBusiness JSON-LD on Home and Service JSON-LD on each service page.
Update nav/footer links, ensure public/logo.png is referenced, verify build by briefly running `npm run watch`, then stop cleanly.
EOF
)

# ─────────────────────────────────────────────
# Step 5 — Launch Codex CLI interactively
# ─────────────────────────────────────────────
echo ""
echo "🤖 Launching Codex CLI (interactive)..."
echo "────────────────────────────────────────────"
echo "Codex will now read your runbook and intake, generate pages, and run the build."
echo "────────────────────────────────────────────"
sleep 2

codex <<< "/run \"$INSTRUCTION\""

# ─────────────────────────────────────────────
# Step 6 — Wrap up
# ─────────────────────────────────────────────
echo ""
echo "✅ Codex site generation complete!"
echo "────────────────────────────────────────────"
echo "Next steps:"
echo "  cd $OUT_DIR"
echo "  npm run watch"
echo ""
echo "To re-open Codex later:"
echo "  cd $OUT_DIR"
echo "  codex"
echo "  /run \"$INSTRUCTION\""
echo "────────────────────────────────────────────"
