# Master's Counter — Discourse Theme

Custom Discourse theme for the [Master's Counter](https://masterscounter.com) community at `community.masterscounter.com`.

## Installation

1. Go to **Admin → Customize → Themes → Install**
2. Select **From a git repository**
3. Enter this repo's URL
4. Click **Install**
5. Set as **default theme**
6. Select the "Masters Counter" color scheme
7. Attach Google Fonts component as child theme (see below)

### Required component

Install the [Discourse Google Font Component](https://github.com/discourse/discourse-google-font-component) and configure it with **Outfit** for both body and headline fonts. Add it as a child component of this theme.

## Structure

```
about.json              Theme metadata + color scheme + asset declarations
common/
  common.scss           All custom CSS (includes asset references via SCSS variables)
  head_tag.html         Video Courses header button (JS widget)
  after_header.html     Hero banner with search
  body_tag.html         Site footer
assets/
  hero-banner.jpg       Banner background image (2000px wide)
  kamon-logo.svg        Kamon logo for footer
settings.yml            Configurable theme settings
```

## Theme Assets

Assets declared in `about.json` under `"assets"` are uploaded to Discourse and available as SCSS variables:

| Asset | SCSS variable | Used in |
|-------|--------------|---------|
| `hero-banner.jpg` | `$hero-banner` | `.custom-banner` background |
| `kamon-logo.svg` | `$kamon-logo` | `.mc-footer__kamon` background |

**Important:** `{{theme-uploads.name}}` does NOT work in HTML files (`after_header.html`, `body_tag.html`). Always reference assets via SCSS `$variable` in `common.scss`.

## Local Development (discourse_theme watch)

Uses the official `discourse_theme` CLI to sync local theme files to a running Discourse instance via API.

**Prerequisites (one-time):**
```bash
brew install ruby
gem install discourse_theme
```

**Start local Discourse (from `chefacademy` repo):**
```bash
cd server/discourse && docker compose -f docker-compose.local.yml up -d
# First run: ~15 min (clone, bundle, migrate). Subsequent starts: ~2 min.
# Access: http://localhost:4200
# Login: asmund@asmundsollihogda.se / admin12345 (auto-created on first run)
```

**Start theme watcher (separate terminal):**
```bash
./server/discourse/watch-theme.sh
# First run prompts for:
#   - Discourse URL: http://localhost:4200
#   - API key: create at http://localhost:4200/admin/api/keys (Global, Single User: admin)
# Select "Create and sync with a new theme" when prompted
# Credentials stored in ~/.discourse_theme (not in repo)
```

**Edit theme files → changes sync automatically → refresh browser.**

**After a full reset (`down -v`):**
1. Start containers, wait for startup
2. Log in, create new API key
3. Run `./server/discourse/watch-theme.sh` (or with `--reset` to re-enter credentials)

**Stop:**
```bash
cd server/discourse && docker compose -f docker-compose.local.yml down
```

**Notes:**
- Google Fonts won't render locally (no component installed), but font fallbacks work for CSS development.
- If API key is lost after reset, generate a new one and run `discourse_theme watch --reset`.

## Deploy to Production

When local looks good, deploy in one step from the `chefacademy` repo:

```bash
# Commit, push, pull on server, clear cache
./server/discourse/update-theme.sh "Your commit message"

# Or if already pushed:
./server/discourse/update-theme.sh --deploy-only
```

## Theme Settings

| Setting | Default | Description |
|---------|---------|-------------|
| `banner_title` | Master's Counter — Sushi Society | Hero banner heading |
| `banner_subtitle` | The community for culinary professionals | Hero banner subtitle |
| `banner_image` | (upload) | Hero banner background image |
| `site_url` | https://masterscounter.com | Main site URL for links |

## Color Scheme

| Slot | Hex | Usage |
|------|-----|-------|
| primary | `#191919` | Main text |
| secondary | `#ffffff` | Background |
| tertiary | `#6bcdb6` | Mint green (links, buttons) |
| quaternary | `#dfb570` | Gold (accents) |
| header_background | `#ffffff` | White header |
| header_primary | `#191919` | Header text/icons |
| highlight | `#f2f1ec` | Warm cream |
| danger | `#e74c3c` | Error states |
| success | `#1ac099` | Success states |
| love | `#dfb570` | Like button (gold) |
