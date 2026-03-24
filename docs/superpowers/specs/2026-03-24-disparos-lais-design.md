# Disparos — Lais da Imobiliária
**Spec date:** 2026-03-24
**File:** `disparos-lais.html`
**Status:** Approved for implementation

---

## Overview

A mass-messaging screen and creation flow within the Lais CRM, enabling corretores to send WhatsApp messages in bulk — either for **remarketing** (dormant lead re-engagement) or **captação** (property owner listing updates). Built as a single HTML file using the existing design system (`leads-table-v3.html` skeleton, `.interface-design/system.md` tokens).

---

## Screen 1 — Disparos Main Screen

### Layout
Follows the `leads-table-v3` / `user-list-paid-seats` skeleton exactly:
- **Sidebar** (240px, white, gray-100 right border, sticky, height 100vh)
  - Brand name + subtitle
  - Nav items with SVG icons; "Disparos" marked active (purple-50 bg, purple-600 left accent bar)
  - Footer: user avatar + name + role
- **Main area** (flex-1, flex-column)

### Error Banner
Shown when any disparos have delivery errors. Follows the Insight Banner pattern:
- border-left 3px solid red-500, background red-50, border red-100
- Icon (28px rounded-sq, red-100 bg) + title + subtitle + action link + dismiss
- Action link "Ver disparos com erro" switches the tab to "Com Erro"
- Dismissible via X button

### Page Header
- h1 "Disparos" (text-2xl, 700, tracking-tight)
- Subtitle "Mensagens em massa via WhatsApp" (text-sm, gray-500)
- No button in page header — button lives in table section

### Summary Card (single card, two groups)
One card (white, gray-200 border, radius-lg, shadow-xs) with two metric groups separated by a vertical gray-200 divider:

- Group "Disparos": 3 agendados (gray-900) · 12 enviados este mês (green-600)
- Group "Alcance": 847 contatos únicos (gray-900) · 23% taxa de resposta (purple-600)
- No internal dividers between metrics within the same group

### List Section
Header row: section title + filter pills (left) · Novo Disparo button (right, purple-600 primary)

Tabs + Table in one container (white, gray-200 border, radius-lg, shadow-xs):
- Tabs: Todos (24) | Agendados (3) | Enviados (12) | Com Erro (7) | Cancelados (2)
- Active tab: purple-700, border-bottom purple-600
- Clicking tab filters the table; filters (Tipo/Data/Objetivo) apply across all tabs

Table columns: Nome | Tipo | Objetivo | Data agendada | Contatos | Status | Actions
- Date format: "25 março 2026" + sub-line "às 09:00"
- Type badges: remarketing (purple-100/700) · captação (amber-50/700)
- Status badges: Agendado (blue) · Enviado (green) · Com Erro (red) · Cancelado (gray)
- Row actions appear on hover (opacity 0→1): Ver detalhes always; Edit + Cancel for agendado only
- Cancel triggers a confirmation dialog before proceeding

### Mock Database: 24 disparos (3 agendados, 12 enviados, 7 erro, 2 cancelados)

---

## Screen 2 — Create New Disparo (Wizard)

Full-page wizard replacing main content area. Sidebar stays visible.

### Wizard Header
- Back link "Voltar para Disparos" (left)
- Title "Novo Disparo" (center)
- 4-step progress indicator (right): done=purple-600 filled · active=purple-600 outline · pending=gray outline

### Wizard Footer (sticky)
- "Passo X de 4" counter (left)
- Voltar ghost button (hidden on step 1) + Avançar/Criar Disparo button (right)
- Final step: green-600 "Criar Disparo" with checkmark icon

---

### Step 1 — Informações
Form card with fields:
- Nome do Disparo (text, required)
- Descrição (textarea, optional)
- Tipo de Disparo (select: Remarketing · Captação)
- Objetivo Principal (select: Reativar Lead · Recomendar Imóvel)
- Data de Envio (date, min = tomorrow) + blue info notice about same-day restriction
- Horário de Envio (time)

---

### Step 2 — Contatos
Two method-choice cards presented first:
- **Seleção Individual** — pick contacts one-by-one from a searchable table; ideal for small lists
- **Por Segmento** — select pre-defined behavioral segments with contact counts; ideal for scale

Both maintain independent selection state when switching.

Individual mode: search input + scrollable table (name/phone/tag) with checkboxes + selection bar
Segment mode: list of segment rows (name, description, count) with checkboxes + selection bar

---

### Step 3 — Template
Template cards with:
- Name + approval badge
- Message body with {parameter} tokens highlighted (purple-100 bg, purple-700 text)
- Type badge (Remarketing / Captação / Geral)

Approval states:
- Aprovado pelo Meta: green badge, no warning
- Aprovação pendente: amber badge, warning box on select (reduced delivery risk)
- Sem aprovação: red badge, warning box on select (high failure + account block risk)

5 mock templates: 3 approved, 1 pending, 1 unapproved.

---

### Step 4 — Revisão
Three stacked preview cards:
1. Informações do Disparo — 2-col grid (Nome, Tipo, Objetivo, Data e Hora)
2. Contatos Selecionados — count + method in header; first 5 name chips + "+N mais"
3. Template — name + badge in header; WhatsApp-style bubble preview (green bg, white bubble, timestamp)

Confirming creates the disparo → returns to main screen → new disparo appears at top of Agendados tab.

---

## Screen 3 — Edit Scheduled Disparo
Reuses wizard layout, pre-populated. All fields editable. Step 4 shows "Salvar Alterações". Confirmation dialog if template changed.

---

## Confirmation Dialogs
**Cancel disparo:** "Este disparo será cancelado e não poderá ser desfeito." Actions: Manter agendado (ghost) · Sim, cancelar (red)
**Delete from history:** "Este registro será removido permanentemente." Actions: Não excluir (ghost) · Sim, excluir (red)

---

## Design System Compliance
- Palette, spacing (4px grid), radius, depth (borders-first), typography per system.md
- Insight Banner pattern reused for error banner (3px left accent, red semantic)
- Row actions: opacity 0→1 on hover, 28px ghost buttons
- Modals: radius-xl (16px), shadow-lg

---

## Mock Data Summary
- 12 contacts: Lead / Inativo / Proprietário tags, Brazilian names + phones
- 5 segments: behavioral, counts 38–142
- 5 templates: 3 approved, 1 pending, 1 unapproved, all use {parameter} syntax
- 24 disparos: Nov 2025 – Apr 2026, Remarketing + Captação mix
