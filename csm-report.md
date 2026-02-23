# Customer Success Strategic Report — Lais Intelligent Suggestion Notifications
## Casa da Lais · 25 Notifications System (N-01 through N-25)

**Prepared by:** Customer Success Management
**Date:** February 23, 2026
**Product scope:** Casa da Lais — intelligent notification system covering Groups A through G
**Audience:** CS team, product leadership, growth team

---

## Executive Summary

The 25-notification system in Casa da Lais represents one of the most complete AI-guided workflow companions available in Brazilian PropTech. However, the system's value is only realized if brokers engage with it consistently — and the Brazilian real estate context creates specific adoption risks: commission-driven workflows, variable digital literacy, WhatsApp-native habits, and deep resistance to anything that feels like surveillance rather than support.

This report translates the notification system into concrete CS actions: which notifications to introduce and when, how to build habits that survive the critical 30–90 day window, which broker behaviors signal churn risk, where natural upsell moments live, how to score account health using notification interaction data, and how to structure playbooks and feedback loops that keep the product team aligned with real usage.

The recommendations are organized across seven areas. Each is grounded in specific notification IDs and in the realities of how Brazilian corretores actually work.

---

## Section 1 — Onboarding and Activation

### Which notifications drive broker activation in the first 7 days

The first 7 days are the highest-risk window. Research on Brazilian PropTech onboarding shows SaaS products can lose 75% of new users within week one if the experience does not deliver a clear, personally relevant win. For a commission-based broker, "win" means a tangible step toward a deal — not a feature tour.

The notifications that should be active in days 1 through 7 are those that attach directly to actions the broker is already taking or would take regardless of whether Lais existed. The goal is for the notification to feel like a smart assistant, not like new software demanding new behavior.

**Priority 1 — Day 1 to 2: N-01 (Lead Sem Contato — Janela de 2 Horas)**

This is the single most important activation notification. It fires within 2 hours of lead creation, which means it only triggers if the broker has taken the first meaningful action in Lais: registering a lead. It then connects immediately to the follow-up imperative that every corretor already understands — speed of contact is money. The 3x conversion stat in the message is meaningful in context. Critically, it creates a cause-and-effect experience in the first hours of use: "I added a lead, Lais told me something actionable and specific." That is the "aha moment" that drives 30-day retention.

**Priority 2 — Day 2 to 3: N-11 (Novo Imóvel Coincide com Perfil de Leads)**

If the broker or their agency adds a property in the first days, N-11 fires and shows exactly which of their leads match it. This is a demonstration of Lais's core intelligence that requires zero additional broker action — the broker does something they already do (list a property), and Lais responds with value. For brokers who are skeptical of AI, this notification proves the system is working without asking them to trust it first. The matching algorithm (location + price tolerance + type + bedrooms) is visible to the broker in the data strip, making the intelligence legible rather than opaque.

**Priority 3 — Day 3 to 5: N-05 (Lead em Alta Intenção — Visita Não Agendada)**

Once the broker has at least one active lead with some history in the system, N-05 can fire when behavioral signals converge — portal views, WhatsApp keywords, favorites. For brokers with Lais Atende connected, this notification can fire very early in the relationship. Its green suggestion card format is non-threatening and the data strip (imóveis vistos, último acesso, budget estimado) makes the recommendation feel data-driven rather than arbitrary. For new users, this notification demonstrates that Lais is watching signals they cannot monitor manually.

**Priority 4 — Day 5 to 7: N-02 (Visita Concluída — Sem Próximo Passo)**

By day 5 to 7, if the broker has been active, they have likely completed at least one visit. N-02 fires 4 hours after a visit is marked complete and asks them to create a proposal or book a follow-up. This notification matters for activation because it closes the first full workflow loop: lead creation, contact, visit, next step. A broker who completes this loop in week one has internalized the CRM pipeline logic. Those who do not are at high churn risk.

### What to hold back in days 1 to 7

The following notifications should be suppressed or presented only in read-only mode during the first 7 days, with no action pressure:

- **N-07, N-08, N-09** (dormancy escalations): A new user has no dormant leads yet. Showing these early creates confusion about why the system is alerting on an empty state.
- **N-22** (team performance alert for managers): New manager users should not see team slowdown alerts before they understand baseline patterns. Show it from week 3.
- **N-16, N-23, N-24** (seasonal campaigns): Introduce in context of the actual seasonal window, not during onboarding.
- **N-25** (LGPD data quality): Do not surface this as a blocking alert in week 1. Explain LGPD implications in the onboarding guide; show N-25 only when the broker actually attempts a campaign action.
- **N-15, N-17, N-18, N-19** (long-cycle relationship management): These require 18+ months of data or CRM history the broker has not yet built. Their appearance in week 1 would be confusing or empty.

### Recommended 7-day rollout sequence

| Day | Notification activated | Rationale |
|-----|----------------------|-----------|
| Day 1 | N-01 | Fires on first lead creation; immediate proof of value |
| Day 1 | N-14 (passive, always on) | Progress bar on listings requires no trigger logic; it is always visible and non-intrusive |
| Day 2 | N-11 | Fires on first property addition; shows matching intelligence |
| Day 3 | N-05 | Fires when behavioral signals converge on active leads |
| Day 4 | N-21 | Push-priority notification for high-value leads from Lais Atende; if broker has Atende connected, this is critical |
| Day 5 | N-02 | Fires after first completed visit |
| Day 6 | N-03 | Fires if 2 visits completed without a proposal |
| Day 7 | N-04 | Fires if first proposal has been sent without a 48h response |

**Ground rule:** Enforce the fatigue management rules strictly during onboarding. A maximum of 2 notifications per day in days 1 through 7, even if more triggers qualify. New users have lower cognitive capacity for the system; showing them 5 notifications on day 2 is the fastest path to muting.

### The activation benchmark

Define activation as: broker has (a) created at least one lead, (b) received and interacted with at least one notification, and (c) completed at least one workflow loop (lead to contact, visit to proposal, or proposal to follow-up) within 7 days. Target activation rate: 60%+ of new accounts reach this state by day 7.

---

## Section 2 — Retention and Habit Formation

### Weeks 2 to 8: Building the notification habits that survive

Retention at day 30 and day 90 is driven by whether the broker has internalized Lais as part of their daily workflow rather than as an add-on they check occasionally. Habit formation in this context means the broker opens Lais because they expect something useful to be there, not because a push notification forced them to.

The research on broker behavior is consistent: real estate professionals have highly irregular schedules, operate primarily on mobile, and will abandon any tool that creates friction without delivering a commensurate return. The notifications that build habits are the ones that appear at the exact right moment and create a small, satisfying action-reward loop.

### Week 2 to 3: Extending the pipeline vocabulary

**N-06 (Alerta de Dormência — 14 Dias)** should be introduced here. By now, the broker has at least some leads that have had their first contact but have not progressed. N-06 showing up with "14 dias sem contato" is relevant and specific. The CTA options (Iniciar Lais Reengaja, enviar mensagem manual, adiar 7 dias) respect broker autonomy — they are not being told what to do, they are being reminded of a lead they already know exists. This notification begins to create the dormancy-awareness habit: the broker starts to think of Lais as the system that catches what they miss.

**N-04 (Proposta Enviada — Sem Resposta em 48h)** continues to be relevant for any proposals sent in week 1. The escalation to push notification at 72h is appropriate here; the broker has had two weeks to get comfortable with the UI.

**N-20 (Drop-Off em Conversa da Lais Atende)** should be activated for agencies with Lais Atende connected. The 15-minute drop-off alert creates a near-real-time feedback loop between the AI assistant and the human broker. Brokers who experience this notification and successfully recover a conversation have a strong reinforcing experience: "Lais caught something I would have missed." That is habit-forming.

### Week 3 to 4: Introducing property management intelligence

**N-12 (Imóvel Estagnado — Preço Desatualizado)** and **N-13 (Demanda Alta no Mesmo Imóvel)** are introduced here. By week 3, the broker's property listings have enough history to produce meaningful signals. N-12 is informational and low-pressure; it builds the broker's habit of thinking about their inventory through a Lais lens. N-13 is urgency-based and creates a compelling action moment. Both should be introduced on the same week so the broker sees both the "warning" and the "opportunity" patterns from property notifications.

**N-07 (Lote de Leads Dormentes — Campanha Reengaja)** is introduced at the end of week 3 or start of week 4, when the broker is likely to have accumulated 5+ leads with 21+ days of inactivity. This notification is a significant moment for Lais Reengaja upsell and for habit formation: it moves the broker from thinking about individual leads to thinking about their pipeline as an asset that needs portfolio-level management. The weekly cadence (one card per week, on the broker's least busy day) makes it predictable enough to be trusted rather than surprising.

### Week 4 to 6: The "intelligent advisor" transition

This is the period where the broker either begins to see Lais as their intelligent advisor or starts to dismiss notifications habitually. The critical metric to watch is the dismissal rate. If a broker dismisses 3 or more notifications in any 72-hour window during weeks 4 through 6, it is an early warning signal that requires CS intervention (see Section 3).

For brokers who remain engaged, introduce:

**N-10 (Momentum Pós-Venda — Reengajamento)** for brokers who close their first sale in Lais. The 30-minute post-sale timing is important — it respects the celebration moment while channeling the emotional energy toward the next action. This notification is a masterclass in behavioral design and, when experienced for the first time, tends to be memorable enough to generate organic sharing ("Lais me mandou uma mensagem logo depois que eu fechei o apartamento").

**N-08 (Dormência Crítica — 30 Dias)** for leads that have now reached critical dormancy. The more direct tone compared to N-06 is appropriate here and teaches the broker that Lais escalates its recommendations as time passes — it is not crying wolf; it is tracking real urgency.

**N-21 (Lead de Alta Prioridade Detectado pela Lais)** for all Lais Atende-connected accounts. By weeks 4 through 6, the broker should understand what this notification means and be comfortable taking over from the AI. The push notification format (even when offline) is essential here; this is the notification that most directly translates to immediate revenue.

### Week 6 to 8: Long-cycle intelligence and seasonal awareness

By week 6, the broker has enough context to receive the more sophisticated relationship-management notifications.

**N-17 (Locatário para Potencial Comprador)** and **N-19 (Vendedor para Lead de Compra)** can now appear for any client records that qualify. These are green opportunity notifications that feel genuinely insightful when they fire — the broker did not need to think about this conversion possibility, Lais surfaced it from historical data. Brokers who act on these notifications tend to become strong advocates because it feels like Lais "knew something they didn't."

**N-15 (Comprador Anterior — Janela de Upgrade)** should only appear if the broker has migrated historical client data into Lais and those records include closing dates. This is a good reason for CS to prioritize historical data import in weeks 1 through 4.

**N-22 (Queda de Velocidade de Resposta — Alerta para Gestor)** is introduced to manager-level users in week 6 to 8. By this point, managers have enough personal baseline data for the comparison to be meaningful. Frame this notification in onboarding documentation as a coaching tool, not surveillance.

### 30-day and 90-day retention targets by notification group

| Time window | Key habit being formed | Notifications driving it |
|------------|----------------------|--------------------------|
| Days 1–7 | First complete pipeline loop | N-01, N-02, N-11, N-05 |
| Days 8–14 | Dormancy awareness | N-06, N-04 |
| Days 15–21 | Property portfolio thinking | N-12, N-13, N-14 |
| Days 22–30 | Pipeline portfolio management | N-07, N-08, N-10 |
| Days 31–60 | AI-as-advisor trust | N-20, N-21, N-03 |
| Days 61–90 | Long-cycle relationship management | N-15, N-17, N-18, N-19 |

### The daily habit anchor

Every broker should experience the following pattern at least 3 times in their first 8 weeks: open Lais in the morning, see one notification that is specific to an actual lead or property they know, take the suggested action, see a result within 24 hours. That three-step loop — notification, action, result — is what turns occasional users into daily users.

---

## Section 3 — Churn Risk Signals

### Broker behaviors that indicate early churn risk

In the Brazilian real estate context, churn presents differently than in traditional SaaS. Brokers rarely actively cancel. They drift — they log in less frequently, stop updating leads, and eventually the account becomes a ghost. The notification system generates interaction data that, when monitored, reveals drift before it becomes abandonment.

The following behavioral signals, all visible through or around the notification system, are the CS team's early warning indicators:

**Signal 1: Systematic notification dismissal pattern**

A broker who dismisses 3 or more notifications in a single day, or who has a weekly dismissal rate above 60% for two consecutive weeks, is not finding the notifications relevant or is experiencing notification fatigue. This is distinct from a broker who accepts some and dismisses others; the 60%+ threshold in a sustained pattern indicates systemic disengagement.

Watch particularly for dismissal of N-01 (Lead Sem Contato). This notification fires on the broker's own freshly created leads. If they dismiss it consistently, it suggests they are either entering leads purely for data reporting without intending to work them actively, or they have lost faith in the CRM's guidance.

**Signal 2: N-07 ignored for 3 or more consecutive weeks**

The spec explicitly states that N-07 (Lote de Leads Dormentes) reduced to a biweekly cadence and a "pipeline em risco" alert to the manager after 3 consecutive weeks of the broker ignoring it. This is the clearest diagnostic signal the system produces. A broker who ignores their dormant lead batch week after week has disengaged from the pipeline management function entirely. CS should treat this as an account-level churn signal, not just a usage metric.

**Signal 3: N-09 archiving activity spike**

N-09 (Sugestão de Arquivamento — 90 Dias) fires once per lead and is not repeated. If a broker receives multiple N-09 suggestions in the same week and chooses to archive all of them (rather than sending a final message), it indicates that the broker's pipeline has been largely inactive for 90+ days and they are not fighting for leads. This is a sign of either extreme workload problems or disengagement from the platform.

**Signal 4: N-21 not being acted upon within the 2-minute window**

N-21 (Lead de Alta Prioridade Detectado pela Lais) is a push notification with critical urgency — the broker's AI assistant has flagged a high-value lead mentioning "compra à vista" or similar intent signals. If this notification consistently goes unresponded-to (no "assumir atendimento" action within 15 minutes), either the broker has muted push notifications entirely, is not present in the system during working hours, or has lost trust in the Lais Atende handoff quality. All three scenarios require CS attention.

**Signal 5: N-22 flagging a manager whose broker team also shows low engagement**

When N-22 fires for a manager indicating a broker's response time has dropped 30%+ from baseline, and that same broker's notification interaction rate is also declining, the two signals together indicate a team-level problem rather than an individual performance variation. CS should contact the manager account, not just the individual broker.

**Signal 6: Login data combined with notification silence**

A broker who logs in but generates no notification triggers — meaning no new leads, no visits, no proposals, no property updates — for 7 or more consecutive business days is using the system only as a read-only dashboard, which is not sustainable engagement. Cross-reference this with notification interaction rate: if a broker is logging in but not taking any actions that would trigger notifications, they have moved to passive browsing mode. This typically precedes cancellation by 2 to 4 weeks.

**Signal 7: Repeated use of "adiar" options on N-04 and N-06**

N-04 allows "adiar 24h" and N-06 allows "adiar 7 dias" with a maximum of 3 uses before the system suggests archiving. A broker who consistently uses the maximum delay on these notifications is aware of the alerts but is not willing or able to act on them. This is a workload or motivation problem. After 3 snoozes on N-06, the system itself surfaces the archiving suggestion — CS should treat reaching this boundary as a red flag for any lead cohort that represents significant pipeline value.

### Risk segmentation by account type

| Risk level | Signal pattern | CS urgency |
|-----------|---------------|------------|
| Critical | N-21 unacted for 2+ weeks OR N-07 ignored 3+ consecutive weeks | Contact within 24 hours |
| High | Dismissal rate >60% for 2+ weeks OR N-22 fired AND low engagement | Contact within 48 hours |
| Medium | Login with no action triggers for 7+ days OR "adiar" at max for 3+ leads | Check-in within 5 business days |
| Low | N-09 archiving spike OR N-04 repeatedly snoozed on 1 lead only | Note in account health score; monitor |

---

## Section 4 — Upsell and Expansion Opportunities

### Where the notification system creates natural upsell moments

Each Lais module (Atende, Reengaja, Visita) has specific notifications that generate a natural "this works, I want more" moment. The CS team should track these notification events as upsell triggers and be ready to follow up within 24 to 48 hours of the interaction.

**Lais Reengaja — Upsell moments**

| Notification ID | Upsell moment | CS action |
|----------------|--------------|-----------|
| N-06 | Broker sees "iniciar Lais Reengaja" CTA for the first time | Follow up: "Did you use Reengaja? Want to see how it works at scale?" |
| N-07 | Broker has 5+ dormant leads and sees the batch campaign option | Trigger a demo of Reengaja's campaign builder; show recovery rate data |
| N-08 | Broker is at 30-day dormancy critical state for a high-value lead | Frame Reengaja as the tool for leads the broker does not want to lose but cannot currently afford time for |
| N-16 | FGTS window alert fires in June to August | Seasonal hook: "Reengaja tem fluxos específicos para leads com histórico de bloqueio por financiamento" |
| N-23 | Post-Carnaval campaign notification fires | "Você tem N leads elegíveis — quer que a Lais Reengaja faça o primeiro contato automaticamente?" |
| N-24 | November decision-window alert fires | Same hook as N-23 but with closing urgency framing |

The highest-quality Reengaja upsell moment is N-07 when the broker accepts the suggestion and clicks "Ativar Lais Reengaja para todos." If the module is not active, this is the exact moment to offer a trial. The broker is motivated, the problem is defined, and the solution is named on the screen.

**Lais Visita — Upsell moments**

| Notification ID | Upsell moment | CS action |
|----------------|--------------|-----------|
| N-01 | Broker is being nudged to schedule a visit but has no Visita module | Show how Lais Visita handles scheduling, reminders, and rescheduling automatically |
| N-02 | Broker has visits marked as complete but is consistently missing the follow-up step | "Lais Visita pode fazer o follow-up automático após cada visita — quer ver?" |
| N-03 | Broker has 2+ visits and no proposal — a pattern of visit execution without deal progression | Offer a Visita workflow walkthrough; the broker is doing visits but not converting them |
| N-05 | High-intent lead detected; broker does not have Visita for quick scheduling | "Enquanto o interesse está no pico, Lais Visita pode agendar direto no WhatsApp do lead em segundos" |
| N-13 | Multiple leads interested in the same property simultaneously | Visita's scheduling and conflict-avoidance features become immediately relevant |

**Lais Atende — Upsell moments**

| Notification ID | Upsell moment | CS action |
|----------------|--------------|-----------|
| N-20 | Drop-off in Atende conversation detected — for brokers not yet on full Atende | If the broker is on a partial integration, this notification demonstrates what they are already missing |
| N-21 | High-priority lead detected via Atende — broker responds and closes | Post-success: "Esse lead veio pelo Lais Atende. Quer garantir que 100% dos leads de alta intenção sejam capturados assim?" |
| N-05 | High-intent signals from portal views + WhatsApp keywords | Full Atende integration would have captured the keyword signals automatically; use this to show the gap |

**Premium feature upsell: Team management and manager analytics (N-22)**

N-22 is exclusively visible to manager-level users and represents a premium account view. Agencies that are on individual broker plans but have managers reviewing the system should be shown N-22 as a preview of what the team plan enables. The notification creates a natural "I want this for my whole team" moment.

**Data quality and LGPD compliance upsell (N-25)**

N-25 fires when a broker attempts a campaign action but lacks LGPD consent records. This is a natural moment to pitch a data enrichment service or a compliance-as-a-feature upgrade if Lais offers one. At minimum, CS should be aware when N-25 fires at scale for an account — it means the account's data quality is limiting their ability to use the full platform, which creates a value perception problem that needs addressing before renewal.

---

## Section 5 — Customer Health Score

### A notification-interaction-based health score for Casa da Lais accounts

The health score uses notification interaction data as a proxy for genuine CRM engagement. The underlying logic is that a broker who consistently receives, reads, and acts on notifications is a broker who is using the CRM as intended and deriving value from it. A broker who dismisses, ignores, or never encounters notifications is not.

### Scoring model

The score runs from 0 to 100. It is recalculated weekly per broker and averaged at the account level for multi-broker agencies.

**Component 1: Notification accept rate (30 points)**

Accept rate = notifications where broker took the suggested action divided by total notifications delivered in the last 30 days.

- 50%+ accept rate: 30 points
- 35% to 49%: 22 points
- 20% to 34%: 12 points
- Below 20%: 0 points

Note: "Accept" means the broker clicked through to the suggested action — not simply that they opened the notification. Clicking "Agendar via Lais Visita," "Iniciar Lais Reengaja," or "Criar proposta" counts as acceptance.

**Component 2: Critical notification response rate (25 points)**

Critical notifications are defined as the amber-priority group: N-01, N-04, N-08, N-21. These are the notifications tied to highest revenue risk and time sensitivity.

- Responds to 3 or 4 of 4 critical notification types within the expected window: 25 points
- Responds to 2 of 4: 15 points
- Responds to 1 of 4: 8 points
- Responds to 0 of 4: 0 points

**Component 3: Dismissal and snooze rate (20 points, inverse scoring)**

Excessive dismissal is a health signal. Score deductions apply when the broker's dismissal rate is high and snooze limits are being reached.

- Dismissal rate below 25%: 20 points
- 25% to 40%: 14 points
- 40% to 60%: 7 points
- Above 60%, or any notification at snooze limit 3/3: 0 points

**Component 4: Workflow loop completion (15 points)**

A completed loop is defined as: a notification fired, the broker acted on it, and the outcome was registered in the system (visit logged, proposal sent, follow-up completed). The system can track this as a notification-to-outcome conversion.

- 3 or more completed loops in the last 30 days: 15 points
- 1 to 2 completed loops: 8 points
- 0 completed loops: 0 points

**Component 5: Pipeline activity breadth (10 points)**

A healthy broker is generating events across multiple notification groups, not just one. This component rewards breadth of engagement.

- Triggered notifications across 3 or more Groups (A through G) in the last 30 days: 10 points
- Triggered across 2 Groups: 5 points
- Only 1 Group or no notifications triggered: 0 points

### Health thresholds

| Score | Status | CS action |
|-------|--------|-----------|
| 80 to 100 | Healthy | Quarterly check-in; identify advocacy and upsell opportunities |
| 60 to 79 | Stable | Monthly check-in; monitor for trending direction |
| 40 to 59 | At risk | Biweekly contact; review which components are dragging the score |
| Below 40 | Critical | Immediate CS intervention within 48 hours; escalate to save playbook |

### Account-level aggregation

For multi-broker agencies, compute the agency health score as follows:

- Weighted average of all broker scores (weight higher for senior or top-revenue brokers)
- Flag any individual broker score below 40 regardless of agency average
- Flag any agency average below 60 as requiring CS escalation even if individual brokers vary

### What the score does not capture (and why it matters)

The health score measures notification engagement, not business outcomes. A broker could have a high health score and still be churning deals because of non-CRM factors (property market in their segment, personal circumstances, team dynamics). CS should always combine health score data with actual pipeline metrics from the CRM — deals progressing, proposals sent, visits completed — to get a full picture. The score is an early warning system, not a complete account health diagnosis.

---

## Section 6 — CS Team Playbooks

### Top 3 churn risk scenarios and intervention playbooks

The three scenarios below were selected based on their likelihood of occurrence in the Brazilian real estate broker context and the availability of clear intervention leverage through the notification system.

---

### Playbook 1 — "Pipeline Paralysis" (N-07 ignored 3+ consecutive weeks)

**Trigger condition:**

The N-07 card (Lote de Leads Dormentes) has been shown to the broker 3 or more consecutive times on its weekly cadence with no interaction (no click, no "ignorar esta semana" even — the broker simply never acted). The system has flagged "pipeline em risco" to the manager. The broker has 5+ leads in 21+ day dormancy that have not been touched.

**What this pattern means:**

In the Brazilian context, this usually indicates one of three things: the broker is overwhelmed with a specific active deal and has mentally deferred everything else; the broker has lost motivation (commission drought, personal situation); or the broker does not believe Lais Reengaja can help them recover these leads and has implicitly written them off.

**CS action sequence:**

1. Check whether any of the dormant leads have significant pipeline value (above R$500K potential deal value). If yes, escalate urgency.
2. Send a WhatsApp message to the broker (not email — in Brazil, WhatsApp is the professional communication channel) within 24 hours of the third ignored N-07.
3. If no response in 48 hours, call the broker directly. Leads not followed up with in 3 weeks are at real risk of converting with a competitor.
4. If the broker is responsive: offer a 20-minute walk-through of how Lais Reengaja works, using their actual dormant leads as the demo data.
5. If the broker expresses doubt about the dormant leads: validate the feeling, then show the recovery rate data (15 to 20% recovery per the spec) and position a campaign as a low-risk, low-effort experiment.

**Message template (WhatsApp, in Portuguese):**

> Oi [Nome], aqui é [CS Name] da Lais. Vi que você tem alguns leads que estão há mais de 3 semanas sem contato. Eu sei que às vezes o dia a dia engole tudo.
>
> Tenho 20 minutos esta semana para a gente revisar juntos esses leads e eu te mostrar como o Lais Reengaja funciona na prática, usando os leads reais que estão no seu pipeline. Sem compromisso — só quero garantir que você não deixe valor parado.
>
> Qual horário funciona melhor, manhã ou tarde?

---

### Playbook 2 — "AI Handoff Distrust" (N-21 consistently unacted within 15 minutes)

**Trigger condition:**

N-21 (Lead de Alta Prioridade Detectado pela Lais) has fired 3 or more times in the past 30 days. In each case, the broker did not take the "assumir atendimento" action within 15 minutes. The leads were left with the AI assistant. Some may have dropped off. The broker's Lais Atende integration is active but the broker is not treating high-priority handoffs as urgent.

**What this pattern means:**

This is the most critical AI trust problem in the product. The broker may not understand the urgency of the 2-minute detection window. They may not trust that the AI has correctly identified a high-value lead. They may have had a negative experience with an N-21 handoff that turned out to be a low-quality lead (false positive). Or they may have push notifications muted entirely.

**CS action sequence:**

1. Check whether push notifications are enabled for the broker's device. If not, this is a technical fix — help them enable push notifications and explain why N-21 requires them.
2. Review the actual N-21 events: what were the leads? Did they convert? Did they drop off? If they dropped off, calculate the estimated lost deal value to create a concrete cost-of-inaction story.
3. If the broker has had false positive N-21s (the alert fired but the lead turned out to be low value), escalate to the product team to review the confidence scoring for this account's lead segment. This is a product quality issue, not a broker behavior issue.
4. Schedule a 15-minute call to walk through what happens when N-21 fires and why the 2-minute window matters.
5. After the call, send a simple reference card via WhatsApp: what N-21 means, what to do when it fires, and the estimated conversion premium of fast response.

**Message template (WhatsApp, in Portuguese):**

> Oi [Nome], a Lais identificou [N] leads de alta prioridade nas últimas semanas — são leads que mencionaram compra à vista, urgência ou valores acima de R$800K na conversa com a assistente.
>
> Nesses casos, o tempo de resposta é tudo. Leads de alta intenção que recebem atendimento humano em menos de 5 minutos convertem muito mais.
>
> Posso te mandar um guia rápido de como funciona esse alerta? E, se quiser, reviso com você em 15 minutos o que aconteceu com esses leads. Quero garantir que você não está perdendo as melhores oportunidades.

---

### Playbook 3 — "First 30 Days Drop-Off" (low activation, critical churn risk)

**Trigger condition:**

Broker is in days 8 through 30. They registered at least one lead (so they crossed the registration threshold), but since day 7 their notification accept rate has dropped below 20%, they have not completed a single workflow loop, and their dismissal rate is above 60%. Health score below 40.

**What this pattern means:**

This is the classic "week 3 to 4 valley of death" described in the Brazilian PropTech onboarding research. The initial curiosity has faded. The broker completed the minimum required for setup but has not had a "moment of value" that justified continuing to engage. In a commission-based workforce, any tool that does not clearly contribute to closing a deal within the first month will be abandoned — not actively cancelled, just quietly ignored.

**CS action sequence:**

1. Do not wait. Contact within 24 hours of the health score crossing below 40 in days 8 to 30.
2. Open with a question, not a pitch. Ask what they are working on right now — which leads, which properties, which stage. This serves two purposes: it gathers context and it shows the broker that CS is a person, not an automated follow-up.
3. Based on their answer, find one notification-generated insight that is specific to their current situation. For example: if they mention a lead they have been trying to contact, check whether N-01 or N-06 fired for that lead and what the suggested action was. Walk them through the insight as a live demonstration.
4. Set one concrete commitment: "Nos próximos 3 dias, quero que você tente X com esse lead e me conta o resultado." Small, specific, time-bound.
5. Follow up in 3 days. If they did it, celebrate it and suggest the next step. If they did not, assess whether the barrier is motivational or technical.

**Message template (WhatsApp, in Portuguese):**

> Oi [Nome], sou [CS Name] do time da Lais. Vi que você está usando a plataforma há algumas semanas — queria entender como está sendo a experiência na prática.
>
> Você tem algum lead específico ou imóvel que está trabalhando agora que eu possa ajudar a explorar melhor com as ferramentas que a Lais tem? Às vezes o jeito mais rápido de ver o valor é com um caso real do dia a dia de vocês.
>
> Me conta um pouco do que está rolando no seu pipeline agora?

---

## Section 7 — Feedback Loops to Product

### What notification dismissal data should be escalated to the product team

The notification system generates a continuous stream of behavioral data. Most of it should be monitored by CS. Specific patterns, however, represent product-quality signals that the CS team should structure and escalate to the product team on a regular cadence.

### Signal 1: High dismissal rate on a specific notification ID across accounts

If a specific notification is being dismissed at a rate above 50% across the user base and across multiple distinct account segments (not just one agency type), it is a signal that the notification's trigger condition, message framing, or timing is misaligned with broker reality.

The threshold for escalation is: if a notification's dismissal rate exceeds 50% for two consecutive months across accounts with varying seniority and location, CS should formally escalate to product.

The escalation should include: the notification ID, dismissal rate over time, qualitative broker feedback from CS calls (not just the metric), and a hypothesis about the root cause. Common root causes in the Brazilian context include:

- Trigger timing misaligned with broker schedule (e.g., a morning push notification to a broker who works evenings)
- Message framing that feels like surveillance ("Você não fez X em 2 dias") rather than support
- CTAs that require a module the broker does not have, making the notification actionable for only a subset of users
- Suppression rules not catching a pattern (e.g., N-01 firing for a lead the broker has already contacted via WhatsApp outside the system)

### Signal 2: N-25 (LGPD) firing at high rate across an account cohort

If CS observes that multiple accounts are consistently triggering N-25 when attempting campaigns — meaning large portions of their lead bases lack LGPD consent records — this is a systemic data quality problem that the product team needs to address with a better consent-capture workflow during lead registration, not a one-time alert.

Escalation should include: the percentage of accounts triggering N-25 in any given month, the average number of non-consented leads per account, and the broker's typical response (complete data vs. export for manual contact). If a high percentage of brokers choose "exportar lista para contato manual" over "completar dados," it means the in-app consent capture flow has higher friction than the manual alternative — a clear product problem.

### Signal 3: N-22 (team velocity drop) firing but managers not acting

N-22 is a managerial notification. If CS observes that N-22 is firing consistently for specific brokers within a team, but the manager is not taking action (no internal message, no pipeline view), it suggests the manager does not trust or understand the notification's implication. This is both a CS coaching opportunity and a product signal: the framing of "conversa de suporte" may not be compelling enough for managers who are accustomed to WhatsApp-based team management.

Escalate to product: the click-through rate on N-22's "Ver pipeline de [X]" and "Enviar mensagem interna" CTAs. If click-through on N-22 is below 15% consistently, the notification needs redesign.

### Signal 4: N-05 (high-intent lead) confidence score failures

N-05 fires when 2 or more high-intent signals converge. If brokers who act on N-05 consistently report that the lead was not actually high-intent (wrong property type, wrong budget range, cold contact despite signals), it means the confidence scoring model needs recalibration. CS should track the conversion rate of leads flagged by N-05: what percentage of N-05 flagged leads actually resulted in a visit or proposal? A rate below 25% suggests the signal quality is too low and will erode broker trust in AI notifications broadly.

Escalation format: monthly N-05 false positive report with sample lead context (anonymized), conversion outcome, and broker feedback from CS calls.

### Signal 5: N-03 and N-04 chronically suppressed by "motivo de espera" tags

The spec notes that N-03 (Duas Visitas, Nenhuma Proposta) suppresses when legitimate blocker tags are present (FGTS, financing, waiting for co-signer). If CS observes that brokers are systematically adding these tags to suppress notifications rather than because the blockers are real, it means the notification is creating an aversive pressure that brokers are working around. This is a misuse pattern that corrupts the CRM's data quality.

Detection method: look for spikes in specific blocker tags that correlate with N-03 being eligible to fire. If "aguardando FGTS" tags appear disproportionately in June through August (which has a legitimate reason — that is the FGTS anniversary window), that is expected. If they appear uniformly across all months, it is a workaround pattern.

Escalate to product as: data integrity risk plus UX friction signal. Possible product response: redesign the N-03 suppression flow to distinguish between "broker confirmed blocker" and "broker is uncomfortable with the notification."

### Feedback loop structure

The CS team should produce and deliver the following to the product team on a structured cadence:

| Frequency | Report | Contents |
|-----------|--------|---------|
| Weekly | Notification dismissal alert | Any notification ID with 7-day dismissal rate above 50% across 10+ accounts |
| Monthly | Engagement pattern summary | Accept rates, snooze patterns, and workflow loop completion rates per notification group |
| Monthly | N-05 false positive rate | Conversion outcomes for all N-05 flagged leads in the prior month |
| Quarterly | Qualitative escalation review | Themes from CS calls related to notification confusion, distrust, or friction; includes verbatim broker feedback |
| As needed | Data integrity alerts | Patterns suggesting systematic tag manipulation or N-25 scale problems |

The feedback loop should have a named owner on the product side — ideally a product manager or data analyst who is accountable for reviewing CS escalations and closing the loop within 2 sprint cycles. Without a named owner, escalations disappear and the feedback loop breaks. CS should track which escalations have been reviewed and actioned, and report unresolved escalations to leadership at the quarterly review.

---

## Appendix: Notification ID Quick Reference for CS Teams

| ID | Group | Color | Churn signal if dismissed | Upsell module | First 7 days |
|----|-------|-------|--------------------------|---------------|--------------|
| N-01 | A — Pipeline | Amber | High | Visita | Yes |
| N-02 | A — Pipeline | Green | Medium | Visita | Yes |
| N-03 | A — Pipeline | Amber | Medium | Visita | Day 6+ |
| N-04 | A — Pipeline | Amber | Medium | — | Day 7 |
| N-05 | A — Pipeline | Green | Low | Visita, Atende | Yes |
| N-06 | B — Dormancy | Amber | High | Reengaja | Week 2 |
| N-07 | B — Dormancy | Amber | Critical | Reengaja | Week 3+ |
| N-08 | B — Dormancy | Amber | High | Reengaja | Week 4+ |
| N-09 | B — Dormancy | Blue | Medium | — | Week 8+ |
| N-10 | B — Dormancy | Green | Low | Reengaja | Week 4+ |
| N-11 | C — Listings | Green | Low | — | Yes |
| N-12 | C — Listings | Blue | Low | — | Week 3+ |
| N-13 | C — Listings | Amber | Low | Visita | Week 3+ |
| N-14 | C — Listings | Blue (passive) | Low | — | Day 1 (always on) |
| N-15 | D — Long-cycle | Green | Low | — | Week 6+ |
| N-16 | D — Long-cycle | Amber | Low | Reengaja | Seasonal only |
| N-17 | D — Long-cycle | Green | Low | — | Week 6+ |
| N-18 | D — Long-cycle | Green | Low | — | Week 8+ |
| N-19 | D — Long-cycle | Green | Low | — | Week 6+ |
| N-20 | E — AI signals | Amber | Medium | Atende | Week 2 |
| N-21 | E — AI signals | Amber | Critical | Atende | Day 4+ |
| N-22 | E — AI signals | Amber | Medium | Team plan | Week 6+ |
| N-23 | F — Seasonal | Green | Low | Reengaja | Seasonal only |
| N-24 | F — Seasonal | Amber | Low | Reengaja | Seasonal only |
| N-25 | G — Data quality | Blue | Low | — | On campaign action |

---

*Report prepared by Customer Success Management — Lais (lais.ai)*
*February 23, 2026*
*Based on: intelligent-suggestion-notifications-report.md, brazilian-proptech-onboarding-report.md, optimal-engagement-windows-report.md, lais-smart-trigger-synthesis-report.md*
