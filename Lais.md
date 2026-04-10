# Lais — Product & Domain Reference

> Canonical reference for Lais, Casa da Lais, Lastro, and the Brazilian real estate market context.
> Use this when designing features, writing copy, or making product decisions.

---

## Lastro (The Company)

- **Founded**: 2021 by Allan, Pedro, and Jose Thomaz Pereira
- **HQ**: Brazil (Brazilian market only)
- **Type**: PropTech startup (Property + Technology)
- **Funding**: ~US$ 20M total — Seed US$ 5.3M (Canary, QED, 1Sharpe), Series A R$ 85M led by Prosus Ventures (2024-2025)
- **Mission**: Empower real estate companies with AI so they can focus on selling/renting

---

## Lais (The AI Assistant)

### What It Is
An AI-powered pre-attendant for Brazilian real estate brokerages. Operates 24/7 on WhatsApp, handling the first contact with leads: qualifying them, recommending properties, and routing qualified leads to human agents via CRM.

### What It Is NOT
- Not a full CRM (it's a pre-CRM qualification layer)
- Not a chatbot marketplace (each deployment is brokerage-specific)
- Not a lead generation tool (works with existing lead sources)
- Not a property search portal (no customer-facing marketplace)

### Key Metrics
- 2M+ conversations completed across Brazil
- 500+ brokerages deployed
- 60% increase in conversion rates for partners
- 90% customer satisfaction
- 1,000+ agencies generated R$ 12B in VGV with R$ ~1B in commissions

### Core Capabilities
1. **Instant Response**: 15-60 seconds vs. industry average of 3-6 hours
2. **24/7 Coverage**: Weekends, holidays, after hours
3. **Lead Qualification**: Budget, location, property type, timeline, financing status
4. **Property Matching**: Trained on each brokerage's full portfolio (VrSync XML)
5. **CRM Handoff**: Qualified leads auto-registered with full conversation context
6. **Remarketing**: Automated re-engagement campaigns via WhatsApp Business API
7. **Multilingual**: Native PT-BR, supports other languages

---

## Casa da Lais (The Dashboard)

The management dashboard where brokerages monitor, manage, and optimize Lais. Available as web app (casa.lais.ai) and mobile (iOS + Android).

### Core Sections
| Section | Purpose |
|---------|---------|
| **Inicio** | Dashboard overview, key metrics |
| **Conversas** | Real-time conversation tracking, chat history, summaries |
| **Leads** | Lead funnel, status management, CRM sync status |
| **Relatórios** | Performance reports, analytics, VGV tracking |
| **Disparos** | Remarketing campaigns, automated outreach |
| **Minha Lais** | AI configuration, rules, portfolio training |
| **Financeiro** | Billing, plans, boletos, consumption tracking |
| **Acessos** | User management, permissions, seats |

### What Users Do Daily
- Check new qualified leads ready for outreach
- Review Lais conversation summaries (not full transcripts)
- Schedule property visits
- Receive push notifications for hot leads
- Monitor monthly performance
- Check billing/consumption

---

## REA (Real Estate Agency) in Brazil

### Terminology
| Term | Meaning |
|------|---------|
| **REA / Imobiliária** | Real estate brokerage/agency |
| **Corretor** | Individual real estate agent |
| **CRECI** | Conselho Regional de Corretores de Imóveis (mandatory registration body) |
| **VGV** | Valor Geral de Vendas (General Sales Value — total value of properties sold) |

### Regulatory Context
- CRECI registration is **mandatory** for all real estate professionals (working without it is a federal crime)
- Each Brazilian state has its own CRECI office
- Requires completion of a Real Estate Transactions technical course
- Standard commission: 5-6% of sale price
- 30,819+ regulated brokers registered nationally

### Multi-REA Structure
Large brokerages operate multiple REAs (units/branches). In Lais:
- Each REA has its own plan and billing
- A parent company (e.g., "Zeio Imoveis Ltda") may have 3+ REAs (Matriz, Filial Centro, Filial Sul)
- Billing is per-REA but visible at the company level
- Each REA can have different plan tiers

---

## Product Terminology

### Atendimento (Service/Credit)
One service interaction handled by Lais — from initial lead contact through qualification. This is the **billing unit**: plans are measured in atendimentos/month (e.g., "Enterprise 4k" = 4,000 atendimentos/month). Annual plans multiply by 12 for total contract credits.

### Lead Status Flow
```
Novo → Em Conversa → Qualificado → Enviado para CRM → Visita → Fechamento
(New)  (In Conversation) (Qualified)  (Sent to CRM)   (Visit)  (Closing)
```
Additional statuses: **Aguardando** (waiting on financing/availability), **Nao Qualificado** (doesn't fit offerings).

### Lead Sources
1. **Portais**: ZAP Imoveis, Vivareal, Imobiliaria.com
2. **Meta Ads**: Facebook/Instagram "Click to WhatsApp" campaigns
3. **Website**: Property inquiry forms routed to Lais
4. **WhatsApp direto**: Direct messages to brokerage number

### Qualification Criteria
Lais gathers conversationally (not as forms):
- Property type (apartment, house, commercial, land)
- Budget/price range
- Location/neighborhood preferences
- Timeline (immediate, 3-6 months, 1+ year)
- Current housing situation (need to sell first?)
- Financing status (pre-approved, needs financing)
- Must-have features and priorities

### Consumo (Consumption)
Monthly usage tracking against plan limits. Broken down by channel:
- **Atendimento da Lais**: AI-handled conversations
- **Remarketing**: Automated re-engagement campaigns
- **Anuncios Proprietarios**: Owner-generated ad leads

When consumption exceeds the plan limit, additional charges apply (excedente).

---

## Billing Model

### Plans
- **Subscription-based** with tiered plans (Enterprise 0.5k, 2k, 3k, 4k, etc.)
- **Plan name format**: "Enterprise (Xk)" where X = thousands of atendimentos/month
- **Billing cycle**: Monthly or Annual (annual contracts get discounts)
- **Payment method**: Boleto bancario (Brazilian bank slip)
- **Add-ons**: "Lais Adicional" (extra AI features), "Assentos Premium" (premium user seats)

### Boleto Lifecycle
```
Disponivel → (Vencimento) → Pago | Atrasado → Renegociado
(Available)   (Due date)    (Paid) (Overdue)  (Renegotiated)
```

### Cost Composition (per REA)
- Base plan cost (e.g., R$ 9,000/month for Enterprise 4k)
- Lais Adicional (may be included or charged separately)
- Assentos Premium (per-seat pricing)
- Excedente (overage charges when above plan limit)

---

## Integration Ecosystem

- **CRMs**: 40+ supported — CV CRM, Praedium, Rauzee, ImobiBrasil, Neural Broker, etc.
- **Portals**: ZAP Group (ZAP Imoveis, Vivareal), and others
- **Advertising**: Meta Ads (Facebook, Instagram, WhatsApp Lead Ads)
- **Property Data**: VrSync XML standard (compatible with ZAP Group portals)
- **Messaging**: WhatsApp Business API (official channel)

---

## Design Implications

### Who Uses Casa da Lais
- **Gestores (Managers)**: Check billing, monitor team performance, manage plans — desktop-heavy
- **Corretores (Agents)**: Check leads, review conversation summaries — mobile-heavy, between showings
- **Admins**: Manage access, configure Lais behavior, handle billing

### Emotional Context
- **Financeiro page**: Used by gestor (manager), typically monthly. Tone should be professional, calm, trustworthy. Overdue boletos create anxiety — handle with urgency but not alarm.
- **Conversas/Leads**: Used daily by agents. Speed and clarity matter most. Show hot leads immediately.
- **Relatorios**: Used weekly/monthly by managers. Actionable insights over vanity metrics.

### Key Data Visualization Needs
- **Funnel**: Novo → Em Conversa → Qualificado → CRM → Visita → Fechamento
- **Usage/Consumption**: Monthly vs. plan limit, trend over time, channel breakdown
- **VGV**: Total sales value from Lais-sourced deals
- **Channel Attribution**: Which lead sources convert best
- **Agent Performance**: Per-agent close rate from Lais-qualified leads

### Copy Rules
- All UI copy in **PT-BR** (Brazilian Portuguese)
- Use "atendimentos" not "credits" (industry term)
- Use "boleto" not "invoice" (Brazilian payment method)
- Use "REA" or "imobiliaria" not "branch" or "office"
- Lais is always referred to as a colleague, not a bot — "Sugestao da Lais", not "AI suggestion"
