# Design System — Casa da Lais

## Direction

**Personality:** Warmth & Approachability (B2B SaaS with human-facing AI assistant)
**Foundation:** Neutral-cool with purple accent
**Depth:** Subtle shadows + hairline borders

**Product context:** Casa da Lais is a B2B REA (Real Estate Agency) SaaS platform powered by an AI called "Lais". The product is in Brazilian Portuguese. Feature announcements must communicate value clearly to real estate agents and brokers.

## Tokens

### Spacing
Base: 4px
Scale: 4, 8, 12, 16, 20, 24, 32, 48

### Colors
```
--purple-600: #7C3AED    /* primary accent, CTAs, "Novo" badge */
--purple-100: #EDE9FE    /* light purple tint, backgrounds */
--purple-50:  #F5F3FF    /* faintest purple */
--foreground: #111827    /* slate-900, primary text */
--secondary:  #6B7280    /* slate-500, secondary text */
--muted:      #9CA3AF    /* slate-400, placeholder/metadata */
--faint:      #E5E7EB    /* slate-200, borders, dividers */
--surface:    #FFFFFF    /* card backgrounds */
--bg:         #F9FAFB    /* page background */
--success:    #10B981    /* green for positive states */
--warning:    #F59E0B    /* amber for warnings */
```

### Radius
Scale: 6px, 8px, 12px, 16px, 999px (pill)
Notifications: 8–12px for containers, 4–6px for tags

### Typography
Font: Inter, system-ui fallback
Scale: 11, 12, 13, 14 (base), 16, 18, 20, 24, 28
Weights: 400 (body), 500 (labels), 600 (headings), 700 (display/emphasis)

### Shadows
```
--shadow-sm:  0 1px 2px rgba(0,0,0,0.06)
--shadow-md:  0 4px 12px rgba(0,0,0,0.08)
--shadow-lg:  0 8px 32px rgba(0,0,0,0.12)
--shadow-purple: 0 4px 16px rgba(124,58,237,0.20)
```

## Patterns

### Tag "Novo" / "New"
- Background: #7C3AED
- Color: white
- Font: 11px, 600
- Padding: 2px 8px
- Radius: 999px (pill)
- Usage: Stamp new features

### Button Primary
- Height: 36px
- Padding: 12px 20px
- Radius: 8px
- Background: #7C3AED
- Color: white
- Font: 14px, 500
- Hover: #6D28D9
- Usage: Primary CTA in notifications ("Entendi", "Ver novidade")

### Button Secondary / Ghost
- Height: 36px
- Padding: 12px 16px
- Radius: 8px
- Border: 1px solid #E5E7EB
- Background: transparent
- Font: 14px, 500
- Usage: Skip / dismiss actions

### Notification Card
- Background: white
- Border: 1px solid #E5E7EB
- Radius: 12px
- Shadow: --shadow-md
- Padding: 20px
- Usage: Feature announcement containers

### Feature Screenshot Preview
- Radius: 8px
- Border: 1px solid #E5E7EB
- Background: #F9FAFB
- Usage: Show product screenshot inside notification

## Existing Notification Patterns (from Figma Explorações section)

1. **whatsnew-drawer** — Right-side slide-in panel. Header: "O que há de novo na Casa da Lais". Lists multiple features by date with screenshot previews. Purple accent. Scrollable.
2. **whatsnew/dialog** — Centered modal. "Novidades na Casa da Lais" title + date. Single feature at a time with large screenshot. Dismiss with X.
3. **tooltip-newfeature** — Purple bubble tooltip anchored to a UI element. CTA: "Entendi". No skip option.
4. **tooltip-newfeature-skippable** — Same but with "Próxima dica" button and "Pronto? Clique aqui para pular" skip link.
5. **header-noticia** — Inline section header row. "Agora você pode ..." + subtitle + date on right + "Novo" pill.
6. **menu-direita-cima** — Top navbar area with purple "🔥 Novidades•" CTA button + bell icon badge.
7. **notification** — Bell icon with badge (small indicator).
8. **whatsnew-popup** — Full page skeleton loader showing app context while What's New loads.

## Decisions

| Decision | Rationale | Date |
|----------|-----------|------|
| Purple as primary accent | Brand color of Lais AI — warm but distinctive | 2026-02-25 |
| Soft shadows over borders-only | Notifications need to float above content, not blend in | 2026-02-25 |
| 8px base radius | Friendly but professional for B2B real estate | 2026-02-25 |
| Screenshot previews in notifications | Show don't tell — agents trust what they can see | 2026-02-25 |
| PT-BR copy | Product is exclusively for Brazilian market | 2026-02-25 |
