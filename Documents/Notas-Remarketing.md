# Notas de Remarketing & Reengajamento — Lais da Imobiliaria
**Documento de transferencia de conhecimento**
**Ultima atualizacao:** Abril 2026

---

## Indice

1. [Contexto do Projeto](#1-contexto-do-projeto)
2. [Catalogo de Pesquisas Realizadas](#2-catalogo-de-pesquisas-realizadas)
3. [Resultados e Como Influenciaram o Trabalho](#3-resultados-e-como-influenciaram-o-trabalho)
4. [Timeline de Atividades](#4-timeline-de-atividades)
5. [Arquivos de Referencia](#5-arquivos-de-referencia)

---

## 1. Contexto do Projeto

A Lais e uma assistente de IA para imobiliarias brasileiras, operando principalmente via WhatsApp. O produto e desenvolvido pela Lastro (Series A de US$15M, Prosus Ventures, outubro 2025) e ja atendeu mais de 2 milhoes de compradores. A plataforma se organiza em modulos: **Lais Atende** (atendimento automatico de leads), **Lais Reengaja** (reengajamento de leads dormentes via remarketing), **Lais Visita** (agendamento de visitas), e **Casa da Lais** (CRM/dashboard para corretores e gestores).

O foco de pesquisa e design deste projeto foi **remarketing e reengajamento de leads dormentes** — um problema critico no mercado imobiliario brasileiro, onde 60-72% dos leads gerados vao dormir sem nunca serem reengajados sistematicamente. Isso representa 15-20 milhoes de leads dormentes nacionalmente, com um valor latente estimado de R$30-200 bilhoes.

### Equipe e metodo de trabalho

O trabalho foi conduzido por **Khevin Mituti** (Product Designer) com apoio extensivo de agentes de IA Claude (UX Researcher, Trend Analyst, Data Scientist, Competitive Analyst, Customer Success Manager, Product Manager, entre outros). A pesquisa combinou:
- Insights qualitativos de onboardings presenciais e online com clientes
- Pesquisa desk research via agentes de IA com sintese de fontes academicas e de industria
- Analise competitiva de produtos SaaS/PropTech (Salesforce, HubSpot, Linear, Duolingo, Notion, etc.)
- Entrevistas internas com times de Customer Success (Adilson, Babi, Amandinha)
- Prototipagem em HTML/CSS/JS puro (sem framework)

---

## 2. Catalogo de Pesquisas Realizadas

### 2.1 Pesquisas feitas por humanos

| Data | Pesquisa | Responsavel | Metodo | Arquivo |
|------|----------|-------------|--------|---------|
| Ago/2025 | Pesquisa de treinamento do cliente | Joao Miguel Oliveira | Entrevistas com 6 pessoas do time interno | Referenciado em `random-notes-2026.md` |
| Jan/2026 | Analise de metricas de Jornada | Khevin Mituti | Classificacao e revisao de documentos internos | Referenciado em `random-notes-2026.md` |
| 27/Jan/2026 | Onboarding presencial Apriori | Khevin + time | Observacao em campo | `random-notes-2026.md` |
| 29/Jan/2026 | Onboarding online Maxtal | Khevin + time | Observacao remota | `random-notes-2026.md` |
| 3/Fev/2026 | Onboarding presencial Maxtal | Khevin + time (Diego treinou corretores) | Observacao em campo, 50 corretores | `random-notes-2026.md` |
| 23/Fev/2026 | Sessao com CS (Adilson, Babi, Amandinha) | Khevin Mituti | Entrevista semi-estruturada sobre remarketing | `random-notes-2026.md` |

### 2.2 Pesquisas feitas por agentes de IA (Claude)

| Data | Pesquisa | Agentes Utilizados | Foco | Arquivo |
|------|----------|--------------------|------|---------|
| 10/Fev/2026 | Optimal Engagement Windows (2 relatorios) | UX Researcher | Janelas de engajamento, carga cognitiva, micro-momentos, horarios ideais de notificacao | `optimal-engagement-windows-report-2026-02-10.md` + `optimal-engagement-windows-research-report-2026-02-10.md` |
| 10/Fev/2026 | Smart Trigger Suggestions Benchmark | UX Researcher, Competitive Analyst, Data Scientist | 7 estrategias de trigger benchmarkadas (Duolingo, Notion, Slack, Linear etc.), psicologia comportamental, metricas | `smart-trigger-suggestions-report-2026-02-10.md` |
| 11/Fev/2026 | Lais Smart Trigger Synthesis | Agente de Sintese | Aplicacao das 7 estrategias aos 10 topicos do Lais CRM (visitas, remarketing, propostas, etc.) | `lais-smart-trigger-synthesis-report-2026-02-11.md` |
| 12/Fev/2026 | Brazilian PropTech Onboarding | Research Analyst | Pain points de onboarding no mercado imobiliario BR, analise competitiva (Lais, Maya, Morada AI, Realmate), dados demograficos | `brazilian-proptech-onboarding-report-2026-02-12.md` |
| 19/Fev/2026 | AI Smart Suggestions & Notification Trends | Trend Analyst + UX Researcher | Padroes de UI para sugestoes de IA em CRM, design visual, fadiga de notificacao, padroes PropTech | `ai-smart-suggestions-research-report-2026-02-19.md` |
| 23/Fev/2026 | Intelligent Suggestion Notifications (N-01 a N-25) | Compilacao multi-agente | 25 notificacoes inteligentes com triggers, mensagens, regras de negocio, supressao de fadiga | `intelligent-suggestion-notifications-report-2026-02-23.md` |
| 23/Fev/2026 | CSM Strategic Report | Customer Success Manager | Onboarding, retencao, sinais de churn, upsell, health scoring baseado nas 25 notificacoes | `csm-report-2026-02-23.md` |
| 23/Fev/2026 | What's New Best Practices | Research Agent | Padroes de anuncio de features em PropTech B2B (modais, banners, nudges, spotlights) | `whats-new-best-practices-2026-02-23.md` |
| 23/Fev/2026 | Lead Reengagement Opportunities Brazil | Strategic Research | Mercado BR: 60-72% leads dormem, custo de reengajamento 50-70% menor, sequencia multi-canal, LGPD, WhatsApp | `lead-reengagement-brazil-2026-02-23.md` |
| 24/Fev/2026 | Lead Reengagement Rules & Operational Framework | Product/Engineering Spec | Regras operacionais: dormancy brackets, triggers por evento/tempo/CRM, classificacao DORMANT vs LOST, sequencias multi-canal | `lead-reengagement-rules-brazil-2026-02-24.md` |
| 17/Mar/2026 | RE-RFME Scoring Framework | Data Scientist + Product | Framework de scoring de leads (Recency, Frequency, Monetary, Engagement), 7 segmentos, estrategias por segmento, integracao com notificacoes | `re-rfme-scoring-framework-2026-03-17.md` |

---

## 3. Resultados e Como Influenciaram o Trabalho

### 3.1 O problema do remarketing no Brasil (descobertas-chave)

**Escala do problema:**
- 60-72% dos leads gerados no Brasil vao dormir — confirmado por 3 fontes independentes
- 15-20 milhoes de leads dormentes nacionalmente
- Custo de reengajamento e 50-70% menor que aquisicao de novo lead
- Leads reengajados sistematicamente convertem a 8-15% vs <5% sem intervencao
- 80% das vendas imobiliarias fecham apos 5+ touchpoints, mas a maioria dos corretores desiste apos 1-2 tentativas
- Tempo medio de resposta de corretores brasileiros: 8.7 horas (benchmark: 5 minutos)

**Causas raiz da dormencia:**
1. **Friccao economica** — Selic subiu de 10.75% para 14.75%, aumentando parcelas em R$750+, pausando compradores
2. **Falta de infraestrutura** — 59% das imobiliarias usam WhatsApp manual como CRM principal
3. **Mismatch de imoveis** — Preferencias evoluem durante ciclos de 60-240 dias
4. **Confusao LGPD** — Apenas 16% das imobiliarias sao plenamente compatíveis com LGPD

**Canais de comunicacao (hierarquia de eficacia):**
1. WhatsApp: 85-95% taxa de abertura, 35-50% resposta
2. SMS: 97-99% entrega, 10-20% resposta
3. Email: 15-25% abertura, 1-3% resposta
4. Telefone: 5-15% contato, mais alta conversao quando alcancado

### 3.2 Insights de onboardings e sessoes com CS

**Problemas identificados nos onboardings (Maxtal, Apriori, e outros):**
- Corretores confundem Lais com chatbot convencional — esperam personalizar roteiro completo
- Expectativas desalinhadas: acham que Lais atrai leads (funcao de marketing), quando ela qualifica
- XML/CRM/integracao sao conceitos confusos para a maioria dos usuarios
- Empty states das paginas nao dao visibilidade do uso real durante implantacao
- Dialog pos-drawer de remarketing causava confusao (cliente clicou cancelar 2x)
- Tag de "conversa pausada" nao tem destaque suficiente
- Fin (widget de suporte) fica sobre botoes de confirmar

**Sessao com CS (Adilson, Babi, Amandinha — 23/Fev/2026):**
- Remarketing era visto como "reengajamento" — corretores tinham resistencia e resultados baixos
- Problema principal: falta de estrategia sobre QUAIS leads deveriam ser reengajados
- Imobiliarias que fazem bem: afunilam base no CRM, personalizam mensagem, escolhem momento de envio
- Nao existe "inteligencia" para selecionar leads melhores que outros — a Lais deveria preencher esse gap
- Sugestao de FOMO: "As top 10% imobs da Lais estao fazendo isso e tendo resultado..."
- Babi: dar inteligencia sem tracking/relatorios pode ser meia solucao
- Amandinha: comparou com "transferencia recorrente" de banco (automatizar o processo)
- Diferenciar quando sugerir Remarketing vs. Reengajamento (massa vs. individual)
- Notificar imobiliarias quando existem muitos canais sem resposta

### 3.3 Como a pesquisa influenciou o design e produto

**Sistema de 25 notificacoes inteligentes:**
A pesquisa sobre engagement windows, triggers e psicologia comportamental resultou no design de 25 notificacoes (N-01 a N-25), organizadas em 7 grupos:
- **Grupo A** — Pipeline Velocity (N-01 a N-05): lead sem contato, visita sem proximo passo, proposta sem resposta
- **Grupo B** — Reengajamento Dormante (N-06 a N-10): alertas de dormencia 14/30/90 dias, campanhas batch, momentum pos-venda
- **Grupo C** — Gestao de Imoveis (N-11 a N-14): match de imovel novo, estagnacao, demanda alta, completude
- **Grupo D** — Remarketing de Longo Prazo (N-15 a N-19): upgrade 18-24 meses, FGTS, locatario→comprador, valorizacao
- **Grupo E** — Sinais de IA (N-20 a N-22): drop-off em conversa, lead alta prioridade, velocidade do corretor
- **Grupo F** — Campanhas Sazonais (N-23 a N-24): pos-Carnaval, decisao de fim de ano
- **Grupo G** — Qualidade de Dados (N-25): risco LGPD

**4 padroes de UI implementados:**
1. **Insight Banner** — entre header e conteudo, relacionado a view atual
2. **Row Nudge** — badge em linhas especificas de leads/imoveis
3. **Suggestion Card** — cards flutuantes no canto inferior direito
4. **Slide-in Toast** — notificacao temporaria pos-acao

**Codigo de cores de acento:**
- Roxo = IA/Lais
- Amarelo = urgente/tempo-sensivel
- Verde = oportunidade
- Azul = informacao/qualidade de dados

**RE-RFME Scoring Framework:**
Criamos um framework de scoring de leads com 4 dimensoes (Recency, Frequency, Monetary, Engagement), escala 5-25, com 7 segmentos estrategicos:
- Champion (22-25): pronto para fechar, 45-60% chance em 90 dias
- High Potential (18-21): quase la, 28-40%
- Warm Nurture (13-17): aquecendo, 12-20%
- At-Risk (9-12): esfriando, 5-8%
- Dormant Recoverable (6-8): adormecido recuperavel, 3-6%
- Dormant Deep (4-5): adormecido profundo, 1-3%
- Archive Candidate (<4): arquivar, <1%

**Regras de reengajamento por segmento:**
- MCMV: primeiro trigger em 21 dias (risco alto de switching), 2-3x/semana
- Investidores: primeiro trigger em 45 dias, 1x/semana, baseado em eventos economicos
- Mid-market: primeiro trigger em 30 dias, sincronizado com releases do Selic
- Luxo: primeiro trigger em 60 dias, sem automacao total — apenas high-touch humano
- Locatarios: trigger baseado na data de vencimento do aluguel (T-90, T-60, T-30)

**Disparos (tela de mensagens em massa):**
Toda a pesquisa culminou no design e implementacao da tela de **Disparos** — uma interface de criacao e gestao de campanhas de mensagens em massa via WhatsApp, com wizard de 4 etapas:
1. Informacoes (nome, tipo, objetivo, data/hora)
2. Contatos (selecao individual ou por segmento)
3. Template (templates aprovados pelo Meta com tokens de personalizacao)
4. Revisao (preview estilo WhatsApp)

**Estrategia de onboarding de notificacoes (7 dias):**
| Dia | Notificacao | Racional |
|-----|-------------|----------|
| 1 | N-01 (Lead sem contato 2h) | Prova de valor imediata |
| 1 | N-14 (Progresso de imovel, passivo) | Sempre visivel, nao intrusivo |
| 2 | N-11 (Novo imovel = match de leads) | Mostra inteligencia de matching |
| 3 | N-05 (Lead alta intencao) | Sinais comportamentais convergem |
| 4 | N-21 (Lead alta prioridade via Lais Atende) | Critico para receita |
| 5 | N-02 (Visita concluida, sem proximo passo) | Fecha primeiro loop completo |
| 6 | N-03 (2 visitas, nenhuma proposta) | Urgencia de proposta |
| 7 | N-04 (Proposta sem resposta 48h) | Follow-up estruturado |

**Regras de fadiga (transversais):**
- Max 3 triggers por sessao
- Max 1 por hora (usuario ativo)
- Max 5 por dia (todos os canais)
- Cooldown de 2 minutos entre triggers
- Apos 2 dismissals seguidos: pausa de 2h em nao-criticos
- Durante digitacao: nunca disparar

---

## 4. Timeline de Atividades

### Janeiro 2026
| Data | Atividade | Tipo |
|------|-----------|------|
| 23/Jan | Inicio da analise de insights de treinamento do cliente | Pesquisa humana |
| 26/Jan | Ultima atualizacao dos insights de treinamento | Pesquisa humana |
| 27/Jan | Onboarding presencial Apriori | Observacao em campo |
| 29/Jan | Onboarding online Maxtal | Observacao remota |

### Fevereiro 2026
| Data | Atividade | Tipo |
|------|-----------|------|
| 3/Fev | Onboarding presencial Maxtal (50 corretores, treinamento por Diego) | Observacao em campo |
| 10/Fev | Pesquisa: Optimal Engagement Windows (2 relatorios) | Agente IA (UX Researcher) |
| 10/Fev | Pesquisa: Smart Trigger Suggestions Benchmark (7 estrategias) | Agentes IA (UX Researcher, Competitive Analyst, Data Scientist) |
| 11/Fev | Sintese: Aplicacao de triggers aos 10 topicos Lais | Agente IA (Sintese) |
| 12/Fev | Pesquisa: Brazilian PropTech Onboarding Pain Points | Agente IA (Research Analyst) |
| 19/Fev | Pesquisa: AI Smart Suggestions & Notification UX Trends | Agentes IA (Trend Analyst, UX Researcher) |
| 23/Fev | Pesquisa: Lead Reengagement Opportunities Brasil (dados de mercado) | Agente IA (Strategic Research) |
| 23/Fev | Compilacao: 25 Notificacoes Inteligentes (N-01 a N-25) | Multi-agente |
| 23/Fev | Relatorio CSM: Onboarding, retencao, churn, upsell | Agente IA (Customer Success Manager) |
| 23/Fev | Pesquisa: What's New Feature Best Practices | Agente IA (Research) |
| 23/Fev | Sessao com CS: Adilson, Babi, Amandinha (remarketing, reengajamento) | Entrevista humana |
| 24/Fev | Regras operacionais de reengajamento (dormancy brackets, triggers, LGPD) | Agente IA (Product/Engineering) |

### Marco 2026
| Data | Atividade | Tipo |
|------|-----------|------|
| 17/Mar | RE-RFME Scoring Framework v1.0 (4 dimensoes, 7 segmentos) | Agente IA (Data Scientist + Product) |
| 24/Mar | Spec de design: tela de Disparos (mensagens em massa) | Design spec (aprovado) |
| 24/Mar | Plano de implementacao: disparos-lais.html | Plano tecnico |
| 24/Mar–31/Mar | Implementacao iterativa da tela de Disparos (5 commits) | Desenvolvimento |

### Abril 2026
| Data | Atividade | Tipo |
|------|-----------|------|
| 1/Abr | Consolidacao de documentacao e transferencia de conhecimento | Documentacao |

---

## 5. Arquivos de Referencia

Todos os documentos de pesquisa estao na pasta `Documents/`:

### Pesquisa de UX e Engagement
- `optimal-engagement-windows-report-2026-02-10.md` — Janelas de engajamento, carga cognitiva, timing de triggers
- `optimal-engagement-windows-research-report-2026-02-10.md` — Pesquisa complementar sobre engagement windows
- `smart-trigger-suggestions-report-2026-02-10.md` — 7 estrategias de trigger benchmarkadas + psicologia comportamental

### Pesquisa de Produto e Mercado
- `brazilian-proptech-onboarding-report-2026-02-12.md` — Pain points de onboarding, dados de mercado BR (580K-730K corretores, 70K+ imobiliarias, 1232 startups PropTech)
- `ai-smart-suggestions-research-report-2026-02-19.md` — Padroes de UI para sugestoes IA (4 padroes, linguagem visual, controle do usuario)
- `lead-reengagement-brazil-2026-02-23.md` — Oportunidade de reengajamento: mercado de R$30-200B, canais, sequencia multi-canal de 90 dias
- `whats-new-best-practices-2026-02-23.md` — Anuncio de features em PropTech B2B

### Especificacoes de Produto
- `lais-smart-trigger-synthesis-report-2026-02-11.md` — Triggers aplicados aos 10 workflows Lais (visitas, remarketing, leads, propostas, etc.)
- `intelligent-suggestion-notifications-report-2026-02-23.md` — As 25 notificacoes inteligentes (N-01 a N-25) com regras completas
- `lead-reengagement-rules-brazil-2026-02-24.md` — Regras operacionais: dormancy brackets, classificacao DORMANT/LOST/ARCHIVE, triggers por segmento
- `re-rfme-scoring-framework-2026-03-17.md` — Framework de scoring RE-RFME (Recency, Frequency, Monetary, Engagement)

### Estrategia de CS e Operacoes
- `csm-report-2026-02-23.md` — Onboarding de 7 dias, retencao semanas 2-8, 7 sinais de churn, upsell por modulo

### Notas Internas e Insights Qualitativos
- `random-notes-2026.md` — Notas de onboardings (Apriori, Maxtal), sessao com CS, insights de treinamento do cliente, duvidas frequentes, problemas de UX observados em campo

### Design e Implementacao
- `docs/superpowers/specs/2026-03-24-disparos-lais-design.md` — Spec da tela de Disparos
- `docs/superpowers/plans/2026-03-24-disparos-lais.md` — Plano de implementacao tecnico
- `.interface-design/system.md` — Design system (tokens, componentes, padroes)
- `disparos-lais.html` — Prototipo funcional da tela de Disparos

---

## Resumo Executivo para Novos Membros

**O que foi feito:** 12+ pesquisas (desk research + campo) sobre remarketing, reengajamento, engagement, onboarding e scoring de leads no mercado imobiliario brasileiro, seguidas pelo design e implementacao de um sistema de notificacoes inteligentes e uma tela de disparos em massa.

**Descoberta principal:** O mercado imobiliario brasileiro tem 15-20 milhoes de leads dormentes que custaram dinheiro para adquirir mas nunca foram reengajados. Reengajamento sistematico custa 50-70% menos que aquisicao e converte 3-4x mais. O gargalo nao e demanda, e capacidade de execucao.

**O que foi construido:**
1. Sistema de 25 notificacoes inteligentes com triggers, regras de negocio e supressao de fadiga
2. RE-RFME Scoring Framework para classificar e priorizar leads
3. Tela de Disparos para criacao e gestao de campanhas de mensagens em massa via WhatsApp
4. Estrategia de onboarding de 7 dias e retencao de 90 dias baseada nas notificacoes

**Proximos passos sugeridos:**
- Implementar tracking comportamental (clicks, hovers, time-on-task) para alimentar o scoring
- Adicionar indicadores de confianca nas sugestoes da IA (ex: "87% confianca")
- Implementar feedback loops (thumbs up/down + "o que estava errado?")
- Testar sequencia multi-canal de 90 dias com grupo piloto de imobiliarias
- Calibrar dormancy brackets com dados reais do Lais (os thresholds atuais sao baseados em benchmarks de industria)
