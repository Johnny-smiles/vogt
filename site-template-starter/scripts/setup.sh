#!/usr/bin/env bash
set -euo pipefail

INTAKE="${1:-site-template-starter/intake/client.yaml}"
if [ ! -f "$INTAKE" ]; then
  echo "❌ Intake YAML not found at $INTAKE"
  exit 1
fi

if ! command -v yq >/dev/null 2>&1; then
  echo "❌ yq is required. Install with: brew install yq"
  exit 1
fi

echo "📄 Reading intake from $INTAKE"

# ─────────────────────────────────────────────
# Parse intake.yaml
# ─────────────────────────────────────────────
SITE_NAME=$(yq -r '.site.name' "$INTAKE")
SITE_URL=$(yq -r '.links.website // ("https://" + .site.domain)' "$INTAKE")
PHONE=$(yq -r '.site.phone' "$INTAKE")
PHONE_DISPLAY=$(yq -r '.site.phone_display // .site.phone' "$INTAKE")
EMAIL=$(yq -r '.site.email' "$INTAKE")
CITY=$(yq -r '.site.city' "$INTAKE")
REGION=$(yq -r '.site.region' "$INTAKE")
POSTAL=$(yq -r '.site.postal' "$INTAKE")
DESC=$(yq -r '.site.description' "$INTAKE")
BUSINESS_TYPE=$(yq -r '.site.business_type // "LocalBusiness"' "$INTAKE")

PRIMARY=$(yq -r '.branding.colors.primary' "$INTAKE")
ACCENT=$(yq -r '.branding.colors.accent' "$INTAKE")
DARK=$(yq -r '.branding.colors.dark' "$INTAKE")
LIGHT=$(yq -r '.branding.colors.light' "$INTAKE")
GRADIENT_FROM=$(yq -r '.branding.colors.gradient_from // .branding.colors.primary' "$INTAKE")
GRADIENT_TO=$(yq -r '.branding.colors.gradient_to // .branding.colors.dark' "$INTAKE")
HEADING_FONT=$(yq -r '.branding.fonts.heading // "Montserrat"' "$INTAKE")
BODY_FONT=$(yq -r '.branding.fonts.body // "Inter"' "$INTAKE")

echo "─────────────────────────────────────────────"
echo "🧩 Loaded:"
echo "  Site:     $SITE_NAME"
echo "  Domain:   $SITE_URL"
echo "  Phone:    $PHONE_DISPLAY"
echo "  Email:    $EMAIL"
echo "  Location: $CITY, $REGION"
echo "  Colors:   Primary=$PRIMARY  Accent=$ACCENT  Dark=$DARK"
echo "  Fonts:    Heading=$HEADING_FONT  Body=$BODY_FONT"
echo "─────────────────────────────────────────────"

# ─────────────────────────────────────────────
# Patch site.config.ts
# ─────────────────────────────────────────────
SITE_FILE="site.config.ts"
if [ -f "$SITE_FILE" ]; then
  echo "🛠 Updating $SITE_FILE..."
  cp "$SITE_FILE" "$SITE_FILE.bak-$(date +%s)"

  sed -i.bak \
    -e "s|siteName: .*|siteName: \"${SITE_NAME}\",|" \
    -e "s|siteUrl:.*|siteUrl: '${SITE_URL}',|" \
    -e "s|phone:.*|phone: '${PHONE}',|" \
    -e "s|email:.*|email: '${EMAIL}',|" \
    -e "s|city: '.*'|city: '${CITY}'|" \
    -e "s|state: '.*'|state: '${REGION}'|" \
    -e "s|zip: '.*'|zip: '${POSTAL}'|" \
    -e "s|description: .*|description: \"${DESC}\",|" \
    -e "s|primaryColor: '.*'|primaryColor: '${PRIMARY}'|" \
    -e "s|accentColor: '.*'|accentColor: '${ACCENT}'|" \
    "$SITE_FILE" || true
  echo "✅ Updated $SITE_FILE"
fi

# ─────────────────────────────────────────────
# Patch tailwind.config.js with client colors
# ─────────────────────────────────────────────
TAILWIND_FILE="tailwind.config.js"
if [ -f "$TAILWIND_FILE" ]; then
  echo "🎨 Updating $TAILWIND_FILE with client branding..."
  cp "$TAILWIND_FILE" "$TAILWIND_FILE.bak-$(date +%s)"
  
  sed -i.bak \
    -e "s|'brand-dark':[[:space:]]*'#[^']*'|'brand-dark': '${DARK}'|" \
    -e "s|'brand-primary':[[:space:]]*'#[^']*'|'brand-primary': '${PRIMARY}'|" \
    -e "s|'brand-primary-2':[[:space:]]*'#[^']*'|'brand-primary-2': '${GRADIENT_TO}'|" \
    -e "s|'brand-accent':[[:space:]]*'#[^']*'|'brand-accent': '${ACCENT}'|" \
    -e "s|'brand-light':[[:space:]]*'#[^']*'|'brand-light': '${LIGHT}'|" \
    -e "s|heading: \['[^']*'|heading: ['${HEADING_FONT}'|" \
    -e "s|body: \['[^']*'|body: ['${BODY_FONT}'|" \
    "$TAILWIND_FILE" || true
  echo "✅ Updated $TAILWIND_FILE with colors and fonts"
fi

# ─────────────────────────────────────────────
# Patch robots.txt
# ─────────────────────────────────────────────
if [ -f "public/robots.txt" ]; then
  echo "🤖 Updating public/robots.txt"
  cp public/robots.txt public/robots.txt.bak-$(date +%s)
  cat > public/robots.txt <<ROB
User-agent: *
Allow: /

Sitemap: ${SITE_URL%/}/sitemap.xml
ROB
fi

# ─────────────────────────────────────────────
# Patch netlify.toml canonical
# ─────────────────────────────────────────────
if [ -f "netlify.toml" ]; then
  echo "🌐 Checking netlify.toml"
  cp netlify.toml netlify.toml.bak-$(date +%s)
  if ! grep -q "canonical" netlify.toml; then
cat >> netlify.toml <<'TOML'

# Canonical redirect for Netlify subdomain → custom domain
# [[redirects]]
#   from = "/*"
#   to   = "https://REPLACE_YOUR_DOMAIN/:splat"
#   status = 301
#   conditions = { Host = ["your-site.netlify.app"] }
TOML
  fi
fi

# ─────────────────────────────────────────────
# Service generation (optional)
# ─────────────────────────────────────────────
echo "🧩 Generating data/services.ts (if services defined)…"
if yq '.services' "$INTAKE" >/dev/null 2>&1; then
  mkdir -p data
  cat > data/services.ts <<'TS'
export type Service = {
  slug: string
  title: string
  summary: string
  bullets: string[]
  schemaType?: 'Service' | 'HVACBusiness' | 'Contractor'
  metaDescription?: string
  keywords?: string[]
  content?: string
}

export const services: Service[] = [
TS
  count=$(yq '.services | length' "$INTAKE")
  for ((i = 0; i < count; i++)); do
    slug=$(yq ".services[$i].slug" "$INTAKE")
    title=$(yq ".services[$i].title" "$INTAKE")
    summary=$(yq ".services[$i].summary" "$INTAKE")
    echo "  { slug: '${slug}', title: '${title}', summary: '${summary}', bullets: [" >> data/services.ts
    yq ".services[$i].bullets[]" "$INTAKE" | sed "s/^/    '/; s/$/',/" >> data/services.ts
    echo "  ] }$( [ $i -lt $((count-1)) ] && echo ',' )" >> data/services.ts
  done
  echo "]" >> data/services.ts
  echo "✅ data/services.ts created with ${count} entries."
else
  echo "ℹ️ No services defined in intake; skipping."
fi

echo "✅ Setup complete for ${SITE_NAME}"
