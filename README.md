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

## Deploying

From the main `chefacademy` repo:

```bash
# One command: commit, push, pull on server, clear cache
./server/discourse/update-theme.sh "Your commit message"

# Or deploy-only (if already pushed)
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
