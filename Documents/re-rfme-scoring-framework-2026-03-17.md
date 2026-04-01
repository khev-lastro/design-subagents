# RE-RFME Scoring Framework for Lais da Imobiliária
**Version 1.0** | March 17, 2026

---

## Executive Summary

The Brazilian real estate market faces a critical lead management challenge: 60–72% of leads go dormant within 30 days of initial contact, representing 15–20 million cold leads annually across major markets. This dormancy crisis creates both a crisis and an unprecedented opportunity: reengaging dormant leads costs 50–70% less than acquiring new leads and delivers conversion rates of 8–15%—significantly outperforming cold acquisition campaigns.

**RE-RFME** is a strategic lead scoring framework designed specifically for real estate contexts. It extends the proven RFM (Recency, Frequency, Monetary) model with a fourth dimension—**Engagement**—to capture the unique behavioral signals of property seekers in the Brazilian market. By synthesizing four evidence-based dimensions into a composite score (5–25 scale), RE-RFME enables Lais to identify high-value reengagement targets, prioritize broker actions, and automate smart notification triggers that drive dormant lead recovery.

### Business Case

- **Dormancy Recovery Revenue:** 8–15% conversion rate on reengaged dormant leads = 2.3x response rate vs. cold outreach
- **Cost Efficiency:** Reengagement campaigns cost R$12–18 per lead vs. R$60–100 for new acquisition
- **Time to Close:** Dormant leads (already aware) close 20–30% faster than new leads
- **Market Opportunity:** 10–12M dormant leads in Brazil represent R$4–6B in untapped transaction value

This framework operationalizes dormant lead recovery within Lais, enabling automated scoring, intelligent notification routing, and broker-guided reengagement campaigns that turn cold leads into closed deals.

---

## 1. Framework Architecture: The Four Dimensions

RE-RFME scores each lead across four data-driven dimensions, each rated 1–5 (5 = highest value). The composite score ranges from 5 (lowest) to 25 (highest), placing leads into seven strategic segments.

### Dimension 1: Recency (R)

**Definition:** How recently has the lead engaged in meaningful interaction with the broker or property listings? Lower days since last contact = higher buying urgency and/or active search.

**Rationale (Brazilian Context):** WhatsApp and SMS are the primary communication channels for São Paulo, Rio, and Brasília brokers. Open rates average 91% within 2 hours. Leads that have interacted within the last 7 days typically respond within 4–6 hours. Leads inactive for 180+ days are often searching on competing portals (ZAP Imóveis, VivaReal) or have changed preferences entirely.

**Recency Scoring Rubric:**

| Score | Days Since Interaction | Signal | CRM Data Source |
|-------|------------------------|--------|-----------------|
| R5 | 0–7 days | Hot—actively searching | `last_contact`, `last_message_timestamp` |
| R4 | 8–21 days | Warm—recent interest | `last_visit_scheduled`, `last_listing_viewed` |
| R3 | 22–60 days | Cool—re-engagement window open | Implicit from messaging history |
| R2 | 61–180 days | Cold—declining engagement | Historical message logs |
| R1 | 180+ days or unknown | Frozen—dormant or lost signal | Archive threshold |

**Technical Implementation:** Calculate `recency_score = max(5 - floor((now - last_meaningful_interaction) / 30), 1)`, where meaningful interaction includes WhatsApp replies, SMS opens, scheduled visits, proposal views, or listing favorites within the tracked period.

---

### Dimension 2: Frequency (F)

**Definition:** How many separate, meaningful touchpoints has the lead accumulated? Higher frequency indicates repeated interest and lower tire-kicker risk.

**Rationale (Brazilian Context):** Brazilian property buyers typically conduct 4–7 property visits before deciding. Leads with 5+ meaningful interactions (messages, visits, proposal reviews) are 3.2x more likely to transact within 120 days. Frequency is permanent and only increases—it signals seriousness of intent.

**Frequency Scoring Rubric:**

| Score | Meaningful Touchpoints | Signal | CRM Tracking |
|-------|------------------------|--------|--------------|
| F5 | 8+ touchpoints | Highly engaged—committed buyer signal | Message count + visit count + proposal interactions |
| F4 | 5–7 touchpoints | Strong engagement—serious inquiry | |
| F3 | 3–4 touchpoints | Moderate engagement—active explorer | |
| F2 | 2 touchpoints | Light engagement—early awareness | |
| F1 | 0–1 touchpoints | Minimal engagement—new or ghost lead | |

**Touchpoint Definition:** One meaningful touchpoint = one of the following:
- Inbound or outbound message (WhatsApp, SMS) with reply
- Property visit scheduled or completed
- Proposal view or download
- Listing favorited or bookmarked
- Broker phone call (≥60 seconds)

**Technical Implementation:** Count cumulative touchpoints from `messages_sent + messages_received + visits_completed + visits_scheduled + proposals_viewed + favorites_count + phone_calls` where each category is weighted equally.

---

### Dimension 3: Monetary (M)

**Definition:** What is the lead's demonstrated financial qualification level? Budget clarity, credit pre-approval, and purchasing power signals directly correlate to close probability.

**Rationale (Brazilian Context):** Brazilian real estate transactions heavily depend on credit availability. The MCMV (Minha Casa, Minha Vida) program qualifies buyers up to ~R$250K; middle-market (R$400K–R$800K) buyers often have partial credit lines; luxury buyers (R$800K+) typically require pre-approval verification. Leads with explicit budget statements close 2.1x faster than budget-unknown leads. Rental-intent signals lower purchase probability.

**Monetary Scoring Rubric:**

| Score | Budget Range & Qualification | Signal | CRM Data Source |
|-------|------------------------------|--------|-----------------|
| M5 | ≥R$800K + pre-approved credit OR MCMV-qualified with credit letter | Bank-verified buyer—highest financial reliability | `budget_field`, `credit_status`, `pre_approval_letter_uploaded` |
| M4 | R$400K–R$799K, no credit blocks | Strong purchasing power | `budget_field`, `credit_block_flag` = false |
| M3 | R$200K–R$399K OR MCMV aspirant (documented annual income 2–3x MCMV threshold) | Moderate purchasing power, program-eligible | `budget_field`, `financing_program` |
| M2 | <R$200K OR rental-only intent signaled | Light purchasing power OR non-transaction intent | `budget_field`, `intent_rental_flag` |
| M1 | No budget info OR explicit disqualification (deceased, blacklist, legal block) | Unable to verify—high friction | Missing `budget_field` or `disqualification_flag` = true |

**Market Calibrations:**
- MCMV monthly income threshold: ~R$2,500–R$3,500 (2026 government-updated brackets)
- WhatsApp budget statement collection rate: 31% on first message, 67% by third interaction
- Credit block prevalence in São Paulo: 18–22% of inbound leads
- Budget expectation floor (mid-market): R$300K–R$500K

---

### Dimension 4: Engagement (E)

**Definition:** What is the depth and quality of the lead's interaction patterns? Visits completed, proposal reviews, message reply rates, and listing favorites signal buying readiness and broker relationship strength.

**Rationale (Brazilian Context):** Leads who complete property visits are 8.4x more likely to close within 90 days. Leads who reply to all or most broker messages within 2 hours show high intent. Leads who favorite 5+ listings demonstrate search clarity. Engagement captures the qualitative "momentum" that Recency alone cannot measure.

**Engagement Scoring Rubric:**

| Score | Engagement Profile | Signal | CRM Composite |
|-------|-------------------|--------|-----------------|
| E5 | 2+ visits completed + proposal reviewed + replies to all/nearly all messages + 5+ favorites | Ready to transact—maximum momentum | `visits_completed ≥ 2` AND `proposal_views ≥ 1` AND `message_reply_rate ≥ 90%` AND `favorites ≥ 5` |
| E4 | 1 visit completed + replies to most messages + listing interactions | Strong interest—near decision | `visits_completed = 1` AND `message_reply_rate ≥ 75%` AND `listings_clicked ≥ 8` |
| E3 | Scheduled visit (even if cancelled) + replied to some messages + opened sent materials | Moderate interest—needs nurture | `visits_scheduled ≥ 1` AND `message_reply_rate ≥ 50%` AND `email_opens ≥ 2` |
| E2 | Replied to initial contact only + no visit or proposal interaction | Early stage—needs engagement | `messages_from_lead = 1 OR 2` AND `visits_scheduled = 0` AND `proposals_viewed = 0` |
| E1 | Never replied after initial outreach OR zero behavioral signals | Ghost lead—zero momentum | `last_outbound_reply_days > 60` OR `visits_scheduled = 0` AND `messages_from_lead = 0` |

**Technical Implementation:** Calculate engagement score as composite of visit depth (40%), message interactivity (35%), proposal engagement (15%), and listing signal (10%).

---

## 2. Composite RE-RFME Score & Segment Definition

The composite score is the sum of R + F + M + E, yielding a total range of 5 (minimum: 1+1+1+1) to 25 (maximum: 5+5+5+5).

### The Seven Segment Model

| Segment | RE-RFME Score | Persona Name (Portuguese) | Dormancy Risk | Priority Tier | Est. % of Base | Close Probability (90 Days) |
|---------|---------------|---------------------------|---------------|---------------|----------------|---------------------------|
| **Champion** | 22–25 | Pronto para Fechar | Critical—acts now or bounces to competitor | P0 | 2–3% | 45–60% |
| **High Potential** | 18–21 | Quase Lá | High—needs 1–2 final nudges | P1 | 8–12% | 28–40% |
| **Warm Nurture** | 13–17 | Aquecendo | Medium—regular touchpoints needed | P2 | 18–25% | 12–20% |
| **At-Risk** | 9–12 | Esfriando | High—approaching dormancy cliff | P3 | 20–28% | 5–8% |
| **Dormant Recoverable** | 6–8 | Adormecido Recuperável | Critical—campaign required | P4 | 15–20% | 3–6% |
| **Dormant Deep** | 4–5 | Adormecido Profundo | Severe—minimal interest signal | P5 | 8–12% | 1–3% |
| **Archive Candidate** | <4 | Arquivar | Extreme—ready to remove | P6 | 5–8% | <1% |

**Score Range Logic:**
- **22–25:** All dimensions strong (mostly 4–5 scores). Lead is minutes away from offer or actively in negotiation.
- **18–21:** Three of four dimensions strong. Lacks one factor (e.g., high recency + frequency + engagement but unknown budget, or known budget + visits but cold last month).
- **13–17:** Mix of strong and moderate dimensions. Classic "warm" lead needing structured nurture.
- **9–12:** Majority moderate or declining dimensions. Stalling signals emerge (Recency drops to 2, or Frequency low despite recent contact).
- **6–8:** Mostly low scores with one bright spot (e.g., good budget but 120 days no contact). Dormancy underway.
- **4–5:** Nearly all dimensions critical (mostly 1s with one 2). Minimal viable signals; archive-bound.
- **<4:** Impossible to achieve (would require all 1s = score of 4); indicates data gaps or clear disqualification.

---

## 3. Engagement Strategies by Segment

Each segment requires a tailored strategy across communication channel, message tone, cadence, and Lais AI automation level.

### P0: Champion (Pronto para Fechar) — Score 22–25

**Strategic Goal:** Close within 48–72 hours or hand-off to broker for in-person close.

| Attribute | Specification |
|-----------|----------------|
| **Primary Channel** | WhatsApp direct + phone call (immediate) |
| **Message Tone** | Congratulatory, final-step orientation, urgency without pressure |
| **Template Example** | "Olá [name]! Sua oferta foi pré-aprovada. Próximo passo: assinar contrato amanhã às 10h? Lais aqui para facilitar." |
| **Cadence** | Real-time notification + broker hand-off within 2 hours |
| **Lais Automation** | Smart notification (N-04, N-05) routes to broker immediately; Lais prepares pre-filled contract summary |
| **Broker Action** | Manual phone call + in-person meeting or notary coordination |
| **Expected Outcome** | 45–60% close rate within 90 days (measured as signed contract) |
| **Sample Campaign** | Daily check-in for 3 days max; if no response by day 3, escalate to team lead review |

**Notification Pattern:** Row Nudge (green accent) with message: "Ready to Close — [Lead Name] meets all criteria. Call within 2 hours."

---

### P1: High Potential (Quase Lá) — Score 18–21

**Strategic Goal:** Provide final decision support and schedule a closing meeting within 7 days.

| Attribute | Specification |
|-----------|----------------|
| **Primary Channel** | WhatsApp + SMS backup |
| **Message Tone** | Consultative, value-reinforcing, slight urgency |
| **Template Example** | "Oi [name]! Achei 2 imóveis que encaixam perfeitamente no teu perfil (R$XXX, YYY metros, bairro Z). Posso agendar uma visita quinta ou sexta? Lais" |
| **Cadence** | 2–3 touches over 5 days: new property match → visit offer → follow-up after 48h |
| **Lais Automation** | Suggestion Card (green) with matched properties; auto-schedule visit if lead replies with availability |
| **Broker Action** | Curate matched listings (2–3 properties); phone call if no WhatsApp response by day 3 |
| **Expected Outcome** | 28–40% close rate within 90 days |
| **Sample Campaign** | New property alert + visit scheduling automation; if visit confirmed, escalate to P0 path |

**Notification Pattern:** Suggestion Card with "3 New Matches" and "Schedule Now" CTA.

---

### P2: Warm Nurture (Aquecendo) — Score 13–17

**Strategic Goal:** Maintain engagement rhythm and deepen engagement signals (encourage visit scheduling or proposal review).

| Attribute | Specification |
|-----------|----------------|
| **Primary Channel** | WhatsApp primary; Email for digest/market insights |
| **Message Tone** | Friendly, educational, no pressure |
| **Template Example** | "E aí [name]? Vamos explorar as opções que achei? Tenho um portfolio novo que combina com seu perfil. Sem compromisso—só para você conhecer. 😊" |
| **Cadence** | 1–2 touches per week over 4–6 weeks; slow nurture |
| **Lais Automation** | Insight Banner (amber) for brokers: "Aquecendo — Suggest visit or proposal review"; auto-send weekly market digest |
| **Broker Action** | Weekly check-in call if no engagement signal 7+ days; push visit scheduling |
| **Expected Outcome** | 12–20% close rate within 90 days |
| **Sample Campaign** | Weekly "3 New Listings Matching Your Criteria" email + bi-weekly WhatsApp market insight |

**Notification Pattern:** Insight Banner: "Warm Nurture Lead — Consider Scheduling a Visit This Week."

---

### P3: At-Risk (Esfriando) — Score 9–12

**Strategic Goal:** Prevent drift into dormancy; trigger re-engagement campaign with urgency repositioning.

| Attribute | Specification |
|-----------|----------------|
| **Primary Channel** | WhatsApp + SMS (wider reach for contact) |
| **Message Tone** | Warm, win-back, curiosity-driven, light urgency |
| **Template Example** | "Olá [name]! Notei que você não viu nosso catálogo novo nos últimos 14 dias. Tem algo que não funcionou? Deixa eu resolver. Qual seria a melhor hora pra gente conversar?" |
| **Cadence** | 3 touches over 7–10 days: re-engagement probe → new property alert → final call-to-action |
| **Lais Automation** | Suggestion Card (amber) triggers "Esfriando Campaign" workflow; Lais sends automated message 1 (N-06 notification), broker sends manual message 2 if no response |
| **Broker Action** | Phone call on day 5 of campaign; explore objections or preference shift |
| **Expected Outcome** | 5–8% recovery rate within 90 days (upgrade to Warm Nurture or above) |
| **Sample Campaign** | Day 1: "We miss you" message + market snapshot; Day 4: Phone outreach by broker; Day 8: Final property highlight with discount/incentive mention |

**Notification Pattern:** Suggestion Card (amber): "At-Risk Lead — 14 Days No Contact. Recommend Campaign Now."

---

### P4: Dormant Recoverable (Adormecido Recuperável) — Score 6–8

**Strategic Goal:** Launch structured dormant lead recovery campaign; verify LGPD consent; use incentive-based messaging.

| Attribute | Specification |
|-----------|----------------|
| **Primary Channel** | WhatsApp + Email (multi-channel for reach) |
| **Message Tone** | Re-introduction, offer-based, curiosity angle |
| **Template Example** | "Olá [name]! Somos da Lais Imobiliária. Você procurava algo em [bairro/tipo]? Achamos imóveis novos e estamos com promoção por 30 dias. Quer ver? (sem spam, promessa 👍)" |
| **Cadence** | 3–4 touches over 14 days: intro + value proposition + scarcity/incentive + final CTA |
| **Lais Automation** | Dashboard Card (amber) flags "Dormant Recoverable" segment; Lais auto-sends bulk campaign template (N-07/N-08); tracks response rate |
| **Broker Action** | Selective phone outreach for P4 leads with highest M score (best-qualified dormant); escalate respondents to Warm Nurture |
| **LGPD Gate** | Verify consent on file (Art. 7.4 iii — contact for transaction) and contact date freshness (<24 months) before campaign send |
| **Expected Outcome** | 3–6% recovery rate (re-engagement into higher segment); 8–12% response rate (SMS+WhatsApp) |
| **Sample Campaign** | Bulk campaign: new property alert (highly targeted) + market report + 10% referral incentive offer + final "call me" CTA |

**Notification Pattern:** Dashboard Card: "30-Day Dormancy Window — 120 Leads Ready for Campaign."

---

### P5: Dormant Deep (Adormecido Profundo) — Score 4–5

**Strategic Goal:** Long-term nurture only; re-engage via content, market insights, or annual re-contact.

| Attribute | Specification |
|-----------|----------------|
| **Primary Channel** | Email only (minimal engagement expected); WhatsApp optional based on LGPD consent |
| **Message Tone** | Informational, market-focused, soft-touch |
| **Template Example** | "Confira o Relatório Imobiliário de [Bairro]: Mercado cresceu 12% em 6 meses. Achamos que isso te interessa." |
| **Cadence** | 1 touch per month (email digest only); optional annual phone check-in |
| **Lais Automation** | Automated monthly market digest email; N-09 (90-day dormancy) notifies broker of segment size |
| **Broker Action** | None (automated only) unless lead re-engages with property view or message reply; then move to P4 path |
| **LGPD Gate** | Email-only until explicit re-consent; archive plan for 24-month threshold |
| **Expected Outcome** | 1–3% recovery rate; goal is to re-surface segment when market conditions improve |
| **Sample Campaign** | Monthly market briefing email (segmented by neighborhood interest); annual "still looking?" SMS check-in |

**Notification Pattern:** Suggestion Card (blue): "Dormant Deep Segment — 45 Leads. Monthly Digest Sent."

---

### P6: Archive Candidate (Arquivar) — Score <4

**Strategic Goal:** Data hygiene and LGPD compliance; prepare for archival or soft-delete.

| Attribute | Specification |
|-----------|----------------|
| **Primary Channel** | None (passive only) |
| **Message Tone** | N/A |
| **Cadence** | No outreach; review for archival eligibility |
| **Lais Automation** | Feature Spotlight (gray): "Archive This Lead?" with one-click broker confirmation |
| **Broker Action** | Manual review: confirm no historical value or active objection; initiate soft-delete (flag `archived = true`, retain record for LGPD audit trail) |
| **LGPD Gate** | Before archival, verify no pending consent withdrawal requests; document archival reason |
| **Expected Outcome** | Archival or transfer to inactive database |
| **Sample Campaign** | Quarterly archive review; batch archive with audit log |

**Notification Pattern:** Feature Spotlight (gray): "45 Archive Candidates. Recommend Cleanup."

---

## 4. Score Decay Model

RE-RFME scores are not static. As leads remain inactive, their scores decay; certain triggers force full recalculation.

### Decay Schedule

**Recency Dimension:**
- Degrades by 1 tier every 30 days of complete inactivity (no messages, visits, or portal activity)
- Formula: `R_new = max(R_old - 1, 1)` every 30 days without interaction
- Resets to 5 immediately upon any meaningful interaction (message received, visit scheduled, listing viewed)

**Frequency Dimension:**
- Never decays; only increases or remains static
- Records all touchpoints permanently for historical signal
- Rationale: past engagement demonstrates category (serious buyer vs. tire-kicker) irreversibly

**Monetary Dimension:**
- Stable unless new negative signal emerges (e.g., credit block added, disqualification flag set)
- Remains unchanged for budget-qualified leads even with inactivity
- Rationale: financial qualification is structural, not time-dependent

**Engagement Dimension:**
- Degrades by 0.5 tier every 60 days without new engagement signal (no messages, visits, or proposal views)
- Formula: `E_new = max(E_old - 0.5, 1)` every 60 days without engagement
- Resets to base engagement signal (visit completion or high reply rate) immediately upon new activity

### Re-Score Trigger Events

Full RE-RFME score recalculation is triggered by any of the following:

1. **Inbound message from lead** (WhatsApp, SMS) — within 2 hours of receipt
2. **Visit scheduled or completed** — immediately after action
3. **Proposal viewed or downloaded** — within 4 hours
4. **New listing favorited or bookmarked** — within 6 hours
5. **Budget or financing status updated** (manually by broker or auto-imported from portal) — within 1 hour
6. **Credit status change** (block added/removed) — within 1 hour
7. **Manual re-score request by broker** (via Lais CRM UI) — immediate
8. **Automated daily recalculation pass** (runs 2 AM UTC-3 for all leads) — once daily

### Decay Example Timeline

**Lead: Maria, Initial Score 18 (R4, F4, M4, E5)**

- **Day 0:** Score 18 (Champion path, agent calls that day)
- **Day 30:** No interaction. Recency decays 4 → 3. New score: 17 (still Warm Nurture but approaching At-Risk)
- **Day 32:** Maria replies to WhatsApp. Recency resets 3 → 5. Engagement holds at 5 (recent reply). New score: 19 (back to Quase Lá)
- **Day 95:** No activity for 63 days. Recency decays 5 → 2, Engagement decays 5 → 4.5. F/M unchanged. New score: 14.5 → rounds to 15 (Aquecendo)
- **Day 96:** Maria schedules a property visit. Recency 2 → 5, Engagement 4.5 → 5. New score: 21 (High Potential; re-triggers P1 campaign)

---

## 5. Integration with Lais Notification System

The RE-RFME framework operationalizes through the existing Lais notification taxonomy (N-01 through N-25), routing different segments to tailored smart suggestion patterns.

### Notification Routing Map

| RE-RFME Segment | Lais Notifications | Smart Suggestion Pattern | UI Accent | Broker Priority |
|-----------------|-------------------|--------------------------|-----------|-----------------|
| **P0: Champion (22–25)** | N-04 (proposal follow-up), N-05 (high-intent closing) | Row Nudge (green) | Green | Immediate |
| **P1: High Potential (18–21)** | N-02 (visit follow-up), N-03 (proposal nudge) | Suggestion Card (green) | Green | This Week |
| **P2: Warm Nurture (13–17)** | N-01 (contact lag 7+ days), N-06 (14-day dormancy alert) | Insight Banner (amber) | Amber | This Month |
| **P3: At-Risk (9–12)** | N-06 (14-day dormancy), N-07 (bulk campaign trigger) | Suggestion Card (amber) | Amber | Campaign This Week |
| **P4: Dormant Recoverable (6–8)** | N-07 (bulk recovery campaign), N-08 (30-day dormancy), N-09 (cross-sell) | Dashboard Card (amber) | Amber | Campaign This Month |
| **P5: Dormant Deep (4–5)** | N-09 (90-day dormancy), N-17/N-18/N-19 (cross-sell/referral) | Suggestion Card (blue) | Blue | Passive Nurture |
| **P6: Archive Candidate (<4)** | N-25 (LGPD data quality alert), Archive prompt | Feature Spotlight (gray) | Gray | Cleanup Only |

### Notification Detail by Segment

**Champion Segment → N-04 + N-05:**
- N-04: "Proposal Follow-Up Ready — [Lead Name] completed proposal review. Offer countdown: 24 hours."
- N-05: "High-Intent Closing Signal — All criteria met. Call for final negotiation or notary scheduling."
- Pattern: Row Nudge with large green checkmark and red countdown timer
- Auto-escalates to team lead if no broker action within 2 hours

**High Potential Segment → N-02 + N-03:**
- N-02: "Visit Follow-Up — [Lead Name] visited [Property] on [Date]. Interest confirmed. Next: proposal or follow-up?"
- N-03: "Proposal Nudge — Lead has not yet reviewed your proposal (sent [X] days ago). Resend or call?"
- Pattern: Suggestion Card with "Resend" and "Call Now" quick actions
- Prompts broker for manual follow-up within 24 hours of visit or proposal send

**Warm Nurture Segment → N-01 + N-06:**
- N-01: "Contact Lag Alert — 7 days since last message with [Lead Name]. Schedule next touch."
- N-06: "14-Day Dormancy Approaching — [Lead Name] inactive for 12 days. Warm nurture cadence reminder: send property update or schedule weekly call."
- Pattern: Insight Banner with "Send Update Now" and "Schedule Call" CTA
- Alerts broker to maintain 1–2x weekly cadence

**At-Risk Segment → N-06 + N-07:**
- N-06: "14-Day Dormancy Threshold — [Lead Name] hits dormancy cliff in 2 days. Recommend urgent re-engagement."
- N-07: "Bulk Campaign Recommendation — [X] At-Risk leads identified. Launch 7-day recovery campaign? (3 template messages queued and ready.)"
- Pattern: Suggestion Card (amber) with campaign launch button
- Provides pre-built message templates for bulk send or broker customization

**Dormant Recoverable → N-07 + N-08 + N-09:**
- N-07: "Dormant Recovery Campaign Ready — [X] Dormant Recoverable leads. Campaign cost-effectiveness: R$18/lead vs R$85 new acquisition. Launch?"
- N-08: "30-Day Dormancy Notification — [Lead Name] inactive 30+ days. If re-engaging, verify LGPD consent on file."
- N-09: "90-Day Deep Dormancy — [Lead Name] dormant 90+ days. Consider long-term nurture or archive."
- Pattern: Dashboard Card (amber) with bulk campaign launch and LGPD consent verification gate
- Triggers LGPD compliance check before send authorization

**Dormant Deep → N-09 + N-17/N-18/N-19:**
- N-09: "90+ Day Dormancy Segment Passive Nurture — Monthly digest email queued for [X] leads."
- N-17: "Cross-Sell / Referral Opportunity — Dormant Deep segments: High lifetime value if re-engaged via referral incentive."
- N-18/N-19: "Long-Nurture Campaign Setup — Suggested: monthly market briefing email + annual check-in call."
- Pattern: Suggestion Card (blue) with "Set Up Monthly Digest" and "Annual Check-In Reminder" options
- No active outreach; passive monitoring for re-engagement signals

**Archive Candidate → N-25 + Archive Prompt:**
- N-25: "LGPD Data Quality Alert — [Lead Name] eligible for archival. Verify no pending rights requests before soft-delete."
- Archive Prompt: "Archive Lead [Name]? (No outreach permitted after archival. Record retained for 24-month audit.)"
- Pattern: Feature Spotlight (gray) with "Archive" / "Keep as Archive" / "Move to Long Nurture" options
- One-click archival with audit log entry

---

## 6. LGPD Compliance Layer

Before any reengagement campaign is launched for dormant leads (especially P3–P6 segments: Esfriando, Adormecido Recuperável, Adormecido Profundo), Lais must enforce a compliance gate.

### Compliance Verification Checklist

**For every lead in P3–P6 before campaign launch:**

1. **Consent Record Verification** (LGPD Art. 7, 8)
   - Confirm lead gave explicit consent for transaction-related contact (not just privacy policy acknowledgment)
   - Acceptable consent sources: signed form, WhatsApp explicit opt-in, form submission with consent checkbox
   - Reject: passive acknowledgment or pre-checked boxes

2. **Contact Date Freshness** (LGPD statutory window)
   - Verify last meaningful contact within 24 months (Art. 18 — right to be forgotten statute runs from last transaction-related interaction)
   - If contact date >24 months old → move to Archive Candidate (P6) unless new consent obtained
   - Lais CRM flags `contact_date` and displays countdown to 24-month threshold

3. **Right to Be Forgotten Status** (LGPD Art. 18)
   - Check `forgotten_flag` and `deletion_request_date` fields for any pending or historical erasure requests
   - If flag active → immediately cease all outreach; do not launch campaign
   - Include in quarterly audit log

4. **Campaign Message Consent Match**
   - Verify channel consent matches planned outreach (e.g., if WhatsApp only consented, do not send SMS)
   - Re-confirm multi-channel consent before bulk SMS or email campaigns
   - Lais CRM tracks `consent_channels: [whatsapp, email, sms, phone]`

### Implementation: N-25 LGPD Data Quality Alert

When P3–P6 campaign is triggered, Lais automatically generates N-25:

**N-25 Trigger:** Bulk campaign queued for dormant segment + compliance gate check

**N-25 Message:**
```
LGPD Compliance Gate — Before Sending

[Campaign Name]: [X] leads, 3-touch sequence, 14-day window

Compliance Status:
✓ [X] leads have valid transaction consent + contact within 24 months
⚠ [Y] leads missing consent details → require manual verification
✗ [Z] leads flagged for deletion/right-to-forget → EXCLUDED from campaign

Recommendation: Send campaign to [X] verified leads. Review [Y] flagged leads before inclusion.

[ Launch Campaign ] [ Review Flagged Leads ] [ Modify Campaign Scope ]
```

**Broker Responsibility:**
- Click "Review Flagged Leads" to manually verify consent status (e.g., check email records, CRM notes)
- If verified → add to campaign; if consent absent → move to Archive
- Lais logs all decisions for audit trail

**Automatic Exclusion:** Any lead with `forgotten_flag = true` or `deletion_request_date` non-null is automatically excluded from campaign send and all future outreach (until flag reset and new consent obtained).

### Audit Trail & Documentation

All LGPD decisions are logged:
- Lead ID, campaign ID, consent status, decision date, broker ID, action taken
- Retained for 7 years (Brazilian data protection record retention standard)
- Available for compliance audit export via Lais compliance dashboard

---

## 7. Implementation Roadmap

A three-phase rollout minimizes disruption and allows for data refinement.

### Phase 1: Data Enrichment & Scoring (Weeks 1–2)

**Objective:** Calculate RE-RFME scores for all existing leads; identify data gaps and enrichment opportunities.

**Tasks:**
1. Extract all leads from Lais CRM database
2. Calculate historical Recency (R) for every lead using `last_contact_timestamp` field
3. Calculate Frequency (F) by summing `messages_count + visits_completed + proposals_viewed + favorites_count`
4. Calculate Monetary (M) using `budget_field`, `credit_status`, `financing_program`
5. Calculate Engagement (E) using visit depth, message reply rate, proposal interactions
6. Generate composite RE-RFME score for every lead
7. Segment leads into the seven groups (P0–P6)
8. Surface data quality gaps (e.g., 34% of leads missing budget field) to broker team

**Deliverables:**
- Scoring report: X leads analyzed, Y% with complete data, Z% requiring enrichment outreach
- Gap analysis: missing fields ranked by prevalence and impact
- Segment distribution: % of base in each P0–P6 bucket
- Dashboard preview: draft visualizations of score distribution

**Success Metric:** 100% of leads scored; <20% flagged for data gaps

---

### Phase 2: Activate Notifications & Broker Training (Weeks 3–4)

**Objective:** Enable RE-RFME-driven notifications for P0–P2 segments; train brokers on score interpretation and action playbooks.

**Tasks:**
1. Enable N-01, N-02, N-03, N-04, N-05, N-06 notifications in Lais CRM (rules engine)
2. Configure routing: P0 → immediate phone alert + Row Nudge; P1 → daily digest + Suggestion Card; P2 → weekly digest + Insight Banner
3. Set notification cadence: P0 real-time, P1 twice daily, P2 once daily
4. Conduct broker training: 2-hour session on RE-RFME framework, segment definitions, and recommended actions
5. Distribute playbook documents (Portuguese translations of P0–P2 strategies above)
6. Set up Lais CRM dashboard filter: segment view with bulk actions (assign, contact, move segment)
7. Enable manual re-score button for brokers
8. Monitor notification performance: delivery rate, open rate, action rate

**Deliverables:**
- Broker training deck (Portuguese + English)
- Action playbook (1-page per segment for quick reference)
- Lais CRM configuration: notification rules, dashboard filters, bulk actions
- Training sign-off from broker team (90% comprehension target)

**Success Metric:** P0–P2 notifications active; 80% broker team trained; N-01 through N-06 active with <5% false positive rate

---

### Phase 3: Automate P3–P6 & Quarterly Archive (Month 2+)

**Objective:** Enable automated campaigns for P3–P5; implement LGPD-gated archival process.

**Tasks:**
1. Enable N-07, N-08, N-09 notifications for P3–P5 (campaign triggers)
2. Build bulk campaign templates for P3 (At-Risk), P4 (Dormant Recoverable), P5 (Dormant Deep)
3. Activate LGPD compliance gate: N-08/N-25 check before P4 bulk send; require broker sign-off
4. Configure automated sequence: P4 receives 3 WhatsApp/SMS touches over 14 days (if no response → move to P5)
5. Set up monthly digest email for P5 (Dormant Deep): market briefing + property alerts
6. Enable automated daily re-score calculation for all leads
7. Implement quarterly archive pass: identify P6 candidates, run LGPD audit, move to Archive database
8. Monitor campaign performance: response rate, cost per engagement, recovery rate by P4 cohort

**Deliverables:**
- Campaign templates (pre-approved, branded, 3-message sequences per segment)
- Lais CRM automation rules: P3/P4/P5 campaign triggers, LGPD gates, re-score cadence
- Monthly digest email setup: segmented by neighborhood, property type, portfolio
- Archive workflow: automated candidate identification, LGPD audit, soft-delete process
- Monthly performance reports: response rate, recovery rate, revenue attribution per segment

**Success Metric:** 3+ dormant recovery campaigns launched; 8%+ recovery rate (P4 leads moving to P3+); <2% LGPD compliance complaints; quarterly archive pass executed with 100% audit trail

---

## 8. Success Metrics & KPIs

Measure RE-RFME framework effectiveness across customer outcomes, operational efficiency, and revenue impact.

### Primary Metrics (30–90 Day Window)

| KPI | Target | Measurement Method | Owner |
|-----|--------|-------------------|-------|
| **Dormant Lead Recovery Rate** | 8–15% of P3–P5 leads move to P2+ within 90 days | Segment migration tracking in Lais CRM | Broker Manager |
| **Response Rate (P3–P4 Campaigns)** | 2.3x cold outreach baseline (target: 18–24% first-touch response) | WhatsApp/SMS delivery + reply tracking | Marketing |
| **Campaign ROI (Dormant Recovery)** | R$8–15 cost per engaged lead vs. R$60+ new acquisition | Cost per campaign vs. contact cost | Finance |
| **Time-to-Close (P0–P1)** | <72 hours from P0 notification to signed offer | Contract date - P0 flag date | Sales |
| **Score Migration Rate** | 25–35% of leads move up 1+ tier within 60 days | Segment change frequency | Analytics |
| **Close Rate by Segment** | Champion 45–60%, High Potential 28–40%, Warm 12–20%, At-Risk 5–8%, Dormant 3–6% | Closed deal flag vs. RE-RFME score at contact | Sales |

### Secondary Metrics (60–180 Day Window)

| KPI | Target | Measurement Method | Owner |
|-----|--------|-------------------|-------|
| **Revenue Attribution per Segment** | Champion avg. R$XXK per close, High Potential R$XX K, Warm R$XK, Dormant R$X K | Contract value × close date linked to lead RE-RFME at close | Finance |
| **Broker Adoption Rate** | 90%+ of brokers use Lais notifications for segment actions within 60 days | Login + notification interaction frequency | Product |
| **Message Volume & Quality** | P0–P2 average 4–6 touches per lead per month; open rate >85% (WhatsApp) | Message tracking, open/reply analytics | Broker Manager |
| **LGPD Compliance Rate** | 100% of campaigns pre-approved via N-25 gate; zero complaints | Campaign audit trail, legal review | Legal/Compliance |
| **Database Data Quality** | >95% of leads with budget info; >80% with last-contact date within 120 days | Data completeness audit, field coverage report | CRM Admin |

### Tertiary Metrics (Ongoing Monitoring)

| KPI | Target | Measurement Method | Owner |
|-----|--------|-------------------|-------|
| **Notification Accuracy** | <5% false positive rate (P0 flags that don't close within 48h) | Notification trigger analysis vs. outcome | Analytics |
| **Segment Stability** | 60–70% of leads remain in same segment week-to-week (avoid over-churn) | Segment change frequency distribution | Analytics |
| **Cost of Dormant Recovery vs. New Lead** | Reengagement 50–70% cheaper than new acquisition | Cost per engaged lead × conversion rate | Finance |
| **Win Rate Lift from Reengagement** | Dormant reengagement 2–3x higher close rate than cold leads | Close rate comparison by lead source | Sales |

### Dashboard & Reporting

**Weekly Broker Dashboard:**
- RE-RFME segment summary: % in each tier, trending up/down
- P0 action list: leads requiring immediate attention (sortable, filterable)
- Campaign performance: current active campaigns, response rate YTD
- Personal KPI: each broker's segment mix, close rate by segment

**Monthly Executive Report:**
- Dormant recovery rate, revenue impact, ROI vs. new acquisition
- Segment migration trends: cohort analysis (leads acquired 90 days ago → where are they now?)
- LGPD compliance audit: campaigns launched, compliance rate, any deletion requests
- Recommendations: segments to focus on, enrichment priorities, campaign optimization

---

## 9. Conclusion

The RE-RFME Scoring Framework operationalizes dormant lead recovery within Lais da Imobiliária. By synthesizing Recency, Frequency, Monetary qualification, and Engagement signals into a unified 5–25 scale, the framework enables:

1. **Segment clarity:** Seven distinct personas (Champion through Archive Candidate) with clear behavioral profiles and priority tiers
2. **Automated intelligence:** Lais notifications (N-01 through N-25) route leads to the right broker action at the right moment
3. **Data-driven strategies:** Tailored engagement playbooks maximize conversion within each segment's unique risk/opportunity profile
4. **Compliance assurance:** LGPD gates ensure all reengagement campaigns respect consent and privacy rights
5. **Measurable impact:** Clear KPIs track recovery rate, ROI, and revenue attribution by segment

With 60–72% of Brazilian real estate leads going dormant and reengagement delivering 50–70% cost savings vs. new acquisition, RE-RFME is the strategic framework that transforms cold leads into closed deals at scale.

---

**Document Version:** 1.0
**Date:** March 17, 2026
**Author:** Lais CRM Product & Analytics Team
**Review Status:** Ready for Broker Pilot (Phase 1–2)
**Next Review:** April 30, 2026 (post-Phase 1 results)