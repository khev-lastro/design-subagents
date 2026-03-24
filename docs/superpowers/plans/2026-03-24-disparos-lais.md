# Disparos Lais — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build `disparos-lais.html` — a mass-messaging screen with a 4-step creation wizard for the Lais CRM, matching the established design system.

**Architecture:** Single self-contained HTML file with embedded CSS and JavaScript, following the exact same pattern as `leads-table-v3.html` and `user-list-paid-seats.html`. No build tools, no framework, no external dependencies. All mock data defined in a JS constant at the top of the script block.

**Tech Stack:** Pure HTML5, CSS custom properties, vanilla JavaScript (ES6+). System font stack. Inline SVG icons.

---

## Reference Files

Before implementing, read these files to internalize the exact patterns to follow:
- `.interface-design/system.md` — design tokens, component patterns
- `leads-table-v3.html` — sidebar, header, table patterns
- `user-list-paid-seats.html` — secondary reference for nav + layout

---

## File Structure

| File | Action | Responsibility |
|------|--------|----------------|
| `disparos-lais.html` | **Create** | Entire feature — CSS variables, sidebar, main screen, wizard, mock data, JS state |

Everything lives in one file. CSS at top in `<style>`, JS at bottom in `<script>`. No external files.

---

## Task 1: File Scaffold + Design Tokens + Sidebar

**Files:**
- Create: `disparos-lais.html`

- [ ] **Step 1: Create the file with document structure, CSS reset, and design tokens**

Copy the exact `:root` token block from `leads-table-v3.html` (lines 27–106). This gives us the full color palette, spacing scale, radius scale, shadow scale, and typography scale. Do not invent new tokens.

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Disparos — Lais da Imobiliária</title>
<style>
  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
  :root {
    /* paste full token block from leads-table-v3.html here */
  }
  body {
    font-family: -apple-system, BlinkMacSystemFont, 'Inter', 'Segoe UI', sans-serif;
    font-size: var(--text-base);
    line-height: var(--leading-normal);
    color: var(--gray-800);
    background: var(--gray-50);
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }
  :focus-visible { outline: 2px solid var(--purple-400); outline-offset: 2px; }
  :focus:not(:focus-visible) { outline: none; }
  .app { display: flex; min-height: 100vh; }
</style>
</head>
<body>
<div class="app">
  <!-- sidebar -->
  <!-- main (placeholder) -->
  <main class="main"><p style="padding:2rem">placeholder</p></main>
</div>
<script>
  // JS goes here
</script>
</body>
</html>
```

- [ ] **Step 2: Add sidebar CSS and HTML**

Copy sidebar CSS from `leads-table-v3.html` (`.sidebar`, `.sidebar-brand`, `.sidebar-nav`, `.nav-label`, `.nav-item`, `.nav-item.active`, `.nav-item.active::before`, `.sidebar-footer`, `.user-profile`, `.user-avatar`, `.user-name`, `.user-role`).

Sidebar HTML structure:
```html
<aside class="sidebar">
  <div class="sidebar-brand">
    <h2>Lais CRM</h2>
    <div class="brand-sub">Imobiliária Central</div>
  </div>
  <nav class="sidebar-nav">
    <div class="nav-label">Principal</div>
    <!-- nav items: Painel, Leads, Contatos, Disparos (active), Imóveis -->
    <!-- each nav-item uses an inline SVG icon, 16×16, stroke="currentColor" stroke-width="1.5" -->
    <div class="nav-label">Sistema</div>
    <!-- Configurações -->
  </nav>
  <div class="sidebar-footer">
    <div class="user-profile">
      <div class="user-avatar">MC</div>
      <div>
        <div class="user-name">Marcos Correia</div>
        <div class="user-role">Corretor Sênior</div>
      </div>
    </div>
  </div>
</aside>
```

Nav SVG icons (stroke-based, 16×16):
- Painel: four small squares
- Leads: person silhouette
- Contatos: three lines (list)
- Disparos: arrow pointing right (→)
- Imóveis: credit card / building
- Configurações: gear/cog

- [ ] **Step 3: Open in browser and verify sidebar renders correctly**

Expected: 240px white sidebar, gray-100 right border, "Disparos" item highlighted purple-50 with purple left accent bar, user avatar at the bottom.

- [ ] **Step 4: Commit**

```bash
git add disparos-lais.html
git commit -m "feat(disparos): scaffold + design tokens + sidebar"
```

---

## Task 2: Main Screen Skeleton + Page Header

**Files:**
- Modify: `disparos-lais.html`

- [ ] **Step 1: Add `.main` CSS**

```css
.main { flex: 1; min-width: 0; display: flex; flex-direction: column; }
.header {
  padding: var(--sp-6) var(--sp-8) var(--sp-4);
  display: flex; align-items: flex-start; justify-content: space-between; gap: var(--sp-4);
}
.header-left h1 {
  font-size: var(--text-2xl); font-weight: 700; color: var(--gray-900);
  letter-spacing: -0.02em; line-height: var(--leading-tight);
}
.header-left p { font-size: var(--text-sm); color: var(--gray-500); margin-top: var(--sp-1); }
```

- [ ] **Step 2: Add page header HTML inside `<main>`**

```html
<main class="main" id="mainArea">
  <div class="header" id="pageHeader">
    <div class="header-left">
      <h1>Disparos</h1>
      <p>Mensagens em massa via WhatsApp</p>
    </div>
  </div>
  <!-- error banner, summary card, table section go here -->
</main>
```

- [ ] **Step 3: Add shared button CSS**

```css
.btn {
  display: inline-flex; align-items: center; gap: var(--sp-2);
  padding: var(--sp-2) var(--sp-4); border-radius: var(--radius-sm);
  font-size: var(--text-sm); font-weight: 600; cursor: pointer;
  transition: all .15s ease; border: 1px solid transparent;
  white-space: nowrap; line-height: var(--leading-tight); min-height: 34px;
}
.btn svg { width: 14px; height: 14px; flex-shrink: 0; }
.btn-ghost { background: var(--white); border-color: var(--gray-200); color: var(--gray-600); font-weight: 500; }
.btn-ghost:hover { background: var(--gray-50); border-color: var(--gray-300); color: var(--gray-700); }
.btn-primary { background: var(--purple-600); color: var(--white); border-color: var(--purple-600); }
.btn-primary:hover { background: var(--purple-700); border-color: var(--purple-700); }
.btn-danger { background: var(--red-600); color: var(--white); border-color: var(--red-600); }
.btn-danger:hover { background: var(--red-700); }
.btn-success { background: var(--green-600); color: var(--white); border-color: var(--green-600); }
.btn-success:hover { background: var(--green-700); }
```

- [ ] **Step 4: Verify in browser**

Expected: sidebar + white background, "Disparos" h1 in the top-left of main area.

- [ ] **Step 5: Commit**

```bash
git add disparos-lais.html
git commit -m "feat(disparos): main area skeleton + page header"
```

---

## Task 3: Error Banner

**Files:**
- Modify: `disparos-lais.html`

- [ ] **Step 1: Add error banner CSS**

Follow the Insight Banner pattern from `.interface-design/system.md`. Key values:
```css
.error-banner {
  margin: var(--sp-6) var(--sp-8) 0;
  background: var(--red-50); border: 1px solid var(--red-100);
  border-left: 3px solid var(--red-500); border-radius: var(--radius-md);
  padding: var(--sp-3) var(--sp-4); display: flex; align-items: center;
  gap: var(--sp-3); box-shadow: var(--shadow-xs);
}
.error-banner-icon {
  width: 28px; height: 28px; border-radius: var(--radius-sm);
  background: var(--red-100); color: var(--red-600);
  display: flex; align-items: center; justify-content: center; flex-shrink: 0;
}
.error-banner-icon svg { width: 14px; height: 14px; }
.error-banner-text { flex: 1; }
.error-banner-title { font-size: var(--text-sm); font-weight: 600; color: var(--red-600); line-height: var(--leading-tight); }
.error-banner-sub { font-size: var(--text-xs); color: var(--red-600); opacity: .75; margin-top: 2px; }
.error-banner-action {
  font-size: var(--text-sm); font-weight: 600; color: var(--red-600);
  cursor: pointer; white-space: nowrap;
  text-decoration: underline; text-underline-offset: 2px;
}
.error-banner-dismiss {
  width: 24px; height: 24px; display: flex; align-items: center; justify-content: center;
  color: var(--red-300); cursor: pointer; border-radius: var(--radius-sm); flex-shrink: 0;
}
.error-banner-dismiss:hover { color: var(--red-500); background: var(--red-100); }
.error-banner-dismiss svg { width: 12px; height: 12px; }
```

- [ ] **Step 2: Add error banner HTML between header and summary card**

```html
<div class="error-banner" id="errorBanner">
  <div class="error-banner-icon">
    <!-- circle with i inside: <circle cx="8" cy="8" r="7"/> <path d="M8 5v3.5M8 11h.01"/> -->
  </div>
  <div class="error-banner-text">
    <div class="error-banner-title">7 disparos com erro de entrega</div>
    <div class="error-banner-sub">Alguns contatos não receberam as mensagens. Verifique os números ou o template utilizado.</div>
  </div>
  <span class="error-banner-action" onclick="switchTab('erro')">Ver disparos com erro</span>
  <div class="error-banner-dismiss" onclick="this.closest('.error-banner').style.display='none'">
    <!-- X icon: <path d="M1 1l10 10M11 1L1 11"/> -->
  </div>
</div>
```

- [ ] **Step 3: Verify in browser**

Expected: red-50 banner below the page header, 3px red left border, dismiss X works, "Ver disparos com erro" link visible.

- [ ] **Step 4: Commit**

```bash
git add disparos-lais.html
git commit -m "feat(disparos): error banner with dismiss + tab link"
```

---

## Task 4: Summary Card

**Files:**
- Modify: `disparos-lais.html`

- [ ] **Step 1: Add summary card CSS**

```css
.summary-section { padding: 0 var(--sp-8) var(--sp-5); }
.summary-card {
  background: var(--white); border: 1px solid var(--gray-200);
  border-radius: var(--radius-lg); padding: var(--sp-5) var(--sp-6);
  box-shadow: var(--shadow-xs); display: flex; align-items: stretch;
}
.summary-group { display: flex; flex-direction: column; gap: var(--sp-3); flex: 1; padding-right: var(--sp-8); }
.summary-group + .summary-group { padding-left: var(--sp-8); padding-right: 0; border-left: 1px solid var(--gray-200); }
.summary-group-label { font-size: var(--text-xs); font-weight: 600; color: var(--gray-400); text-transform: uppercase; letter-spacing: .05em; }
.summary-stats-row { display: flex; gap: var(--sp-8); }
.summary-stat { display: flex; flex-direction: column; gap: 2px; }
.summary-value { font-size: var(--text-xl); font-weight: 700; color: var(--gray-900); font-variant-numeric: tabular-nums; line-height: 1; }
.summary-value.green { color: var(--green-600); }
.summary-value.purple { color: var(--purple-600); }
.summary-sub { font-size: var(--text-xs); color: var(--gray-400); font-weight: 400; margin-top: 2px; }
```

- [ ] **Step 2: Add summary card HTML**

```html
<div class="summary-section">
  <div class="summary-card">
    <div class="summary-group">
      <div class="summary-group-label">Disparos</div>
      <div class="summary-stats-row">
        <div class="summary-stat">
          <div class="summary-value" id="metricAgendados">3</div>
          <div class="summary-sub">agendados</div>
        </div>
        <div class="summary-stat">
          <div class="summary-value green" id="metricEnviados">12</div>
          <div class="summary-sub">enviados este mês</div>
        </div>
      </div>
    </div>
    <div class="summary-group">
      <div class="summary-group-label">Alcance</div>
      <div class="summary-stats-row">
        <div class="summary-stat">
          <div class="summary-value" id="metricContatos">847</div>
          <div class="summary-sub">contatos únicos</div>
        </div>
        <div class="summary-stat">
          <div class="summary-value purple" id="metricTaxa">23%</div>
          <div class="summary-sub">taxa de resposta</div>
        </div>
      </div>
    </div>
  </div>
</div>
```

- [ ] **Step 3: Verify in browser**

Expected: one card spanning full width, "Disparos" and "Alcance" groups separated by a gray vertical line, no divider between the two stats within each group.

- [ ] **Step 4: Commit**

```bash
git add disparos-lais.html
git commit -m "feat(disparos): summary card with two metric groups"
```

---

## Task 5: Mock Data + Tab/Filter State

**Files:**
- Modify: `disparos-lais.html`

This task defines all mock data in JS before building any table UI, so later tasks can reference it.

- [ ] **Step 1: Add mock data constants in the `<script>` block**

```javascript
// ── Mock Data ──────────────────────────────────────────────────
const MOCK_DISPAROS = [
  // STATUS: agendado (3)
  { id: 1, nome: "Reativação Leads Março", template: "Olá {nome}, temos novidades para você…", tipo: "remarketing", objetivo: "Reativar Lead", data: "25 março 2026", hora: "09:00", contatos: 142, status: "agendado" },
  { id: 2, nome: "Captação Zona Sul — Abril", template: "{nome}, seu imóvel precisa de uma atualização…", tipo: "captacao", objetivo: "Recomendar Imóvel", data: "2 abril 2026", hora: "14:00", contatos: 89, status: "agendado" },
  { id: 3, nome: "Follow-up Semana Santa", template: "Aproveitando a data para lembrar das oportunidades…", tipo: "remarketing", objetivo: "Reativar Lead", data: "17 abril 2026", hora: "10:00", contatos: 203, status: "agendado" },
  // STATUS: enviado (12)
  { id: 4, nome: "Lançamento Residencial Pinheiros", template: "{nome}, novo empreendimento na sua região!", tipo: "captacao", objetivo: "Recomendar Imóvel", data: "18 março 2026", hora: "09:00", contatos: 311, status: "enviado" },
  { id: 5, nome: "Reativação Inativos Fevereiro", template: "Faz tempo que não nos falamos, {nome}…", tipo: "remarketing", objetivo: "Reativar Lead", data: "14 março 2026", hora: "10:30", contatos: 78, status: "enviado" },
  { id: 6, nome: "Oportunidade Zona Norte", template: "{nome}, selecionamos imóveis para o seu perfil.", tipo: "captacao", objetivo: "Recomendar Imóvel", data: "10 março 2026", hora: "11:00", contatos: 54, status: "enviado" },
  { id: 7, nome: "Reativação Março Geral", template: "Olá {nome}, veja o que preparamos…", tipo: "remarketing", objetivo: "Reativar Lead", data: "5 março 2026", hora: "09:00", contatos: 190, status: "enviado" },
  { id: 8, nome: "Captação Proprietários Sul", template: "{nome}, avalie seu imóvel gratuitamente.", tipo: "captacao", objetivo: "Recomendar Imóvel", data: "28 fevereiro 2026", hora: "14:00", contatos: 42, status: "enviado" },
  { id: 9, nome: "Newsletter Imóveis Disponíveis", template: "Confira as novidades desta semana, {nome}.", tipo: "captacao", objetivo: "Recomendar Imóvel", data: "21 fevereiro 2026", hora: "09:00", contatos: 215, status: "enviado" },
  { id: 10, nome: "Leads Dormentes Jan", template: "{nome}, temos uma proposta especial para você.", tipo: "remarketing", objetivo: "Reativar Lead", data: "15 fevereiro 2026", hora: "10:00", contatos: 93, status: "enviado" },
  { id: 11, nome: "Campanha Carnaval", template: "{nome}, aproveite este período para visitar…", tipo: "remarketing", objetivo: "Reativar Lead", data: "28 fevereiro 2026", hora: "08:00", contatos: 130, status: "enviado" },
  { id: 12, nome: "Atualização de Listagens", template: "Novos imóveis cadastrados que podem te interessar.", tipo: "captacao", objetivo: "Recomendar Imóvel", data: "7 fevereiro 2026", hora: "14:00", contatos: 67, status: "enviado" },
  { id: 13, nome: "Captação Jardins", template: "{nome}, imóveis premium na região dos Jardins.", tipo: "captacao", objetivo: "Recomendar Imóvel", data: "1 fevereiro 2026", hora: "09:00", contatos: 38, status: "enviado" },
  { id: 14, nome: "Reativação Janeiro", template: "Feliz ano novo, {nome}! Novas oportunidades.", tipo: "remarketing", objetivo: "Reativar Lead", data: "20 janeiro 2026", hora: "10:00", contatos: 144, status: "enviado" },
  { id: 15, nome: "Black Friday Imóveis", template: "{nome}, condições especiais apenas este mês.", tipo: "captacao", objetivo: "Recomendar Imóvel", data: "25 novembro 2025", hora: "09:00", contatos: 290, status: "enviado" },
  // STATUS: erro (7)
  { id: 16, nome: "Disparo Proprietários Lapa", template: "{nome}, atualize as informações do seu imóvel.", tipo: "captacao", objetivo: "Recomendar Imóvel", data: "12 março 2026", hora: "08:00", contatos: 29, status: "erro" },
  { id: 17, nome: "Reativação Contatos Antigos", template: "{nome}, passamos para dar um oi!", tipo: "remarketing", objetivo: "Reativar Lead", data: "8 março 2026", hora: "11:00", contatos: 61, status: "erro" },
  { id: 18, nome: "Atualização Zona Oeste", template: "Seu imóvel na Zona Oeste precisa de…", tipo: "captacao", objetivo: "Recomendar Imóvel", data: "3 março 2026", hora: "09:30", contatos: 14, status: "erro" },
  { id: 19, nome: "Follow-up Leads Frios", template: "{nome}, ainda está procurando um imóvel?", tipo: "remarketing", objetivo: "Reativar Lead", data: "24 fevereiro 2026", hora: "10:00", contatos: 47, status: "erro" },
  { id: 20, nome: "Captação Santana Fev", template: "{nome}, imóveis disponíveis em Santana.", tipo: "captacao", objetivo: "Recomendar Imóvel", data: "18 fevereiro 2026", hora: "14:00", contatos: 33, status: "erro" },
  { id: 21, nome: "Reativação Dezembro 2025", template: "Olá {nome}, ano novo oportunidades novas…", tipo: "remarketing", objetivo: "Reativar Lead", data: "20 dezembro 2025", hora: "09:00", contatos: 88, status: "erro" },
  { id: 22, nome: "Campanha Fim de Ano", template: "{nome}, presentes especiais para encerrar o ano.", tipo: "captacao", objetivo: "Recomendar Imóvel", data: "12 dezembro 2025", hora: "11:00", contatos: 52, status: "erro" },
  // STATUS: cancelado (2)
  { id: 23, nome: "Disparo Teste Segmentação", template: "Teste de template para segmento A.", tipo: "remarketing", objetivo: "Reativar Lead", data: "1 março 2026", hora: "12:00", contatos: 5, status: "cancelado" },
  { id: 24, nome: "Captação Vila Madalena", template: "{nome}, imóveis exclusivos em Vila Madalena.", tipo: "captacao", objetivo: "Recomendar Imóvel", data: "15 março 2026", hora: "09:00", contatos: 71, status: "cancelado" },
];

const MOCK_CONTACTS = [
  { id: 1, nome: "Ana Beatriz Costa", telefone: "(11) 99201-3847", tag: "lead" },
  { id: 2, nome: "Carlos Mendonça", telefone: "(11) 97543-2198", tag: "inativo" },
  { id: 3, nome: "Fernanda Oliveira", telefone: "(11) 98832-5541", tag: "lead" },
  { id: 4, nome: "Roberto Alves", telefone: "(11) 91122-8874", tag: "proprietario" },
  { id: 5, nome: "Juliana Ferreira", telefone: "(11) 99034-6652", tag: "inativo" },
  { id: 6, nome: "Paulo Sousa", telefone: "(11) 98765-4321", tag: "lead" },
  { id: 7, nome: "Mariana Lima", telefone: "(11) 97201-0033", tag: "proprietario" },
  { id: 8, nome: "Thiago Ramos", telefone: "(11) 99901-7766", tag: "inativo" },
  { id: 9, nome: "Camila Pires", telefone: "(11) 98234-5567", tag: "lead" },
  { id: 10, nome: "Diego Nascimento", telefone: "(11) 99100-2244", tag: "inativo" },
  { id: 11, nome: "Letícia Barbosa", telefone: "(11) 97890-3318", tag: "lead" },
  { id: 12, nome: "Renato Cardoso", telefone: "(11) 98011-9922", tag: "proprietario" },
];

const TAG_LABELS = { lead: "Lead", inativo: "Inativo", proprietario: "Proprietário" };

const MOCK_SEGMENTS = [
  { id: 1, nome: "Leads inativos há mais de 60 dias", desc: "Contatos que não interagiram nos últimos 60 dias", contatos: 142 },
  { id: 2, nome: "Proprietários com imóvel desatualizado", desc: "Imóveis sem atualização de preço há mais de 30 dias", contatos: 89 },
  { id: 3, nome: "Leads com interesse em 2–3 quartos", desc: "Baseado em buscas e interações anteriores", contatos: 67 },
  { id: 4, nome: "Todos os leads da Zona Sul", desc: "Contatos com imóvel ou interesse na Zona Sul", contatos: 53 },
  { id: 5, nome: "Leads sem resposta ao último follow-up", desc: "Não responderam ao disparo de fevereiro", contatos: 38 },
];

const MOCK_TEMPLATES = [
  { id: 1, nome: "Reativação — Olá, novidades esperando por você", corpo: "Olá, {nome}! Faz um tempo que não nos falamos. Temos novidades que combinam com o que você busca. Posso te apresentar algumas opções?", aprovado: true, pendente: false, tipo: "Remarketing" },
  { id: 2, nome: "Recomendação de Imóvel — Seleção Personalizada", corpo: "Oi, {nome}! Separei {quantidade} imóveis em {bairro} que combinam com o seu perfil. Quer dar uma olhada?", aprovado: true, pendente: false, tipo: "Captação" },
  { id: 3, nome: "Atualização de Listagem — Proprietário", corpo: "{nome}, as informações do seu imóvel na {endereco} precisam de uma atualização para continuar aparecendo nos resultados. Leva menos de 2 minutos!", aprovado: true, pendente: false, tipo: "Captação" },
  { id: 4, nome: "Oferta Especial — Condições do Mês", corpo: "Oi {nome}! Este mês temos condições especiais de financiamento para imóveis em {regiao}. Quer saber mais?", aprovado: false, pendente: true, tipo: "Remarketing" },
  { id: 5, nome: "Follow-up Personalizado — Template Livre", corpo: "Mensagem totalmente personalizada. Escreva o texto diretamente neste template. Atenção: templates não aprovados pelo Meta podem ter entrega limitada.", aprovado: false, pendente: false, tipo: "Geral" },
];

// ── App state ───────────────────────────────────────────────────
let currentView = 'main'; // 'main' | 'wizard'
let currentTab = 'todos';
let activeFilters = { tipo: null, objetivo: null, data: null };

// wizard state
let wizardStep = 1;
let wizardMode = 'create'; // 'create' | 'edit'
let editingId = null;
let wizardData = {
  nome: '', descricao: '', tipo: 'remarketing', objetivo: 'Reativar Lead',
  data: '', hora: '09:00',
  contactMethod: 'individual',
  selectedContacts: new Set(),
  selectedSegments: new Set(),
  selectedTemplate: null,
};
```

- [ ] **Step 2: Add `getFilteredDisparos()` utility function**

```javascript
function getFilteredDisparos(tab) {
  let rows = [...MOCK_DISPAROS];
  if (tab !== 'todos') rows = rows.filter(d => d.status === tab);
  if (activeFilters.tipo) rows = rows.filter(d => d.tipo === activeFilters.tipo);
  if (activeFilters.objetivo) rows = rows.filter(d => d.objetivo === activeFilters.objetivo);
  return rows;
}
```

- [ ] **Step 3: Verify in browser dev console**

Open browser console and run:
```javascript
console.log(getFilteredDisparos('todos').length); // expected: 24
console.log(getFilteredDisparos('agendado').length); // expected: 3
console.log(getFilteredDisparos('erro').length); // expected: 7
```

- [ ] **Step 4: Commit**

```bash
git add disparos-lais.html
git commit -m "feat(disparos): mock data constants + filter utility"
```

---

## Task 6: Table Section — Header, Filters, Tabs, Table

**Files:**
- Modify: `disparos-lais.html`

- [ ] **Step 1: Add table section CSS**

```css
/* Section */
.table-section { flex: 1; padding: 0 var(--sp-8) var(--sp-8); display: flex; flex-direction: column; }
.table-meta { display: flex; align-items: center; justify-content: space-between; margin-bottom: var(--sp-3); }
.section-title { font-size: var(--text-sm); font-weight: 600; color: var(--gray-700); }
.table-meta-left { display: flex; align-items: center; gap: var(--sp-3); }

/* Filters */
.filters { display: flex; gap: var(--sp-2); align-items: center; flex-wrap: wrap; }
.filter-btn {
  display: inline-flex; align-items: center; gap: 5px;
  background: var(--white); border: 1px solid var(--gray-200);
  border-radius: var(--radius-sm); padding: 5px 10px;
  font-size: var(--text-xs); color: var(--gray-600); cursor: pointer;
  font-weight: 500; transition: all .15s ease; user-select: none;
}
.filter-btn:hover { border-color: var(--gray-300); color: var(--gray-700); background: var(--gray-50); }
.filter-btn svg { width: 11px; height: 11px; }
.filter-btn.active { background: var(--purple-50); border-color: var(--purple-200); color: var(--purple-700); }

/* Tabs + table container */
.tabs-table-wrap {
  background: var(--white); border: 1px solid var(--gray-200);
  border-radius: var(--radius-lg); box-shadow: var(--shadow-xs); overflow: hidden;
}
.tabs-row { display: flex; border-bottom: 1px solid var(--gray-200); background: var(--white); }
.tab {
  padding: 10px var(--sp-4); font-size: var(--text-sm); font-weight: 500;
  color: var(--gray-500); cursor: pointer; border-bottom: 2px solid transparent;
  margin-bottom: -1px; transition: all .15s ease; white-space: nowrap; user-select: none;
}
.tab:hover { color: var(--gray-700); }
.tab.active { color: var(--purple-700); border-bottom-color: var(--purple-600); font-weight: 600; }
.tab-count {
  display: inline-flex; align-items: center; justify-content: center;
  min-width: 18px; height: 18px; border-radius: 999px; padding: 0 5px;
  font-size: 10px; font-weight: 600; margin-left: 5px;
  background: var(--gray-100); color: var(--gray-500);
}
.tab.active .tab-count { background: var(--purple-100); color: var(--purple-700); }

/* Table */
table { width: 100%; border-collapse: collapse; }
thead tr { background: var(--gray-50); }
th {
  padding: var(--sp-3) var(--sp-4); text-align: left;
  font-size: var(--text-xs); font-weight: 500; color: var(--gray-500);
  border-bottom: 1px solid var(--gray-200); white-space: nowrap;
}
td { padding: 11px 16px; border-bottom: 1px solid var(--gray-100); vertical-align: middle; }
tr.row { transition: background .1s ease; }
tr.row:hover { background: var(--purple-50); }
tr.row:last-child td { border-bottom: none; }

/* Cell types */
.disparo-name { font-weight: 600; color: var(--gray-900); font-size: var(--text-sm); line-height: var(--leading-tight); }
.disparo-sub { font-size: var(--text-xs); color: var(--gray-400); margin-top: 2px; }
.type-badge { display: inline-flex; align-items: center; padding: 2px 8px; border-radius: 999px; font-size: var(--text-xs); font-weight: 600; }
.type-badge.remarketing { background: var(--purple-100); color: var(--purple-700); }
.type-badge.captacao { background: var(--amber-50); color: var(--amber-700); border: 1px solid var(--amber-100); }
.status-badge { display: inline-flex; align-items: center; gap: 5px; padding: 2px 8px; border-radius: 999px; font-size: var(--text-xs); font-weight: 600; }
.status-dot { width: 5px; height: 5px; border-radius: 50%; background: currentColor; flex-shrink: 0; }
.status-badge.agendado { background: var(--blue-50); color: var(--blue-600); }
.status-badge.enviado { background: var(--green-50); color: var(--green-600); }
.status-badge.erro { background: var(--red-100); color: var(--red-600); }
.status-badge.cancelado { background: var(--gray-100); color: var(--gray-500); }
.goal-text { font-size: var(--text-xs); color: var(--gray-500); font-weight: 500; }
.date-text { font-size: var(--text-xs); color: var(--gray-600); font-variant-numeric: tabular-nums; }
.date-time { font-size: var(--text-xs); color: var(--gray-400); margin-top: 1px; }
.contacts-count { font-size: var(--text-sm); color: var(--gray-700); font-variant-numeric: tabular-nums; font-weight: 500; }

/* Row actions */
.row-actions { display: flex; gap: var(--sp-1); justify-content: flex-end; opacity: 0; transition: opacity .15s; }
tr.row:hover .row-actions { opacity: 1; }
.action-btn {
  width: 28px; height: 28px; border: 1px solid var(--gray-200); background: var(--white);
  border-radius: var(--radius-sm); display: flex; align-items: center; justify-content: center;
  cursor: pointer; color: var(--gray-400); transition: all .15s ease;
}
.action-btn svg { width: 13px; height: 13px; }
.action-btn:hover { background: var(--purple-50); color: var(--purple-600); border-color: var(--purple-200); }
.action-btn.danger:hover { background: var(--red-50); color: var(--red-600); border-color: var(--red-100); }
```

- [ ] **Step 2: Add `renderTableSection()` function to JS**

```javascript
const STATUS_LABELS = { agendado: "Agendado", enviado: "Enviado", erro: "Com Erro", cancelado: "Cancelado" };
const TIPO_LABELS = { remarketing: "Remarketing", captacao: "Captação" };
const TAB_COUNTS = { todos: 24, agendado: 3, enviado: 12, erro: 7, cancelado: 2 };

// SVG icon helpers
const SVG = {
  eye: `<svg viewBox="0 0 14 14" fill="none" stroke="currentColor" stroke-width="1.5"><circle cx="7" cy="7" r="2.5"/><path d="M1 7s2-5 6-5 6 5 6 5-2 5-6 5-6-5-6-5z"/></svg>`,
  edit: `<svg viewBox="0 0 14 14" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M9.5 2.5l2 2-8 8H1.5v-2l8-8z"/></svg>`,
  cancel: `<svg viewBox="0 0 14 14" fill="none" stroke="currentColor" stroke-width="1.5"><circle cx="7" cy="7" r="6"/><path d="M4 4l6 6M10 4L4 10"/></svg>`,
  trash: `<svg viewBox="0 0 14 14" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M2 4h10M5 4V2h4v2M6 7v4M8 7v4M3 4l.8 8h6.4L11 4"/></svg>`,
  plus: `<svg viewBox="0 0 14 14" fill="none" stroke="currentColor" stroke-width="2"><path d="M7 1v12M1 7h12"/></svg>`,
  back: `<svg viewBox="0 0 14 14" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M9 1L3 7l6 6"/></svg>`,
  check: `<svg viewBox="0 0 14 14" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 7l4 5L13 2"/></svg>`,
  forward: `<svg viewBox="0 0 14 14" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M5 1l6 6-6 6"/></svg>`,
  chevronDown: `<svg viewBox="0 0 12 12" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M2 4l4 4 4-4"/></svg>`,
  x: `<svg viewBox="0 0 12 12" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M1 1l10 10M11 1L1 11"/></svg>`,
  xSm: `<svg viewBox="0 0 14 14" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M1 1l12 12M13 1L1 13"/></svg>`,
  info: `<svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5"><circle cx="8" cy="8" r="7"/><path d="M8 5v3.5M8 11h.01"/></svg>`,
  warning: `<svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M8 1L1 14h14L8 1z"/><path d="M8 6v4M8 12h.01"/></svg>`,
  checkCircle: `<svg viewBox="0 0 12 12" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 6l3 4L11 2"/></svg>`,
  clock: `<svg viewBox="0 0 12 12" fill="none" stroke="currentColor" stroke-width="1.5"><circle cx="6" cy="6" r="5"/><path d="M6 3.5v3l2 1.5"/></svg>`,
  filter: `<svg viewBox="0 0 12 12" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M1 3h10M3 6h6M5 9h2"/></svg>`,
};

function rowActionsHtml(disparo) {
  const view = `<div class="action-btn" title="Ver detalhes" onclick="viewDetails(${disparo.id})">${SVG.eye}</div>`;
  const edit = `<div class="action-btn" title="Editar" onclick="editDisparo(${disparo.id})">${SVG.edit}</div>`;
  const cancel = `<div class="action-btn danger" title="Cancelar disparo" onclick="confirmCancel(${disparo.id})">${SVG.cancel}</div>`;
  const trash = `<div class="action-btn danger" title="Excluir" onclick="confirmDelete(${disparo.id})">${SVG.trash}</div>`;
  if (disparo.status === 'agendado') return view + edit + cancel + trash;
  return view + trash;
}

function renderTableRows(tab) {
  const rows = getFilteredDisparos(tab);
  if (rows.length === 0) return `<tr><td colspan="7" style="text-align:center;padding:40px;color:var(--gray-400);font-size:var(--text-sm)">Nenhum disparo encontrado</td></tr>`;
  return rows.map(d => `
    <tr class="row">
      <td>
        <div class="disparo-name">${d.nome}</div>
        <div class="disparo-sub">Template: ${d.template}</div>
      </td>
      <td><span class="type-badge ${d.tipo}">${TIPO_LABELS[d.tipo]}</span></td>
      <td><span class="goal-text">${d.objetivo}</span></td>
      <td>
        <div class="date-text">${d.data}</div>
        <div class="date-time">às ${d.hora}</div>
      </td>
      <td><span class="contacts-count">${d.contatos}</span></td>
      <td><span class="status-badge ${d.status}"><span class="status-dot"></span>${STATUS_LABELS[d.status]}</span></td>
      <td><div class="row-actions">${rowActionsHtml(d)}</div></td>
    </tr>`).join('');
}

function renderTableSection() {
  return `
    <div class="table-section">
      <div class="table-meta">
        <div class="table-meta-left">
          <span class="section-title">Lista de Disparos</span>
          <div class="filters" id="filtersRow">
            <div class="filter-btn" onclick="openFilterDropdown('tipo', this)">
              Tipo ${SVG.chevronDown}
            </div>
            <div class="filter-btn" onclick="openFilterDropdown('objetivo', this)">
              Objetivo ${SVG.chevronDown}
            </div>
            <div class="filter-btn" onclick="openFilterDropdown('data', this)">
              Data ${SVG.chevronDown}
            </div>
          </div>
        </div>
        <button class="btn btn-primary" onclick="openWizard()">
          ${SVG.plus} Novo Disparo
        </button>
      </div>
      <div class="tabs-table-wrap">
        <div class="tabs-row" id="tabsRow">
          ${['todos','agendado','enviado','erro','cancelado'].map(t => {
            const labels = { todos: 'Todos', agendado: 'Agendados', enviado: 'Enviados', erro: 'Com Erro', cancelado: 'Cancelados' };
            return `<div class="tab ${currentTab === t ? 'active' : ''}" onclick="switchTab('${t}')">${labels[t]} <span class="tab-count">${TAB_COUNTS[t]}</span></div>`;
          }).join('')}
        </div>
        <table>
          <thead>
            <tr>
              <th>Nome</th><th>Tipo</th><th>Objetivo</th>
              <th>Data agendada</th><th>Contatos</th><th>Status</th>
              <th style="width:116px;"></th>
            </tr>
          </thead>
          <tbody id="tableBody">${renderTableRows(currentTab)}</tbody>
        </table>
      </div>
    </div>`;
}
```

- [ ] **Step 3: Add `switchTab()` and stub action handlers**

```javascript
function switchTab(tab) {
  currentTab = tab;
  // update active tab styling
  document.querySelectorAll('.tab').forEach(el => {
    const t = el.getAttribute('onclick').match(/'(\w+)'/)[1];
    el.classList.toggle('active', t === tab);
  });
  document.getElementById('tableBody').innerHTML = renderTableRows(tab);
  // update error banner action if switching to erro tab
  if (tab === 'erro') {
    document.getElementById('errorBanner') && (document.getElementById('errorBanner').style.display = 'none');
  }
}

function viewDetails(id) { alert('Ver detalhes: disparo #' + id); }
function editDisparo(id) { openWizard('edit', id); }
function openFilterDropdown(type, el) { el.classList.toggle('active'); } // stub — full in Task 8
```

- [ ] **Step 4: Wire `renderTableSection()` into the main render**

Add a `renderMainView()` function and call it on page load:
```javascript
function renderMainView() {
  document.getElementById('mainArea').innerHTML = `
    ${renderErrorBanner()}
    ${renderPageHeader()}
    ${renderSummaryCard()}
    ${renderTableSection()}
  `;
}
```

Where `renderErrorBanner()`, `renderPageHeader()`, `renderSummaryCard()` return the HTML strings for those already-built sections. Wire the page to call `renderMainView()` at the bottom of the script.

Note: At this stage the HTML you added in Tasks 2–4 should be converted to JS-rendered functions so everything is driven from the same render loop. This makes the wizard-swap (Task 7) clean.

- [ ] **Step 5: Open in browser and verify**

Expected:
- All 24 rows visible under "Todos" tab
- Clicking "Agendados" tab shows 3 rows, "Com Erro" shows 7 rows, etc.
- Row actions visible on hover — eye, edit, cancel/trash per status

- [ ] **Step 6: Commit**

```bash
git add disparos-lais.html
git commit -m "feat(disparos): table section with tab switching and row actions"
```

---

## Task 7: Confirmation Dialogs (Cancel + Delete)

**Files:**
- Modify: `disparos-lais.html`

- [ ] **Step 1: Add modal overlay CSS**

```css
.modal-overlay {
  position: fixed; inset: 0; background: rgba(0,0,0,.35);
  display: flex; align-items: center; justify-content: center;
  z-index: 1000; animation: fadeIn .15s ease;
}
@keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }
.modal {
  background: var(--white); border-radius: var(--radius-xl);
  box-shadow: var(--shadow-lg); padding: var(--sp-6);
  width: 100%; max-width: 400px; margin: var(--sp-4);
  animation: slideUp .2s cubic-bezier(.16,1,.3,1);
}
@keyframes slideUp { from { transform: translateY(8px); opacity: 0; } to { transform: translateY(0); opacity: 1; } }
.modal-title { font-size: var(--text-lg); font-weight: 700; color: var(--gray-900); margin-bottom: var(--sp-2); }
.modal-body { font-size: var(--text-sm); color: var(--gray-500); line-height: var(--leading-normal); margin-bottom: var(--sp-6); }
.modal-actions { display: flex; justify-content: flex-end; gap: var(--sp-2); }
```

- [ ] **Step 2: Add `showModal()`, `closeModal()`, `confirmCancel()`, `confirmDelete()` to JS**

```javascript
function showModal(html) {
  const overlay = document.createElement('div');
  overlay.className = 'modal-overlay';
  overlay.id = 'modalOverlay';
  overlay.innerHTML = `<div class="modal">${html}</div>`;
  overlay.addEventListener('click', e => { if (e.target === overlay) closeModal(); });
  document.body.appendChild(overlay);
}

function closeModal() {
  document.getElementById('modalOverlay')?.remove();
}

function confirmCancel(id) {
  const d = MOCK_DISPAROS.find(x => x.id === id);
  showModal(`
    <div class="modal-title">Cancelar disparo?</div>
    <div class="modal-body">
      O disparo <strong>"${d.nome}"</strong> agendado para ${d.data} às ${d.hora} será cancelado e não poderá ser desfeito.
    </div>
    <div class="modal-actions">
      <button class="btn btn-ghost" onclick="closeModal()">Manter agendado</button>
      <button class="btn btn-danger" onclick="executeCancel(${id})">Sim, cancelar</button>
    </div>
  `);
}

function executeCancel(id) {
  const d = MOCK_DISPAROS.find(x => x.id === id);
  d.status = 'cancelado';
  closeModal();
  renderMainView();
}

function confirmDelete(id) {
  const d = MOCK_DISPAROS.find(x => x.id === id);
  showModal(`
    <div class="modal-title">Excluir disparo?</div>
    <div class="modal-body">
      O registro <strong>"${d.nome}"</strong> será removido permanentemente do histórico.
    </div>
    <div class="modal-actions">
      <button class="btn btn-ghost" onclick="closeModal()">Não excluir</button>
      <button class="btn btn-danger" onclick="executeDelete(${id})">Sim, excluir</button>
    </div>
  `);
}

function executeDelete(id) {
  const idx = MOCK_DISPAROS.findIndex(x => x.id === id);
  MOCK_DISPAROS.splice(idx, 1);
  closeModal();
  renderMainView();
}
```

- [ ] **Step 3: Verify in browser**

- Click Cancel (circle-x icon) on an agendado row → modal appears with disparo name and date
- Click "Manter agendado" → modal closes, row unchanged
- Click "Sim, cancelar" → modal closes, disparo moves to Cancelados tab
- Click trash icon on any row → delete modal appears
- Click "Sim, excluir" → row removed from all tabs

- [ ] **Step 4: Commit**

```bash
git add disparos-lais.html
git commit -m "feat(disparos): cancel + delete confirmation dialogs"
```

---

## Task 8: Wizard Shell — Header, Footer, Step Indicator

**Files:**
- Modify: `disparos-lais.html`

- [ ] **Step 1: Add wizard CSS**

```css
/* Wizard layout */
.wizard-wrap { display: flex; flex-direction: column; flex: 1; min-height: 100vh; }
.wizard-header {
  background: var(--white); border-bottom: 1px solid var(--gray-200);
  padding: var(--sp-5) var(--sp-8);
  display: flex; align-items: center; justify-content: space-between; gap: var(--sp-6);
  position: sticky; top: 0; z-index: 10;
}
.wizard-back { display: flex; align-items: center; gap: var(--sp-2); font-size: var(--text-sm); color: var(--gray-500); cursor: pointer; font-weight: 500; transition: color .15s; }
.wizard-back:hover { color: var(--gray-800); }
.wizard-back svg { width: 14px; height: 14px; }
.wizard-title { font-size: var(--text-base); font-weight: 600; color: var(--gray-900); }

/* Step indicator */
.steps { display: flex; align-items: center; }
.step-item { display: flex; align-items: center; gap: var(--sp-2); }
.step-dot {
  width: 24px; height: 24px; border-radius: 50%;
  display: flex; align-items: center; justify-content: center;
  font-size: var(--text-xs); font-weight: 600; flex-shrink: 0;
  border: 1.5px solid var(--gray-300); color: var(--gray-400);
  background: var(--white); transition: all .2s ease;
}
.step-dot.done { background: var(--purple-600); border-color: var(--purple-600); color: var(--white); }
.step-dot.active { border-color: var(--purple-600); color: var(--purple-700); }
.step-dot svg { width: 10px; height: 10px; }
.step-label { font-size: var(--text-xs); font-weight: 500; color: var(--gray-400); white-space: nowrap; transition: color .2s; }
.step-label.active { color: var(--purple-700); font-weight: 600; }
.step-label.done { color: var(--gray-600); }
.step-connector { width: 32px; height: 1px; background: var(--gray-200); margin: 0 var(--sp-2); flex-shrink: 0; }
.step-connector.done { background: var(--purple-300); }

/* Wizard body + footer */
.wizard-body { flex: 1; overflow-y: auto; padding: var(--sp-8); display: flex; justify-content: center; }
.wizard-content { width: 100%; max-width: 720px; display: flex; flex-direction: column; gap: var(--sp-6); }
.wizard-footer {
  background: var(--white); border-top: 1px solid var(--gray-200);
  padding: var(--sp-4) var(--sp-8);
  display: flex; align-items: center; justify-content: space-between;
  position: sticky; bottom: 0;
}
.footer-step-text { font-size: var(--text-xs); color: var(--gray-400); font-weight: 500; }
.footer-right { display: flex; align-items: center; gap: var(--sp-2); }
```

- [ ] **Step 2: Add `renderWizardShell()` and `renderStepIndicator()` to JS**

```javascript
const STEP_LABELS = ['Informações', 'Contatos', 'Template', 'Revisão'];

function renderStepIndicator() {
  return STEP_LABELS.map((label, i) => {
    const num = i + 1;
    const isDone = num < wizardStep;
    const isActive = num === wizardStep;
    const dotClass = isDone ? 'done' : isActive ? 'active' : '';
    const labelClass = isDone ? 'done' : isActive ? 'active' : '';
    const connector = i > 0 ? `<div class="step-connector ${isDone ? 'done' : ''}"></div>` : '';
    const dotContent = isDone ? SVG.checkCircle : num;
    return `${connector}<div class="step-item"><div class="step-dot ${dotClass}">${dotContent}</div><span class="step-label ${labelClass}">${label}</span></div>`;
  }).join('');
}

function renderWizardShell(stepContent) {
  const isLast = wizardStep === 4;
  const backLabel = wizardMode === 'edit' ? 'Voltar para Disparos' : 'Voltar para Disparos';
  const title = wizardMode === 'edit' ? 'Editar Disparo' : 'Novo Disparo';
  return `
    <div class="wizard-wrap">
      <div class="wizard-header">
        <div class="wizard-back" onclick="closeWizard()">${SVG.back} ${backLabel}</div>
        <div class="wizard-title">${title}</div>
        <div class="steps">${renderStepIndicator()}</div>
      </div>
      <div class="wizard-body">
        <div class="wizard-content">${stepContent}</div>
      </div>
      <div class="wizard-footer">
        <span class="footer-step-text">Passo ${wizardStep} de 4</span>
        <div class="footer-right">
          ${wizardStep > 1 ? `<button class="btn btn-ghost" onclick="wizardPrev()">${SVG.back} Voltar</button>` : ''}
          ${isLast
            ? `<button class="btn btn-success" onclick="wizardConfirm()">${SVG.check} ${wizardMode === 'edit' ? 'Salvar Alterações' : 'Criar Disparo'}</button>`
            : `<button class="btn btn-primary" onclick="wizardNext()">Avançar ${SVG.forward}</button>`
          }
        </div>
      </div>
    </div>`;
}
```

- [ ] **Step 3: Add `openWizard()`, `closeWizard()`, `wizardNext()`, `wizardPrev()` to JS**

```javascript
function openWizard(mode = 'create', id = null) {
  wizardMode = mode;
  editingId = id;
  wizardStep = 1;
  if (mode === 'edit' && id) {
    const d = MOCK_DISPAROS.find(x => x.id === id);
    wizardData = {
      nome: d.nome, descricao: '', tipo: d.tipo, objetivo: d.objetivo,
      data: '', hora: d.hora,
      contactMethod: 'individual',
      selectedContacts: new Set([0, 2, 4]),
      selectedSegments: new Set(),
      selectedTemplate: null,
    };
  } else {
    wizardData = {
      nome: '', descricao: '', tipo: 'remarketing', objetivo: 'Reativar Lead',
      data: '', hora: '09:00',
      contactMethod: 'individual',
      selectedContacts: new Set(),
      selectedSegments: new Set(),
      selectedTemplate: null,
    };
  }
  renderWizardView();
}

function closeWizard() {
  currentView = 'main';
  renderMainView();
}

function renderWizardView() {
  currentView = 'wizard';
  let stepContent = '';
  if (wizardStep === 1) stepContent = renderStep1();
  else if (wizardStep === 2) stepContent = renderStep2();
  else if (wizardStep === 3) stepContent = renderStep3();
  else stepContent = renderStep4();
  document.getElementById('mainArea').innerHTML = renderWizardShell(stepContent);
}

function wizardNext() {
  if (wizardStep < 4) { wizardStep++; renderWizardView(); scrollWizardTop(); }
}
function wizardPrev() {
  if (wizardStep > 1) { wizardStep--; renderWizardView(); scrollWizardTop(); }
}
function scrollWizardTop() {
  document.querySelector('.wizard-body')?.scrollTo(0, 0);
}
function wizardConfirm() {
  if (wizardMode === 'edit') {
    const d = MOCK_DISPAROS.find(x => x.id === editingId);
    if (d) { d.nome = wizardData.nome || d.nome; }
  } else {
    const newId = Math.max(...MOCK_DISPAROS.map(d => d.id)) + 1;
    MOCK_DISPAROS.unshift({
      id: newId,
      nome: wizardData.nome || 'Novo Disparo',
      template: wizardData.selectedTemplate !== null ? MOCK_TEMPLATES[wizardData.selectedTemplate].corpo : '',
      tipo: wizardData.tipo,
      objetivo: wizardData.objetivo,
      data: wizardData.data || '25 março 2026',
      hora: wizardData.hora,
      contatos: [...wizardData.selectedContacts].length || [...wizardData.selectedSegments].reduce((a, i) => a + MOCK_SEGMENTS[i].contatos, 0),
      status: 'agendado',
    });
    TAB_COUNTS.todos++;
    TAB_COUNTS.agendado++;
  }
  closeWizard();
  if (wizardMode === 'create') switchTab('agendado');
}
```

- [ ] **Step 4: Verify in browser**

- Click "Novo Disparo" → wizard header appears, step 1 indicator active (others gray)
- Click "Avançar" → step 2, step 1 dot turns purple filled with checkmark
- Click "Voltar" → back to step 1
- Click "Voltar para Disparos" → returns to main screen
- On step 4, button reads "Criar Disparo" in green

- [ ] **Step 5: Commit**

```bash
git add disparos-lais.html
git commit -m "feat(disparos): wizard shell with step indicator and navigation"
```

---

## Task 9: Wizard Step 1 — Informações

**Files:**
- Modify: `disparos-lais.html`

- [ ] **Step 1: Add form CSS**

```css
/* Form */
.step-heading { margin-bottom: var(--sp-1); }
.step-heading h2 { font-size: var(--text-xl); font-weight: 700; color: var(--gray-900); letter-spacing: var(--tracking-tight); line-height: var(--leading-tight); }
.step-heading p { font-size: var(--text-sm); color: var(--gray-500); margin-top: var(--sp-1); }
.form-card {
  background: var(--white); border: 1px solid var(--gray-200);
  border-radius: var(--radius-lg); padding: var(--sp-6);
  box-shadow: var(--shadow-xs); display: flex; flex-direction: column; gap: var(--sp-5);
}
.form-row { display: grid; grid-template-columns: 1fr 1fr; gap: var(--sp-4); }
.form-field { display: flex; flex-direction: column; gap: var(--sp-1); }
.form-field.full { grid-column: 1 / -1; }
label { font-size: var(--text-xs); font-weight: 600; color: var(--gray-700); text-transform: uppercase; letter-spacing: .04em; display: flex; gap: var(--sp-2); align-items: baseline; }
.field-hint { font-size: var(--text-xs); color: var(--gray-400); font-weight: 400; text-transform: none; letter-spacing: 0; }
input[type=text], input[type=date], input[type=time], textarea, select {
  background: var(--gray-50); border: 1px solid var(--gray-200); border-radius: var(--radius-sm);
  padding: 8px 12px; font-size: var(--text-sm); color: var(--gray-900);
  font-family: inherit; width: 100%; transition: border-color .15s, box-shadow .15s;
}
input:focus, textarea:focus, select:focus {
  outline: none; border-color: var(--purple-400);
  box-shadow: 0 0 0 3px rgba(167,139,250,.12); background: var(--white);
}
textarea { resize: vertical; min-height: 72px; line-height: var(--leading-normal); }
select { cursor: pointer; appearance: none; background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='none' stroke='%239ca3af' stroke-width='1.5' d='M2 4l4 4 4-4'/%3E%3C/svg%3E"); background-repeat: no-repeat; background-position: right 10px center; padding-right: 28px; }
.date-notice {
  display: flex; align-items: center; gap: var(--sp-2);
  background: var(--blue-50); border: 1px solid #bfdbfe;
  border-radius: var(--radius-sm); padding: 7px 10px;
  font-size: var(--text-xs); color: var(--blue-600); margin-top: var(--sp-1);
}
.date-notice svg { width: 12px; height: 12px; flex-shrink: 0; }
```

- [ ] **Step 2: Add `renderStep1()` function**

```javascript
function renderStep1() {
  return `
    <div class="step-heading">
      <h2>Informações do Disparo</h2>
      <p>Dê um nome, defina o objetivo e agende a data de envio.</p>
    </div>
    <div class="form-card">
      <div class="form-row">
        <div class="form-field full">
          <label>Nome do Disparo <span class="field-hint">Visível apenas para você</span></label>
          <input type="text" id="f-nome" value="${wizardData.nome}" placeholder="Ex: Reativação Leads Março 2026"
            oninput="wizardData.nome = this.value">
        </div>
      </div>
      <div class="form-row">
        <div class="form-field full">
          <label>Descrição <span class="field-hint">Opcional — contexto interno</span></label>
          <textarea id="f-desc" placeholder="Ex: Foco em leads que não responderam nos últimos 90 dias…"
            oninput="wizardData.descricao = this.value">${wizardData.descricao}</textarea>
        </div>
      </div>
      <div class="form-row">
        <div class="form-field">
          <label>Tipo de Disparo</label>
          <select id="f-tipo" onchange="wizardData.tipo = this.value">
            <option value="remarketing" ${wizardData.tipo === 'remarketing' ? 'selected' : ''}>Remarketing — reengajamento de leads</option>
            <option value="captacao" ${wizardData.tipo === 'captacao' ? 'selected' : ''}>Captação — atualização para proprietários</option>
          </select>
        </div>
        <div class="form-field">
          <label>Objetivo Principal</label>
          <select id="f-objetivo" onchange="wizardData.objetivo = this.value">
            <option value="Reativar Lead" ${wizardData.objetivo === 'Reativar Lead' ? 'selected' : ''}>Reativar Lead</option>
            <option value="Recomendar Imóvel" ${wizardData.objetivo === 'Recomendar Imóvel' ? 'selected' : ''}>Recomendar Imóvel</option>
          </select>
        </div>
      </div>
      <div class="form-row">
        <div class="form-field">
          <label>Data de Envio</label>
          <input type="date" id="f-data" value="${wizardData.data}"
            min="${getTomorrowDate()}"
            onchange="wizardData.data = formatDatePtBr(this.value)">
          <div class="date-notice">${SVG.info} Disparos só podem ser agendados a partir de amanhã.</div>
        </div>
        <div class="form-field">
          <label>Horário de Envio</label>
          <input type="time" id="f-hora" value="${wizardData.hora}"
            onchange="wizardData.hora = this.value">
        </div>
      </div>
    </div>`;
}

function getTomorrowDate() {
  const d = new Date(); d.setDate(d.getDate() + 1);
  return d.toISOString().split('T')[0];
}

const MONTH_NAMES = ['janeiro','fevereiro','março','abril','maio','junho','julho','agosto','setembro','outubro','novembro','dezembro'];
function formatDatePtBr(iso) {
  if (!iso) return '';
  const [y, m, d] = iso.split('-');
  return `${parseInt(d)} ${MONTH_NAMES[parseInt(m) - 1]} ${y}`;
}
```

- [ ] **Step 3: Verify in browser**

- Open wizard → step 1 form renders with all 6 fields
- Type in Nome field → value persists when navigating back from step 2
- Date picker blocks today and past dates
- Tipo and Objetivo dropdowns show correct options

- [ ] **Step 4: Commit**

```bash
git add disparos-lais.html
git commit -m "feat(disparos): wizard step 1 — informações form"
```

---

## Task 10: Wizard Step 2 — Contact Selection

**Files:**
- Modify: `disparos-lais.html`

- [ ] **Step 1: Add Step 2 CSS**

```css
/* Method chooser */
.method-grid { display: grid; grid-template-columns: 1fr 1fr; gap: var(--sp-3); }
.method-card {
  background: var(--white); border: 1.5px solid var(--gray-200); border-radius: var(--radius-lg);
  padding: var(--sp-5); cursor: pointer; transition: all .15s ease; display: flex; flex-direction: column; gap: var(--sp-3);
}
.method-card:hover { border-color: var(--purple-300); background: var(--purple-50); }
.method-card.selected { border-color: var(--purple-600); background: var(--purple-50); box-shadow: 0 0 0 3px rgba(147,51,234,.08); }
.method-icon { width: 36px; height: 36px; border-radius: var(--radius-md); display: flex; align-items: center; justify-content: center; }
.method-icon svg { width: 18px; height: 18px; }
.method-icon.purple { background: var(--purple-100); color: var(--purple-700); }
.method-icon.amber { background: var(--amber-50); color: var(--amber-700); }
.method-card h3 { font-size: var(--text-sm); font-weight: 700; color: var(--gray-900); }
.method-card p { font-size: var(--text-xs); color: var(--gray-500); line-height: 1.5; }
.method-best { font-size: var(--text-xs); font-weight: 600; color: var(--purple-600); margin-top: var(--sp-1); }

/* Contact table */
.contact-search { display: flex; gap: var(--sp-2); margin-bottom: var(--sp-3); }
.contact-search input { flex: 1; background: var(--white); border: 1px solid var(--gray-200); border-radius: var(--radius-sm); padding: 7px 12px; font-size: var(--text-sm); color: var(--gray-900); font-family: inherit; }
.contact-search input:focus { outline: none; border-color: var(--purple-400); box-shadow: 0 0 0 3px rgba(167,139,250,.12); }
.contact-table-wrap { border: 1px solid var(--gray-200); border-radius: var(--radius-md); overflow: hidden; max-height: 300px; overflow-y: auto; }
.ctable { width: 100%; border-collapse: collapse; font-size: var(--text-sm); }
.ctable thead { position: sticky; top: 0; background: var(--gray-50); z-index: 1; }
.ctable th { padding: 8px 12px; text-align: left; font-size: var(--text-xs); font-weight: 500; color: var(--gray-500); border-bottom: 1px solid var(--gray-200); }
.ctable td { padding: 9px 12px; border-bottom: 1px solid var(--gray-100); vertical-align: middle; }
.ctable tr:last-child td { border-bottom: none; }
.ctable tr.csel td { background: var(--purple-50); }
.ctable tr:hover td { background: var(--purple-50); cursor: pointer; }
.cbx { width: 15px; height: 15px; border: 1.5px solid var(--gray-300); border-radius: 3px; appearance: none; cursor: pointer; background: var(--white); vertical-align: middle; }
.cbx:checked { background: var(--purple-600); border-color: var(--purple-600); background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 16 16' fill='white' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M12.207 4.793a1 1 0 010 1.414l-5 5a1 1 0 01-1.414 0l-2-2a1 1 0 011.414-1.414L6.5 9.086l4.293-4.293a1 1 0 011.414 0z'/%3E%3C/svg%3E"); }
.contact-name-cell { font-weight: 600; color: var(--gray-900); font-size: var(--text-sm); }
.contact-phone-cell { font-size: var(--text-xs); color: var(--gray-400); font-variant-numeric: tabular-nums; }
.tag-pill { display: inline-flex; padding: 1px 7px; border-radius: 999px; font-size: 10px; font-weight: 600; }
.tag-pill.lead { background: var(--purple-100); color: var(--purple-700); }
.tag-pill.inativo { background: var(--amber-50); color: var(--amber-700); }
.tag-pill.proprietario { background: var(--green-50); color: var(--green-700); }

/* Segment rows */
.segment-list { display: flex; flex-direction: column; gap: var(--sp-2); }
.seg-row {
  display: flex; align-items: center; gap: var(--sp-3);
  background: var(--white); border: 1.5px solid var(--gray-200); border-radius: var(--radius-md);
  padding: var(--sp-3) var(--sp-4); cursor: pointer; transition: all .15s;
}
.seg-row:hover { border-color: var(--purple-300); background: var(--purple-50); }
.seg-row.selected { border-color: var(--purple-600); background: var(--purple-50); }
.seg-check { width: 18px; height: 18px; border: 1.5px solid var(--gray-300); border-radius: 4px; flex-shrink: 0; display: flex; align-items: center; justify-content: center; background: var(--white); }
.seg-row.selected .seg-check { background: var(--purple-600); border-color: var(--purple-600); }
.seg-check svg { width: 10px; height: 10px; color: var(--white); display: none; }
.seg-row.selected .seg-check svg { display: block; }
.seg-info { flex: 1; }
.seg-name { font-size: var(--text-sm); font-weight: 600; color: var(--gray-900); }
.seg-desc { font-size: var(--text-xs); color: var(--gray-500); margin-top: 1px; }
.seg-count { font-size: var(--text-sm); font-weight: 700; color: var(--purple-700); font-variant-numeric: tabular-nums; }
.seg-count-sub { font-size: var(--text-xs); color: var(--gray-400); text-align: right; }

/* Selection bar */
.selection-bar {
  display: flex; align-items: center; justify-content: space-between;
  padding: var(--sp-2) var(--sp-3); background: var(--purple-50);
  border: 1px solid var(--purple-200); border-radius: var(--radius-sm);
  margin-top: var(--sp-2); font-size: var(--text-xs); color: var(--purple-700); font-weight: 600;
}
.selection-clear { color: var(--purple-500); cursor: pointer; font-weight: 500; }
.selection-clear:hover { color: var(--purple-700); }
```

- [ ] **Step 2: Add `renderStep2()` with both sub-modes**

```javascript
function renderStep2() {
  const isIndiv = wizardData.contactMethod === 'individual';
  const indivCount = wizardData.selectedContacts.size;
  const segCount = [...wizardData.selectedSegments].reduce((a, i) => a + MOCK_SEGMENTS[i].contatos, 0);
  const segSelected = wizardData.selectedSegments.size;

  const contactRows = MOCK_CONTACTS.map((c, i) => {
    const sel = wizardData.selectedContacts.has(i);
    return `<tr class="${sel ? 'csel' : ''}" onclick="toggleContact(${i})">
      <td style="width:36px;padding-left:12px"><input class="cbx" type="checkbox" ${sel ? 'checked' : ''} onclick="event.stopPropagation();toggleContact(${i})"></td>
      <td><div class="contact-name-cell">${c.nome}</div><div class="contact-phone-cell">${c.telefone}</div></td>
      <td><span class="tag-pill ${c.tag}">${TAG_LABELS[c.tag]}</span></td>
    </tr>`;
  }).join('');

  const segRows = MOCK_SEGMENTS.map((s, i) => {
    const sel = wizardData.selectedSegments.has(i);
    return `<div class="seg-row ${sel ? 'selected' : ''}" onclick="toggleSegment(${i})">
      <div class="seg-check">${SVG.checkCircle}</div>
      <div class="seg-info">
        <div class="seg-name">${s.nome}</div>
        <div class="seg-desc">${s.desc}</div>
      </div>
      <div style="text-align:right">
        <div class="seg-count">${s.contatos}</div>
        <div class="seg-count-sub">contatos</div>
      </div>
    </div>`;
  }).join('');

  const panelHtml = isIndiv ? `
    <div class="contact-search">
      <input type="text" placeholder="Buscar por nome, telefone ou tag…">
      <button class="btn btn-ghost" style="font-size:var(--text-xs)">${SVG.filter} Filtrar</button>
    </div>
    <div class="contact-table-wrap">
      <table class="ctable">
        <thead><tr><th style="width:36px"></th><th>Contato</th><th>Tipo</th></tr></thead>
        <tbody>${contactRows}</tbody>
      </table>
    </div>
    <div class="selection-bar">
      <span>${indivCount} contato${indivCount !== 1 ? 's' : ''} selecionado${indivCount !== 1 ? 's' : ''}</span>
      <span class="selection-clear" onclick="clearContacts()">Limpar seleção</span>
    </div>
  ` : `
    <div class="segment-list">${segRows}</div>
    <div class="selection-bar">
      <span>${segCount} contato${segCount !== 1 ? 's' : ''} em ${segSelected} segmento${segSelected !== 1 ? 's' : ''}</span>
      <span class="selection-clear" onclick="clearSegments()">Limpar seleção</span>
    </div>
  `;

  return `
    <div class="step-heading">
      <h2>Selecionar Contatos</h2>
      <p>Escolha como quer selecionar os destinatários deste disparo.</p>
    </div>
    <div class="method-grid">
      <div class="method-card ${isIndiv ? 'selected' : ''}" onclick="setContactMethod('individual')">
        <div class="method-icon purple">
          <svg viewBox="0 0 18 18" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M9 2a3 3 0 100 6 3 3 0 000-6zM4 16a5 5 0 0110 0"/><circle cx="14" cy="6" r="2"/><path d="M16 13a3 3 0 013 3"/></svg>
        </div>
        <div>
          <h3>Seleção Individual</h3>
          <p>Escolha contatos um a um. Ideal quando você sabe exatamente quem quer atingir.</p>
          <div class="method-best">Melhor para: listas menores, alto controle</div>
        </div>
      </div>
      <div class="method-card ${!isIndiv ? 'selected' : ''}" onclick="setContactMethod('segment')">
        <div class="method-icon amber">
          <svg viewBox="0 0 18 18" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M2 4h14M2 9h10M2 14h7"/><circle cx="15" cy="12" r="3"/><path d="M15 10v2l1.5 1.5"/></svg>
        </div>
        <div>
          <h3>Por Segmento</h3>
          <p>Selecione grupos pré-definidos com base em comportamento ou perfil.</p>
          <div class="method-best">Melhor para: campanhas em escala, listas grandes</div>
        </div>
      </div>
    </div>
    <div class="form-card" style="gap:var(--sp-3)">${panelHtml}</div>`;
}

function setContactMethod(m) { wizardData.contactMethod = m; renderWizardView(); }
function toggleContact(i) {
  if (wizardData.selectedContacts.has(i)) wizardData.selectedContacts.delete(i);
  else wizardData.selectedContacts.add(i);
  renderWizardView();
}
function toggleSegment(i) {
  if (wizardData.selectedSegments.has(i)) wizardData.selectedSegments.delete(i);
  else wizardData.selectedSegments.add(i);
  renderWizardView();
}
function clearContacts() { wizardData.selectedContacts.clear(); renderWizardView(); }
function clearSegments() { wizardData.selectedSegments.clear(); renderWizardView(); }
```

- [ ] **Step 3: Verify in browser**

- Step 2 shows two method cards; clicking one highlights it (purple border + bg)
- Individual mode: table scrolls, checkboxes toggle rows, selection bar count updates live
- Segment mode: segment rows toggle, count in selection bar is sum of selected segment counts
- Switching between modes keeps each mode's selections intact

- [ ] **Step 4: Commit**

```bash
git add disparos-lais.html
git commit -m "feat(disparos): wizard step 2 — individual and segment contact selection"
```

---

## Task 11: Wizard Step 3 — Template Selection

**Files:**
- Modify: `disparos-lais.html`

- [ ] **Step 1: Add template CSS**

```css
.template-list { display: flex; flex-direction: column; gap: var(--sp-3); }
.template-card {
  background: var(--white); border: 1.5px solid var(--gray-200); border-radius: var(--radius-lg);
  padding: var(--sp-4) var(--sp-5); cursor: pointer; transition: all .15s ease;
}
.template-card:hover { border-color: var(--purple-300); }
.template-card.selected { border-color: var(--purple-600); box-shadow: 0 0 0 3px rgba(147,51,234,.08); }
.template-card.warn:hover { border-color: var(--amber-400); }
.template-card.warn.selected { border-color: var(--amber-500); box-shadow: 0 0 0 3px rgba(245,158,11,.08); }
.tpl-header { display: flex; align-items: flex-start; justify-content: space-between; margin-bottom: var(--sp-2); gap: var(--sp-3); }
.tpl-name { font-size: var(--text-sm); font-weight: 700; color: var(--gray-900); }
.tpl-badges { display: flex; gap: var(--sp-1); align-items: center; flex-shrink: 0; }
.badge { display: inline-flex; align-items: center; gap: 4px; padding: 2px 8px; border-radius: 999px; font-size: 10px; font-weight: 600; }
.badge.approved { background: var(--green-100); color: var(--green-700); }
.badge.pending { background: var(--amber-50); color: var(--amber-700); border: 1px solid var(--amber-200); }
.badge.rejected { background: var(--red-100); color: var(--red-600); }
.badge svg { width: 10px; height: 10px; }
.tpl-body {
  font-size: var(--text-sm); color: var(--gray-600); line-height: 1.6;
  background: var(--gray-50); border-radius: var(--radius-sm); padding: var(--sp-3) var(--sp-4);
  border: 1px solid var(--gray-200); margin-bottom: var(--sp-2);
}
.tpl-param { background: var(--purple-100); color: var(--purple-700); border-radius: 4px; padding: 1px 5px; font-size: 11px; font-weight: 600; }
.tpl-type { font-size: 10px; font-weight: 600; padding: 2px 7px; border-radius: 999px; background: var(--gray-100); color: var(--gray-500); }
.warning-box {
  display: flex; gap: var(--sp-3); align-items: flex-start;
  background: var(--amber-50); border: 1px solid var(--amber-200); border-radius: var(--radius-md);
  padding: var(--sp-3) var(--sp-4); margin-top: var(--sp-2);
}
.warning-box svg { width: 14px; height: 14px; color: var(--amber-600); flex-shrink: 0; margin-top: 1px; }
.warning-box p { font-size: var(--text-xs); color: var(--amber-700); line-height: 1.5; }
```

- [ ] **Step 2: Add `renderStep3()` function**

Render parameters in template body as highlighted spans. Replace `{word}` patterns with `<span class="tpl-param">{word}</span>`.

```javascript
function highlightParams(text) {
  return text.replace(/\{(\w+)\}/g, '<span class="tpl-param">{$1}</span>');
}

function renderStep3() {
  const cards = MOCK_TEMPLATES.map((t, i) => {
    const isSelected = wizardData.selectedTemplate === i;
    const isWarn = !t.aprovado;
    let badgeHtml = '';
    if (t.aprovado) {
      badgeHtml = `<span class="badge approved">${SVG.checkCircle} Aprovado pelo Meta</span>`;
    } else if (t.pendente) {
      badgeHtml = `<span class="badge pending">${SVG.clock} Aprovação pendente</span>`;
    } else {
      badgeHtml = `<span class="badge rejected">${SVG.xSm} Sem aprovação</span>`;
    }
    const warnText = t.pendente
      ? 'Este template ainda não foi aprovado pelo Meta e pode ter taxa de entrega reduzida. Recomendamos aguardar a aprovação antes de disparar.'
      : 'Template não aprovado pelo Meta. Mensagens enviadas podem ter entrega altamente limitada e resultar em bloqueio da conta.';
    const warningHtml = isSelected && isWarn ? `
      <div class="warning-box">${SVG.warning}<p>${warnText}</p></div>` : '';
    return `
      <div class="template-card ${isSelected ? 'selected' : ''} ${isWarn ? 'warn' : ''}" onclick="selectTemplate(${i})">
        <div class="tpl-header">
          <div class="tpl-name">${t.nome}</div>
          <div class="tpl-badges">${badgeHtml}</div>
        </div>
        <div class="tpl-body">${highlightParams(t.corpo)}</div>
        <div><span class="tpl-type">${t.tipo}</span></div>
        ${warningHtml}
      </div>`;
  }).join('');

  return `
    <div class="step-heading">
      <h2>Template de Mensagem</h2>
      <p>Templates aprovados pelo Meta garantem entrega via WhatsApp Business API.</p>
    </div>
    <div class="template-list">${cards}</div>`;
}

function selectTemplate(i) { wizardData.selectedTemplate = i; renderWizardView(); }
```

- [ ] **Step 3: Verify in browser**

- Step 3 shows 5 template cards
- Templates 1–3 have green "Aprovado pelo Meta" badge, no warning
- Template 4 (pending): selecting it reveals amber warning box
- Template 5 (rejected): selecting it reveals amber warning box with stronger language
- `{nome}`, `{bairro}` etc. highlighted in purple within the message body

- [ ] **Step 4: Commit**

```bash
git add disparos-lais.html
git commit -m "feat(disparos): wizard step 3 — template selection with approval states"
```

---

## Task 12: Wizard Step 4 — Preview + Confirm

**Files:**
- Modify: `disparos-lais.html`

- [ ] **Step 1: Add Step 4 CSS**

```css
.preview-stack { display: flex; flex-direction: column; gap: var(--sp-4); }
.preview-card { background: var(--white); border: 1px solid var(--gray-200); border-radius: var(--radius-lg); overflow: hidden; box-shadow: var(--shadow-xs); }
.preview-card-header {
  padding: var(--sp-3) var(--sp-5); background: var(--gray-50);
  border-bottom: 1px solid var(--gray-200); font-size: var(--text-xs); font-weight: 600;
  color: var(--gray-500); text-transform: uppercase; letter-spacing: .05em;
  display: flex; align-items: center; justify-content: space-between;
}
.preview-card-body { padding: var(--sp-5); }
.preview-grid { display: grid; grid-template-columns: 1fr 1fr; gap: var(--sp-4); }
.preview-field { display: flex; flex-direction: column; gap: 3px; }
.preview-label { font-size: var(--text-xs); font-weight: 600; color: var(--gray-400); text-transform: uppercase; letter-spacing: .04em; }
.preview-value { font-size: var(--text-sm); color: var(--gray-800); font-weight: 500; }
.contact-chips { display: flex; flex-wrap: wrap; gap: var(--sp-1); }
.chip { display: inline-flex; align-items: center; gap: 5px; background: var(--gray-100); border-radius: 999px; padding: 3px 10px; font-size: var(--text-xs); color: var(--gray-700); font-weight: 500; }
.chip.more { background: var(--purple-50); color: var(--purple-700); border: 1px solid var(--purple-200); }
.wa-preview { background: #e8f5e9; border-radius: var(--radius-lg); padding: var(--sp-4); }
.wa-bubble { background: var(--white); border-radius: 0 12px 12px 12px; padding: var(--sp-3) var(--sp-4); font-size: var(--text-sm); color: var(--gray-800); line-height: 1.6; box-shadow: 0 1px 2px rgba(0,0,0,.06); display: inline-block; max-width: 88%; }
.wa-time { font-size: 10px; color: #888; margin-top: 4px; text-align: right; }
```

- [ ] **Step 2: Add `renderStep4()` function**

```javascript
function renderStep4() {
  const tpl = wizardData.selectedTemplate !== null ? MOCK_TEMPLATES[wizardData.selectedTemplate] : null;
  const isIndiv = wizardData.contactMethod === 'individual';
  const names = isIndiv
    ? [...wizardData.selectedContacts].map(i => MOCK_CONTACTS[i].nome)
    : [...wizardData.selectedSegments].map(i => MOCK_SEGMENTS[i].nome);
  const total = isIndiv
    ? wizardData.selectedContacts.size
    : [...wizardData.selectedSegments].reduce((a, i) => a + MOCK_SEGMENTS[i].contatos, 0);
  const chips = names.slice(0, 5).map(n => `<span class="chip">${n}</span>`).join('');
  const moreChip = total > 5 ? `<span class="chip more">+${total - 5} mais</span>` : '';
  const methodLabel = isIndiv
    ? `${total} contato${total !== 1 ? 's' : ''}`
    : `${total} via ${wizardData.selectedSegments.size} segmento${wizardData.selectedSegments.size !== 1 ? 's' : ''}`;

  const tplBadge = tpl
    ? (tpl.aprovado ? `<span class="badge approved">${SVG.checkCircle} Aprovado pelo Meta</span>` : `<span class="badge pending">Aguardando aprovação</span>`)
    : '';

  return `
    <div class="step-heading">
      <h2>Revisar e Confirmar</h2>
      <p>Confira as informações antes de agendar o disparo.</p>
    </div>
    <div class="preview-stack">
      <div class="preview-card">
        <div class="preview-card-header">Informações do Disparo</div>
        <div class="preview-card-body">
          <div class="preview-grid">
            <div class="preview-field"><div class="preview-label">Nome</div><div class="preview-value">${wizardData.nome || '—'}</div></div>
            <div class="preview-field"><div class="preview-label">Tipo</div><div class="preview-value">${TIPO_LABELS[wizardData.tipo]}</div></div>
            <div class="preview-field"><div class="preview-label">Objetivo</div><div class="preview-value">${wizardData.objetivo}</div></div>
            <div class="preview-field"><div class="preview-label">Data e Hora</div><div class="preview-value">${wizardData.data || '—'} às ${wizardData.hora}</div></div>
          </div>
        </div>
      </div>
      <div class="preview-card">
        <div class="preview-card-header">
          <span>Contatos Selecionados</span>
          <span style="color:var(--purple-700);font-weight:700">${methodLabel}</span>
        </div>
        <div class="preview-card-body">
          <div class="contact-chips">${chips}${moreChip}</div>
        </div>
      </div>
      <div class="preview-card">
        <div class="preview-card-header">
          <span>Template${tpl ? ' — ' + tpl.nome : ''}</span>
          ${tplBadge}
        </div>
        <div class="preview-card-body">
          ${tpl ? `<div class="wa-preview"><div class="wa-bubble">${highlightParams(tpl.corpo)}<div class="wa-time">09:00 ✓✓</div></div></div>` : '<p style="color:var(--gray-400);font-size:var(--text-sm)">Nenhum template selecionado</p>'}
        </div>
      </div>
    </div>`;
}
```

- [ ] **Step 3: Verify in browser (full flow)**

Walk through the full creation flow:
1. Step 1: fill in Nome "Teste POC", choose Remarketing, set date tomorrow
2. Step 2: switch to Individual, check 3 contacts
3. Step 3: pick the first approved template
4. Step 4: verify all 3 cards show correct data; WhatsApp bubble shows highlighted params
5. Click "Criar Disparo" → returns to main screen, Agendados tab active, new disparo at top
6. Verify new entry has correct name, tipo, objetivo, data, contatos count

- [ ] **Step 4: Verify edit flow**

1. From main screen, click edit (pencil) on an agendado row
2. Wizard opens with "Editar Disparo" title and pre-populated nome
3. Navigate all 4 steps, click "Salvar Alterações"
4. Returns to main screen

- [ ] **Step 5: Commit**

```bash
git add disparos-lais.html
git commit -m "feat(disparos): wizard step 4 — preview + confirm, create/edit flow complete"
```

---

## Task 13: Polish + Final Verification

**Files:**
- Modify: `disparos-lais.html`

- [ ] **Step 1: Verify error banner "Ver disparos com erro" link switches to Com Erro tab**

Click the link → tab switches to "Com Erro", table updates to show 7 rows.

- [ ] **Step 2: Verify dismiss on error banner hides it**

Click X → banner disappears, layout shifts cleanly.

- [ ] **Step 3: Verify table empty state**

With active filters that return no results, table shows "Nenhum disparo encontrado" centered.

- [ ] **Step 4: Cross-check design tokens**

Scan for any hardcoded colors (e.g. `#fff`, `#333`) that should be CSS variables. Replace with proper tokens from the `:root` block.

- [ ] **Step 5: Check SVG icons in sidebar are rendering**

All 6 nav items should have visible icons — no broken SVGs (empty squares).

- [ ] **Step 6: Final commit**

```bash
git add disparos-lais.html
git commit -m "feat(disparos): polish — empty states, banner wiring, token audit"
```

---

## Task 14: Update system.md with new patterns

**Files:**
- Modify: `.interface-design/system.md`

- [ ] **Step 1: Append new patterns to system.md**

Add the following patterns documented from this build:

```markdown
### Wizard Pattern
- Full-page takeover (sidebar stays, main area replaced)
- Sticky header: back link (left) + title (center) + step indicator (right)
- Step dots: 24px circle, done=purple-600 filled, active=purple-600 outline, pending=gray-300
- Step connectors: 32px line, gray-200 pending → purple-300 done
- Sticky footer: step counter (left) + nav buttons (right)
- Max content width: 720px centered in wizard-body

### Summary Card (Two-Group)
- Single card, two groups side-by-side separated by a 1px gray-200 vertical divider
- Group label: text-xs, 600, gray-400, uppercase, .05em tracking
- Metric value: text-xl, 700, tabular-nums
- No dividers between metrics within the same group

### Confirmation Dialog
- Modal overlay: rgba(0,0,0,.35), centered flex
- Modal: white, radius-xl (16px), shadow-lg, max-width 400px, padding sp-6
- Slide-up entry animation: 0.2s cubic-bezier(.16,1,.3,1)
- Actions: ghost "cancel" (left) + red primary "confirm" (right)
```

- [ ] **Step 2: Commit**

```bash
git add .interface-design/system.md
git commit -m "docs: add wizard, summary card, and modal patterns to design system"
```
