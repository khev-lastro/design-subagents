# Lais da Imobiliária — Design System

## Direction
Brazilian PropTech CRM for real estate agents (corretores). The AI assistant "Lais" surfaces contextual insights. Feels like a knowledgeable colleague tapping your shoulder — not an alarm system.

**Source of truth:** Figma WAR ROOM file. When Figma values conflict with older notes, Figma wins.

---

## Typography

Two-family system:
- **Display:** Red Hat Display — page titles, large headings, code/data display
- **Body:** Red Hat Text — all UI text, labels, nav, table content

```
Scale:
  10px — micro labels
  12px — table headers, captions, badge text, nav section labels
  14px — body, table rows, subtitles
  16px — nav items, section headers
  18px — subsection titles
  32px — page title (Display, weight 700)

Weights: 400 (body) / 500 (labels, nav) / 600 (subheadings) / 700 (display, data values)
Letter spacing: -1 (display/32px) / -0.4 (headings/18px+) / 0 (body)
Line heights: 1.4 (body) / 1.4 (display)
Tabular nums: font-variant-numeric: tabular-nums on all data/numbers
```

---

## Palette

### Primary
```
Purple-500: #9664fa   — badge accent tint, hover bg
Purple-600: #6845ad   — primary CTA, active nav, progress bars
Purple-800: #49317a   — hover on primary, deep accent
```

### Neutrals
```
Gray-50:  #fafafa   — page background canvas
Gray-100: #f5f5f5   — inset bg, code block background, recessed surfaces
Gray-300: #e5e5e5   — borders, dividers, card outlines
Gray-800: #646464   — secondary text, table headers, meta labels
Gray-900: #323232   — primary body text, nav items
Black:    #1a1a1a   — high-contrast text (titles in some contexts)
White:    #ffffff   — card surfaces, sidebar, modals
```

### Semantic
```
Green-600: #0a8558   — Ativo status, success states
Green-800: #075539   — success hover, deep green
```

### Special surfaces
```
Lavender-tint: #eae0fe   — role badge background (Membro/Editor/Administrador)
```

> **Note:** Notification catalog (lais-notifications/) uses `#7C3AED`. App shell uses `#6845ad`. These are distinct — don't cross-apply.

---

## Spacing

4px base grid.

```
2px  — micro (tight icon pairs)
4px  — base unit
6px  — compact spacing
8px  — xs gaps, icon-to-label
12px — table cell padding, compact card internals
18px — card internal gap
24px — card padding (standard)
32px — section separation
```

---

## Radius

```
999px — pills: badges, status chips, NOVO tag, progress bar
8–12px — cards, containers (inferred ~8px from visual)
8px   — buttons (not full pill — slight radius only)
6–8px — inputs, code blocks
```

---

## Depth Strategy

Borders-first.

| Context | Treatment |
|---|---|
| Page canvas | `background: #fafafa` |
| Cards / panels | `background: white; border: 1px solid #e5e5e5` |
| Recessed / inset blocks | `background: #f5f5f5; border: 1px solid #e5e5e5` |
| Sidebar | `background: white; border-right: 1px solid #e5e5e5` |
| Floating (popovers, modals) | `box-shadow: shadow-lg` |

No decorative shadows on inline elements.

---

## Component Patterns

### Button Primary
```
height: 40px
padding: 0 20px
background: #6845ad
color: white
border: none
border-radius: 8px
font: Red Hat Text, 14px, weight 500
icon-left: "+" at 16px when used as add action

hover: background: #49317a
```

### Badge / Role Pill (Membro, Editor, Administrador)
```
background: #eae0fe
color: #6845ad
height: ~24px
padding: 0 10px
border-radius: 999px
font: 12px / 500 / Red Hat Text
```

### Status Pill (Ativo)
```
border: 1px solid #0a8558
background: white
color: #0a8558
leading dot: 6px circle, #0a8558
height: ~24px
padding: 0 10px
border-radius: 999px
font: 12px / 500 / Red Hat Text
```

### NOVO Badge
```
background: #6845ad
color: white
height: ~18px
padding: 0 6px
border-radius: 999px
font: 10px / 600 / Red Hat Text
letter-spacing: 0.05em uppercase
```

### Code Display Block
```
background: #f5f5f5
border: 1px solid #e5e5e5
border-radius: 8px
padding: 16px 20px
width: ~180px

Value: Red Hat Display, 28px, weight 700, tracking -1
Label: Red Hat Text, 12px, weight 400, color #646464
```

### Seat Usage Bar
```
Label: "X de Y assentos utilizados" — 12px / 400 / #646464
Progress bar: height 4px, radius 999px, fill #6845ad
Available chip: Gray-100 bg, icon + text, 12px
```

---

## Table Patterns

```
Container: white bg, border: 1px solid #e5e5e5, radius: 8–12px
Header row: 12px / 500–600 / #646464, padding: 12px 16px
Body rows: 14px / 400 / #323232, height: ~48px
Row separator: 1px solid #e5e5e5
Row hover: (infer purple-tint: rgba(104, 69, 173, 0.04))
Row action: kebab ⋮ icon, ghost button, right-aligned
Dropdown cells (Assento): inline select trigger, 14px, chevron icon
```

---

## Navigation Sidebar

```
Width: ~195px
Background: white
Border-right: 1px solid #e5e5e5

Logo: "Lais" wordmark + spinner icon, top-left
Workspace: bold name + sub-workspace + chevron
Nav sections: 12px / 600 / #646464 uppercase label, no icon
Nav items: icon (20px) + label (16px / 500 / #323232), padding: 8px 12px, radius: 6px
  Active: color #6845ad, bg: rgba(104,69,173,0.08)
  Hover: bg: #f5f5f5
```

---

## Smart Suggestion Patterns

### Visual Language
- **3px accent border** encodes category everywhere (banners, cards, row nudges, spotlights)
- Purple = Lais AI insight
- Amber = time-sensitive / urgency
- Green = opportunity / positive
- Blue = feature discovery
- All suggestions attributed: "Sugestão da Lais" with sparkle icon

### 1. Insight Banner
Inline between header and table. Horizontal, slim. Icon (28px rounded square) + text + action link + dismiss. Border-left 3px accent. Background white, border #e5e5e5, shadow-xs.

### 2. Row Nudge
3px left border on td:first-child. Pill badge below lead name ("Esperando há 3h"). Hover badge → popover (280px) with: source label, contextual text with bold stats, stat strip (#f5f5f5 bg, large numbers), single CTA button. Arrow pointing down.

### 3. Suggestion Card
380px, fixed bottom-right in `.suggestion-tray`. Top 3px accent bar. Inner padding 20px. Header: 36px icon (rounded-md, tinted bg) + source label + title + desc + close. Data strip: #f5f5f5 bg, large tabular numbers + labels + optional 4px progress bar. Footer: ghost dismiss + primary action. Stack with column-reverse + 12px gap.

### 4. Feature Spotlight
Pulsing 8px blue dot (absolute, top-right of target element). Click → popover (280px) with blue-left accent border. Source label + title + description + action buttons. 2s pulse animation.

### Shared Patterns
- Dismiss: 24px ghost button, #e5e5e5 → #646464 on hover
- Actions: text links (font-weight 600, #6845ad) or buttons (btn-sm)
- Animations: bannerIn (0.25s ease, translateY -4px), cardIn (0.3s cubic-bezier, translateY 16px + scale 0.97), spotlightPulse (2s infinite)
- Popovers: white bg, #e5e5e5 border, shadow-lg, 8px rotated arrow, 0.15s fade+translate

---

## Bottom Action Bar

White bg, `border-top: 1px solid #e5e5e5`. Selection count (12px, #646464) + divider + button hierarchy (filled → outline → ghost).

---

## Cost Breakdown Popover — "Tap the Money"

Pattern for exposing per-invoice cost composition (boletos, Valor da próxima fatura, any monetary total the user might want to reconcile).

### Interaction Model

**Every R$ amount is a trigger.** One mental model across the product: tap the money to see its math.

- Click the R$ value → floating popover opens anchored to the amount
- Hover on R$ → subtle underline (1px, 3px offset) as affordance
- Click outside, Esc, or click the same amount again → closes
- Shared popover element (one per page, re-anchored on each open)

**Redundant trigger for new interactions.** When introducing the pattern for the first time (or on a primary/landing surface like Valor da próxima fatura), add an **icon + text button** underneath the amount as a discoverability aid:

```
R$ 21.184,00          ← primary trigger (clickable amount)
📄 Composição do custo ← redundant, explicit affordance (icon+text button)
```

Both triggers open the same popover. Use `receipt-text` Lucide icon for composição actions. Drop the icon+text as the pattern becomes familiar; amount-click stays.

### Popover Surface

```
Width: 320px (max-width: calc(100vw - 24px))
Padding: 16px 20px
Background: white
Border: 1px solid #e5e5e5 (gray-200)
Border-radius: 12px (radius-lg)
Shadow: shadow-lg
Arrow: 10×10px rotated square, white + matching 1px border, positioned over anchor center
Placement: auto — below when space, otherwise flip above
Animation: 0.15s ease fade + translateY(-4px → 0)
Z-index: 600
```

Arrow x-position is dynamic (CSS var `--arrow-x`) so it always points at the trigger center even when the popover is clamped to the viewport edge.

### Popover Content Structure

```
┌─ Head (flex, space-between) ────────────┐
│  COMPOSIÇÃO DO CUSTO       Abril/2026  │  ← uppercase label + invoice ref
├──────────────────────────────────────────┤
│  Plano 4.000 créditos       R$ 20.400  │  ← base rows, gray-500 label / gray-700 value
│  Desconto 4%                −R$ 816    │  ← green-600 both sides
│  Lais Adicional              Isento    │  ← green-600 (positive outcome)
│  Assentos Premium (5)        Isento    │
│  Assentos adicionais (2)    R$ 1.000   │
│  Excedente (120 × R$ 5)     R$ 600     │  ← amber-700 both sides (warning state)
├──────────────────────────────────────────┤
│  Total                      R$ 21.184  │  ← Red Hat Display 700, gray-900, border-top
└──────────────────────────────────────────┘
```

### Color Semantics Inside the Breakdown

| Row type | Color | Weight |
|---|---|---|
| Standard cost (label) | `--gray-500` | 400 |
| Standard cost (value) | `--gray-700` | 500 |
| Discount / Isento | `--green-600` | 500 |
| Excedente / over-limit charge | `--amber-700` | 500 |
| Total line | `--gray-900` | 700 (Display) |

### Scenario-Driven Content

The popover reads data attributes from the anchor:
- `data-total="R$ 20.584,00"` — total shown in popover footer
- `data-ref="Abril/2026"` — invoice month shown in header
- `data-excedente="1"` — shows/hides the amber excedente row

Scenario switchers update the anchor attrs; the popover re-renders on each open.

### Where NOT to Use

- Non-monetary triggers (use the existing Row Nudge popover for AI suggestions)
- Amounts representing "—" or placeholders (mark parent `.substituido` or skip `R$` prefix; handler auto-disables)
- Quick summary strips where the user doesn't need reconciliation

### Why This Over Inline Accordion

An inline accordion (row expands in place) was considered and rejected for this product because:
- Rows paired with a min-height neighbor card would unbalance on expand
- The Histórico tab already uses a year-accordion — nesting an accordion inside an accordion gets heavy
- Intent is "peek and close" (verify one number), not "browse many" (compare breakdowns)

Popover reuses the existing Smart Suggestion popover vocabulary (shadow-lg, 8px arrow, 0.15s fade+translate) so users learn one floating-surface idiom.

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
  0%, 100% { box-shadow: 0 0 0 0 rgba(104,69,173,0.4); }
  50%       { box-shadow: 0 0 0 6px rgba(104,69,173,0); }
}
/* duration: 2s infinite */
```
