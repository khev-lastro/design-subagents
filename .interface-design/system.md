# Lais da Imobiliária — Design System

## Direction
Brazilian PropTech CRM for real estate agents (corretores). The AI assistant "Lais" surfaces contextual insights. Feels like a knowledgeable colleague tapping your shoulder — not an alarm system.

## Palette
- **Brand:** Purple 600 `#9333ea` (Lais identity)
- **Surfaces:** White `#fff`, Gray-50 `#f9fafb` (canvas)
- **Borders:** Gray-200 `#e5e7eb` (standard), Gray-100 `#f3f4f6` (soft)
- **Text:** Gray-900 (primary), Gray-700 (secondary), Gray-400 (tertiary)
- **Semantic:** Green-600 (success/sent), Amber-500 (warning/urgent), Red-600 (error), Blue-500 (discovery)

## Depth Strategy
Borders-first. Shadows only on floating elements (cards, popovers, toast). shadow-xs for inline containers, shadow-lg for floating.

## Spacing
4px base grid. Scale: 4, 8, 12, 16, 20, 24, 32, 40, 48.

## Typography
System font stack: -apple-system, Inter, Segoe UI. Scale: 11/13/14/16/20/24px. Hierarchy via weight (400/500/600/700) + tracking, not size alone. Tabular nums for data.

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
