# CLAUDE.md — Casa da Lais Design System

## Project Overview

**Product:** Casa da Lais — B2B PropTech CRM SaaS for Brazilian real estate agents (*corretores*)
**AI Assistant:** "Lais" — surfaces contextual AI insights. Feels like a knowledgeable colleague, not an alarm system.
**Market:** Brazil only. All UI copy is **PT-BR**.
**Design System Files:**
- `lais-notifications/system.md` — canonical, complete token spec + notification patterns
- `.interface-design/system.md` — secondary reference (older, less detailed)

**Product & Domain Reference:**
- `Lais.md` — **READ THIS FIRST** for any new feature. Contains Lais product overview, Lastro company context, REA/CRECI regulatory framework, billing model, product terminology (atendimentos, boletos, VGV, consumo), lead status flow, integration ecosystem, and design implications per user role.

---

## Stack & Tooling

- **Framework:** None — pure vanilla HTML/CSS/JavaScript
- **Build system:** None — files are self-contained standalone `.html` prototypes
- **Styling:** Plain CSS with custom properties (`:root` variables)
- **Font:** Inter via Google Fonts (`https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap`)
- **Icons:** Inline SVG or Unicode emoji (no icon library)
- **No npm, no bundler, no component library, no utility framework (no Tailwind)**

When implementing a Figma design, output a **self-contained HTML file** with all CSS inline in a `<style>` block. Do not reference external CSS files or JS modules.

---

## Design Tokens

All tokens are CSS custom properties defined in `:root`. Use these names exactly.

### Colors

```css
:root {
  /* Purple — brand / Lais AI identity */
  --purple-50:  #faf5ff;
  --purple-100: #f3e8ff;
  --purple-200: #e9d5ff;
  --purple-300: #d8b4fe;
  --purple-400: #c084fc;
  --purple-500: #a855f7;
  --purple-600: #9333ea;   /* primary accent, CTAs, hover states */
  --purple-700: #7e22ce;
  --purple-800: #6b21a8;
  --purple-900: #581c87;

  /* Gray — neutral surfaces */
  --gray-25:  #fcfcfd;
  --gray-50:  #f9fafb;   /* page background */
  --gray-100: #f3f4f6;   /* soft borders, hover backgrounds */
  --gray-200: #e5e7eb;   /* standard borders, dividers */
  --gray-300: #d1d5db;
  --gray-400: #9ca3af;   /* tertiary text, placeholders */
  --gray-500: #6b7280;   /* secondary text */
  --gray-600: #4b5563;
  --gray-700: #374151;
  --gray-800: #1f2937;   /* body text (app) */
  --gray-900: #111827;   /* primary text */

  /* Semantic */
  --green-50:  #f0fdf4;
  --green-100: #dcfce7;
  --green-600: #16a34a;   /* success, sent, positive states */
  --green-700: #15803d;

  --amber-50:  #fffbeb;
  --amber-100: #fef3c7;
  --amber-500: #f59e0b;   /* warning, urgent, time-sensitive */
  --amber-600: #d97706;
  --amber-700: #b45309;

  --red-50:  #fef2f2;
  --red-100: #fee2e2;
  --red-500: #ef4444;
  --red-600: #dc2626;    /* error */

  --blue-50:  #eff6ff;
  --blue-100: #dbeafe;
  --blue-500: #3b82f6;   /* feature discovery, informational */
  --blue-600: #2563eb;

  --white:   #ffffff;
}
```

> **Note:** The notification catalog (`lais-notifications/`) uses `--p600: #7C3AED` (a slightly cooler purple). Prefer `--purple-600: #9333ea` in new work unless the component explicitly lives within the notification catalog.

### Spacing

4px base grid. Use `--sp-N` variables:

```css
--sp-1: 4px;
--sp-2: 8px;
--sp-3: 12px;
--sp-4: 16px;
--sp-5: 20px;
--sp-6: 24px;
--sp-8: 32px;
--sp-10: 40px;
--sp-12: 48px;
```

### Shadows

Borders-first approach. Shadows only on floating/overlay elements.

```css
--shadow-xs: 0 1px 2px rgba(0,0,0,0.04);                                           /* inline containers */
--shadow-sm: 0 1px 3px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04);
--shadow-md: 0 4px 6px -1px rgba(0,0,0,0.06), 0 2px 4px -2px rgba(0,0,0,0.04);    /* cards, notification drawers */
--shadow-lg: 0 10px 15px -3px rgba(0,0,0,0.06), 0 4px 6px -4px rgba(0,0,0,0.04);  /* floating panels, modals */
--shadow-xl: 0 20px 25px -5px rgba(0,0,0,0.06), 0 8px 10px -6px rgba(0,0,0,0.04);
--shadow-purple: 0 4px 16px rgba(124,58,237,0.20);                                  /* purple glow on primary CTAs */
```

### Radius

```css
--radius-sm: 6px;   /* inputs, buttons */
--radius-md: 8px;   /* cards, nav items, buttons */
--radius-lg: 12px;  /* containers, panels */
--radius-xl: 16px;  /* modals */
/* pill: border-radius: 999px — badges, tags */
```

### Typography

```css
font-family: -apple-system, BlinkMacSystemFont, 'Inter', 'Segoe UI', sans-serif;

--text-xs:   11px;  /* labels, uppercase headers, badges */
--text-sm:   13px;  /* secondary content, table rows */
--text-base: 14px;  /* body text */
--text-lg:   16px;
--text-xl:   20px;
--text-2xl:  24px;

--leading-tight:  1.25;
--leading-normal: 1.5;

--tracking-tight:  -0.01em;  /* headings */
--tracking-normal: 0;
--tracking-wide:   0.02em;   /* uppercase labels */
```

Weights: 400 (body) / 500 (labels, nav) / 600 (headings, CTAs) / 700 (display, emphasis)
Tabular numbers: `font-variant-numeric: tabular-nums` on all data/numbers.

---

## Depth Strategy

**Borders-first** for app chrome. **Shadows only on floating elements.**

| Context | Treatment |
|---|---|
| Table rows, dividers | `border-bottom: 1px solid var(--gray-100)` |
| Cards, panels | `border: 1px solid var(--gray-200); box-shadow: var(--shadow-xs)` |
| Notification cards / suggestion tray | `box-shadow: var(--shadow-md)` |
| Popovers, modals, drawers | `box-shadow: var(--shadow-lg)` |
| Primary CTA buttons | `box-shadow: var(--shadow-purple)` (optional) |

---

## Layout Patterns

### App Shell

```
.app { display: flex; min-height: 100vh; }

.sidebar {
  width: 240px;
  background: white;
  border-right: 1px solid var(--gray-100);
  position: sticky; top: 0; height: 100vh;
}

.main { flex: 1; display: flex; flex-direction: column; }
.page-header { background: white; border-bottom: 1px solid var(--gray-200); }
.content { padding: var(--sp-6); background: var(--gray-50); }
```

### Table

```css
.table-container {
  background: white;
  border: 1px solid var(--gray-200);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-xs);
  overflow: hidden;
}

thead { background: var(--gray-50); position: sticky; top: 0; }
th { font-size: var(--text-xs); font-weight: 600; color: var(--gray-400);
     text-transform: uppercase; letter-spacing: 0.05em; padding: var(--sp-3) var(--sp-4); }

tbody tr { border-bottom: 1px solid var(--gray-100); transition: background 0.1s; }
tbody tr:hover { background: #faf5ff; } /* purple-50 tint */
td { font-size: var(--text-sm); padding: var(--sp-3) var(--sp-4); }
```

### Bottom Action Bar

White bg + `border-top: 1px solid var(--gray-200)`. Selection count (xs, gray-400) + divider + button hierarchy (filled → outline → ghost).

---

## Component Patterns

### Button Primary

```css
.btn-primary {
  height: 36px; padding: 0 var(--sp-5);
  background: var(--purple-600); color: white;
  border: none; border-radius: var(--radius-md);
  font-size: var(--text-base); font-weight: 500;
  cursor: pointer; transition: background 0.15s;
}
.btn-primary:hover { background: var(--purple-700); }
```

### Button Secondary (Ghost/Outline)

```css
.btn-secondary {
  height: 36px; padding: 0 var(--sp-4);
  background: transparent; color: var(--gray-700);
  border: 1px solid var(--gray-200); border-radius: var(--radius-md);
  font-size: var(--text-base); font-weight: 500;
  cursor: pointer; transition: all 0.15s;
}
.btn-secondary:hover { border-color: var(--gray-300); background: var(--gray-50); }
```

### Badge / Pill Tag

```css
.badge {
  display: inline-flex; align-items: center; gap: 4px;
  height: 20px; padding: 0 8px;
  border-radius: 999px;
  font-size: var(--text-xs); font-weight: 600;
}
/* Variants: tinted bg + dark text for CRM stages */
/* "Novo" badge: background: var(--purple-600); color: white */
```

### Status Dot

```css
.status-dot {
  width: 6px; height: 6px; border-radius: 50%;
  /* Colors: green-600 (active), amber-500 (warm), blue-500 (new), gray-400 (inactive) */
}
```

---

## AI Suggestion / Lais Patterns

All Lais AI suggestions use a **3px left accent border** to encode category:

| Color | Token | Meaning |
|---|---|---|
| Purple | `--purple-600` | Lais AI insight |
| Amber | `--amber-500` | Time-sensitive / urgent |
| Green | `--green-600` | Opportunity / positive |
| Blue | `--blue-500` | Feature discovery |

All suggestions are attributed with `✦ Sugestão da Lais` label.

### Insight Banner (inline, between header and table)

```css
.insight-banner {
  background: white; border: 1px solid var(--gray-200);
  border-left: 3px solid <accent-color>;
  border-radius: var(--radius-md); padding: var(--sp-3) var(--sp-4);
  box-shadow: var(--shadow-xs);
}
/* Layout: icon (28px rounded square) + text + action link + dismiss */
```

### Row Nudge (table row with AI suggestion)

```css
/* Left border on first td */
tr.has-nudge td:first-child { border-left: 3px solid <accent-color>; }
/* Pill badge below lead name */
.nudge-badge { border-radius: 999px; font-size: var(--text-xs); }
/* Hover → popover (280px, shadow-lg, 8px arrow) */
```

### Suggestion Card (fixed bottom-right tray)

```css
.suggestion-card {
  width: 380px; background: white;
  border: 1px solid var(--gray-200); border-radius: var(--radius-lg);
  border-top: 3px solid <accent-color>;
  box-shadow: var(--shadow-lg); padding: var(--sp-5);
}
/* Stack in .suggestion-tray: column-reverse + 12px gap */
/* Footer: ghost dismiss + primary action */
/* Data strip: gray-50 bg, large tabular numbers, optional 4px progress bar */
```

### Feature Spotlight

```css
/* Pulsing 8px blue dot (absolute, top-right of target) */
.spotlight-dot {
  width: 8px; height: 8px; border-radius: 50%;
  background: var(--blue-500);
  animation: spotlightPulse 2s infinite;
}
/* Click → 280px popover with blue-left accent border */
```

---

## Notification Patterns (from Figma Explorações)

Used in `lais-notifications/index.html`. Canvas is dark (`background: #0A0A0B`) for showcase.

| Pattern | Description |
|---|---|
| `whatsnew-drawer` | Right-side slide-in panel. Multiple features by date + screenshot previews. Scrollable. |
| `whatsnew/dialog` | Centered modal. Single feature, large screenshot. Close with X. |
| `tooltip-newfeature` | Purple bubble tooltip anchored to UI element. CTA: "Entendi". |
| `tooltip-newfeature-skippable` | Same + "Próxima dica" + skip link. |
| `header-noticia` | Inline section header row. "Agora você pode…" + date + "Novo" pill. |
| `menu-direita-cima` | Top navbar with purple "🔥 Novidades•" CTA + bell badge. |
| `whatsnew-popup` | Full-page skeleton while What's New loads. |

---

## Animations

```css
@keyframes bannerIn {
  from { opacity: 0; transform: translateY(-4px); }
  to   { opacity: 1; transform: translateY(0); }
}
/* duration: 0.25s ease */

@keyframes cardIn {
  from { opacity: 0; transform: translateY(16px) scale(0.97); }
  to   { opacity: 1; transform: translateY(0) scale(1); }
}
/* duration: 0.3s cubic-bezier(0.34, 1.56, 0.64, 1) */

@keyframes spotlightPulse {
  0%, 100% { box-shadow: 0 0 0 0 rgba(59,130,246,0.4); }
  50%       { box-shadow: 0 0 0 6px rgba(59,130,246,0); }
}
/* duration: 2s infinite */

/* Popover: 0.15s ease fade + translateY(4px → 0) */
```

---

## Implementing Figma Designs

When a Figma design is provided:

1. **Output format:** Self-contained `*.html` file. All styles in `<style>` block. No external files.
2. **Tokens first:** Map Figma colors/spacing/radius to existing CSS variables above before writing any code.
3. **Purple resolution:** If Figma uses `#7C3AED`, map to the notification catalog context; if `#9333ea`, it's the main app context.
4. **Copy language:** All visible copy must be **PT-BR** (Brazilian Portuguese).
5. **No shadows on inline elements:** Only add `box-shadow` if the element visually floats above content.
6. **AI attribution:** Any Lais AI insight must include `✦ Sugestão da Lais` label.
7. **Tabular numbers:** Apply `font-variant-numeric: tabular-nums` to all numerical data.
8. **Hover states:** Table rows → `--purple-50` tint. Nav items → `--gray-100` bg. Ghost buttons → `border-color` darkens.
9. **Version naming:** New HTML prototypes follow the pattern `leads-table-v4.html`.

---

## File Structure

```
design-subagents/
├── CLAUDE.md                          ← this file
├── Lais.md                            ← product & domain reference (READ FIRST)
├── .interface-design/system.md        ← secondary design system ref
├── lais-notifications/
│   ├── system.md                      ← canonical design system (use this)
│   └── index.html                     ← notification patterns catalog
├── leads-table.html                   ← v1 CRM table prototype
├── leads-table-v2.html                ← v2 (practical UI principles)
├── leads-table-v3.html                ← v3 (AI smart suggestion research applied)
├── interface-design/
│   └── reference/
│       ├── system-template.md
│       └── examples/
│           ├── system-precision.md    ← reference: dashboard/dense style
│           └── system-warmth.md      ← reference: consumer/approachable style
└── *.md                               ← research reports (PT-BR PropTech)
```
