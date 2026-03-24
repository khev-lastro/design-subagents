# Lais da Imobiliária — Design System

## Direction
Brazilian PropTech CRM for real estate agents (corretores). The AI assistant "Lais" surfaces contextual insights. Feels like a knowledgeable colleague tapping your shoulder — not an alarm system.

## Palette
- **Brand:** `#49317A` (primary) / `#6845AD` (primary-600) / `#9664FA` (primary-400 / ring)
- **Surfaces:** White `#FFFFFF` (card), `#F8F8FA` (canvas/background)
- **Borders:** `#D1D1D9` (standard), `#E5E5EB` (soft/sidebar)
- **Neutral scale:** 900=`#1A1A2E` 700=`#4A4A5A` 600=`#6B6B7B` 400=`#B0B0BC` 200=`#E5E5EB` 100=`#F0F0F4` 50=`#F8F8FA`
- **Text:** neutral-800 `#2D2D3F` (primary), neutral-600 `#6B6B7B` (muted)
- **Semantic:** success=`#16A34A`, info=`#2563EB`, warning=`#F59E0B`, danger=`#EF4444`
- **Semantic tints (badge/banner):** each semantic color has 50/100/700 stops

## Depth Strategy
Borders-first. Shadows only on floating elements (cards, popovers, toast). shadow-xs for inline containers, shadow-lg for floating.

## Spacing
4px base grid. Scale: 4, 8, 12, 16, 20, 24, 32, 40, 48.

## Typography
- **Body:** Red Hat Text, -apple-system, sans-serif. Base 14px / 0.875rem.
- **Headings:** Red Hat Display, -apple-system, sans-serif. Use `.font-heading`, tracking -0.01em.
- Scale: 11/13/14/16/18/20/24px. Hierarchy via weight (400/500/600/700) + tracking, not size alone.
- Tabular nums for data. Font smoothing: antialiased.

## Radius
6px (inputs/buttons), 8px (cards/nav), 12px (containers), 16px (modals).

## Smart Suggestion Patterns

### Visual Language
- **3px accent border** encodes category everywhere (banners, cards, row nudges, spotlights)
- Purple = Lais AI insight
- Amber = time-sensitive / urgency
- Green = opportunity / positive
- Blue = feature discovery
- All suggestions attributed: "Sugestão da Lais" with sparkle icon

### 1. Insight Banner
Inline between header and table. Horizontal, slim. Icon (28px rounded square) + text + action link + dismiss. Border-left 3px accent. Background white, border gray-200, shadow-xs.

### 2. Row Nudge
3px left border on td:first-child. Pill badge below lead name ("Esperando há 3h"). Hover badge → popover (280px) with: source label, contextual text with bold stats, stat strip (gray-50 bg, large numbers), single CTA button. Arrow pointing down.

### 3. Suggestion Card
380px, fixed bottom-right in `.suggestion-tray`. Top 3px accent bar. Inner padding 20px. Header: 36px icon (rounded-md, tinted bg) + source label + title + desc + close. Data strip: gray-50 bg, large tabular numbers + labels + optional 4px progress bar. Footer: ghost dismiss + primary action. Stack with column-reverse + 12px gap.

### 4. Feature Spotlight
Pulsing 8px blue dot (absolute, top-right of target element). Click → popover (280px) with blue-left accent border. Source label + title + description + action buttons. 2s pulse animation.

### Shared Patterns
- Dismiss: 24px ghost button, gray-300 → gray-500 on hover
- Actions: text links (font-weight 600, purple-600) or buttons (btn-sm)
- Animations: bannerIn (0.25s ease, translateY -4px), cardIn (0.3s cubic-bezier, translateY 16px + scale 0.97), spotlightPulse (2s infinite)
- Popovers: white bg, gray-200 border, shadow-lg, 8px rotated arrow, 0.15s fade+translate

### Table Patterns
- Container: white bg, gray-200 border, radius-lg, shadow-xs
- Header: gray-50 bg, sticky, uppercase 11px/600 gray-400
- Rows: hover → purple-50. Borders: gray-100 between rows
- Status dots: 6px colored circles (green/amber/blue)
- CRM badges: pill (999px radius), tinted bg + dark text
- Row actions: opacity 0 → 1 on hover, 32px ghost buttons → purple-100 on hover

### Bottom Bar
White bg, gray-200 top border. Selection count (xs, gray-400) + divider + primary buttons + outline button + ghost button. Hierarchy via fill weight.

---

## Disparos — New Patterns (2026-03-24)

### Wizard Pattern
- Full-page takeover: sidebar stays visible, `#mainArea` innerHTML replaced with wizard
- Sticky header: back link (left) + title (center) + step indicator (right)
- Step dots: 24px circle, done=purple-600 filled, active=purple-600 outline, pending=gray-300
- Step connectors: 32px line, gray-200 pending → purple-300 done
- Sticky footer: step counter (left) + ghost Voltar + primary/success Avançar/Confirm (right)
- Max content width: 720px centered in `.wizard-body`
- Confirm button: green-600 on final step, primary on intermediate steps

### Summary Card (Two-Group)
- Single card (white, gray-200 border, radius-lg, shadow-xs), two groups side-by-side
- Groups separated by a 1px gray-200 vertical divider (via border-left on second group)
- Group label: text-xs, 600, gray-400, uppercase, .05em tracking
- Metric value: text-xl, 700, tabular-nums, gray-900 (default), green-600 or purple-600 for accented metrics
- No dividers between metrics within the same group (flex row with gap)

### Confirmation Dialog (Modal)
- Overlay: rgba(0,0,0,.35), fixed inset, centered flex, z-index 1000
- Modal: white, radius-xl (16px), shadow-lg, max-width 400px, padding sp-6
- Entry animation: fadeIn overlay (.15s) + slideUp modal (.2s cubic-bezier(.16,1,.3,1), translateY 8px→0)
- Clicking outside overlay closes modal
- Actions row: justify flex-end, gap sp-2 — ghost "keep/cancel action" left + btn-danger "confirm" right

---

## Component Library — prd-design-components (Extracted 2026-03-24)

Stack: React + TypeScript + Tailwind CSS v4 (`@theme`), shadcn/ui, CVA, Radix UI, Lucide icons.

### Button
- Base: `rounded-md text-sm font-medium gap-1.5 disabled:opacity-45`
- Sizes: default `h-10 px-4`, sm `h-8 px-3`, lg `h-11 px-6`, icon `size-9 rounded-full`, icon-square `size-9 rounded-xl`
- Variants: default (primary bg white text), destructive (danger bg), outline (border+bg-white), secondary (white bg neutral text), ghost (transparent hover:bg-accent), link (underline)

### Card
- `rounded-lg border border-neutral-200 bg-card shadow-sm hover:border-neutral-300 hover:shadow-md`
- CardHeader: `p-6 gap-3` — CardContent: `p-6 pt-0`
- CardTitle: `text-lg font-heading font-semibold`

### Input / Select trigger
- `h-10 rounded-md border border-neutral-200 bg-white px-3 py-2 text-sm`
- Hover: `border-neutral-300`; Focus: `border-primary ring-2 ring-ring/15`
- Disabled: `bg-neutral-50 opacity-50`; Invalid: `border-danger-500 ring-danger-500/15`

### Badge
- Base: `rounded-full px-2.5 py-0.5 text-xs font-medium`
- 9 variants: default (primary), secondary, destructive, outline, success, warning, danger, info, neutral
- Semantic tints: `bg-{color}-100 text-{color}-700`

### InlineTabs (underline style)
- List: `inline-flex items-center gap-6 border-b border-neutral-200`
- Trigger: `pb-2.5 pt-1 text-sm font-medium text-muted-foreground`
- Active: `text-primary` + `::after` 2px `bg-primary rounded-full` bottom underline
- Use for page-level navigation tabs (like disparos filter tabs)

### Tabs (pill style)
- List: `h-9 bg-muted rounded-md p-1`; Trigger: `px-3 py-1 text-sm font-medium`
- Active: `bg-card shadow-xs rounded-xs`
- Use for contained tab switchers

### Dialog / Modal
- Overlay: `bg-black/40 backdrop-blur-[2px]`
- Content: `max-w-lg rounded-lg border border-neutral-200 bg-card p-6 shadow-xl`
- Title: `text-lg font-heading font-semibold`; Description: `text-sm text-muted-foreground`
- Close button: `size-7 rounded-full text-neutral-400 hover:bg-neutral-100`

### Banner (4 variants)
- Base: `rounded-lg px-5 py-4` with icon slot + title (font-heading semibold) + description + action + close
- `gradient`: `bg-gradient-to-r from-[#2E1F4D] to-[#49317A] text-white`
- `info/success/warning`: `bg-{color}-50 text-{color}-700 border border-current/20`
- Close: `size-7 rounded-full` — gradient: `text-white/70 hover:bg-white/10`; semantic: `hover:bg-black/5`

### Sidebar
- `w-[240px] min-h-screen bg-white border-r border-neutral-200`
- Active nav item: `text-primary font-medium bg-primary-50` + `absolute left-0 w-1 bg-primary rounded-r-full` accent bar
- Section labels: `text-[11px] font-medium text-neutral-400 uppercase tracking-wider`
- Nav items: `px-5 py-2.5 text-sm text-neutral-600`; icons: `w-5 h-5`

### ActionBar (bulk selection)
- `fixed bottom-0 inset-x-0 border-t border-neutral-200 bg-white px-6 py-3 shadow-lg`
- Only renders when `selectedCount > 0`
- Layout: clear-X + "N items selected" (left) + action buttons (ml-auto right)

### StepProgress
- Horizontal segments: `h-1 flex-1 rounded-full` — active: `bg-primary`, inactive: `bg-neutral-200`

### Table
- TableHead: `h-10 px-4 text-left font-medium text-muted-foreground`
- TableCell: `p-4 align-middle`
- TableRow: `border-b border-neutral-100 hover:bg-muted/50`

### Shadows
```
xs: 0 1px 2px rgba(0,0,0,0.03)
sm: 0 1px 3px rgba(0,0,0,0.04), 0 1px 2px rgba(0,0,0,0.02)
md: 0 4px 12px rgba(0,0,0,0.06), 0 1px 3px rgba(0,0,0,0.04)
lg: 0 8px 24px rgba(0,0,0,0.08), 0 2px 6px rgba(0,0,0,0.04)
xl: 0 16px 48px rgba(0,0,0,0.10), 0 4px 12px rgba(0,0,0,0.05)
```

### Radius Scale
sm=4px, md=6px, lg=8px, xl=12px, 2xl=16px, full=9999px
