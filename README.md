# Master's Counter — Discourse Theme

Custom Discourse theme for the [Master's Counter](https://masterscounter.com) community at `community.masterscounter.com`.

## Installation

1. Go to **Admin → Customize → Themes → Install**
2. Select **From a git repository**
3. Enter this repo's URL
4. Click **Install**
5. Set as **default theme**
6. Select the "Masters Counter" color scheme

### Required component

Install the [Discourse Google Font Component](https://github.com/discourse/discourse-google-font-component) and configure it with **Outfit** for both body and headline fonts. Add it as a child component of this theme.

### Hero banner image

1. Go to **Admin → Customize → Themes → Masters Counter**
2. Under **Theme Settings**, upload a hero banner image (recommended 2000px wide)
3. Set banner title and subtitle as desired

## Structure

```
about.json              Theme metadata + color scheme
common/
  common.scss           All custom CSS
  head_tag.html         Video Courses header button (JS widget)
  after_header.html     Hero banner with search
  body_tag.html         Site footer
assets/
  hero-banner.jpg       Default banner image
settings.yml            Configurable theme settings
```

## Theme Settings

| Setting | Default | Description |
|---------|---------|-------------|
| `banner_title` | Master's Counter — Sushi Society | Hero banner heading |
| `banner_subtitle` | The community for culinary professionals | Hero banner subtitle |
| `banner_image` | (upload) | Hero banner background image |
| `site_url` | https://masterscounter.com | Main site URL for links |

## Updating

After pushing changes to this repo:
1. Go to **Admin → Customize → Themes → Masters Counter**
2. Click **Check for Updates**

Or configure a webhook for automatic updates.

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
