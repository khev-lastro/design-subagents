# Lead Reengagement Rules and Operational Framework for Brazilian Real Estate CRM
**Lais da Imobiliária**

**Date:** February 24, 2026
**Document Type:** Strategic Research Report & Product Specification
**Prepared For:** Product, Engineering, and Strategy Teams
**Companion Document:** lead-reengagement-brazil-2026-02-23.md (Market Opportunity Analysis)

---

## Executive Summary

The preceding market opportunity report established that Brazil's real estate market presents a significant reengagement opportunity: 40–60% of leads acquired by agencies go dormant without being lost, representing R$150M–R$300M in unrealized commission across the top 500 agencies. This report shifts from market opportunity to operational implementation. It answers the question product and engineering must solve: **What are the specific rules, triggers, thresholds, classifications, and logic that a reengagement system must implement?**

Effective reengagement is not a single feature—it is a coordinated system of classification rules, trigger logic, suppression patterns, and human-in-the-loop guardrails. This report delivers implementable rules across five operational domains: (1) **Reengagement Situations and Triggers**—the events and time horizons that initiate contact; (2) **Lead Selection Rules**—which leads are eligible for reengagement and how to classify them; (3) **Expected Outcomes by Scenario**—response rates, conversion chains, and cost-per-reactivation benchmarks; (4) **Intelligent and Automatic Reengagement Rules**—CRM automation patterns, behavioral signals, and suppression logic; and (5) **Business Rules Framework**—a unified decision hierarchy and escalation model.

Each section combines Brazilian market context (Selic rates, MCMV programs, LGPD compliance, WhatsApp dominance, regional seasonality), proven patterns from leading platforms (GoCRM, BoldTrail, Conversica), and quantitative thresholds derived from PropTech benchmarks. The rules are specific enough for engineering to implement, flexible enough for agencies to adapt, and rigorous enough to maintain LGPD compliance and sustainable contact frequencies.

A dormant lead is reengageable when it meets three conditions: (1) silence is explained by economic friction, not rejection; (2) a triggering event or time threshold has passed; and (3) the lead's preferences match current or upcoming inventory or market conditions. Implementing this framework correctly transforms dormant databases from sunk costs into renewable revenue streams.

---

## SECTION 1: REENGAGEMENT SITUATIONS AND TRIGGERS

Reengagement is initiated by three categories of triggers: time-based (dormancy thresholds), event-based (market or behavioral), and CRM-based (internal status changes). Each trigger type has distinct urgency, message frames, and expected response rates.

### 1A. Time-Based Triggers and Dormancy Brackets

The dormancy clock measures time elapsed since the last meaningful interaction (contact attempt, message sent, or engagement by lead—whichever is more recent). Meaningful interaction includes: agent call, message sent, email opened, message reply, portal login, property view, or inquiry submission. Non-meaningful activity (message delivered but not read, or email bounce) does not reset the clock.

| Dormancy Bracket | Days Elapsed | Trigger Strategy | Expected WhatsApp Response | Segment Customization |
|---|---|---|---|---|
| **WARM_STALE** | 14–30 days | Gentle check-in or new listing match | 25–30% | Standard; adjust by segment (below) |
| **COLD_A** | 30–60 days | New listing match, market update, or time-based nudge | 15–20% | See segment rules |
| **COLD_B** | 60–90 days | Direct re-qualification probe, multi-channel (WhatsApp + SMS) | 8–12% | See segment rules |
| **COLD_C** | 90–180 days | Event-triggered only (Selic change, new inventory) | 5–10% | Event-driven preferred |
| **DORMANT** | 180–360 days | Economic/lifecycle event trigger only | 3–7% | Behavioral signal needed |
| **ARCHIVE** | 360+ days | Structured campaign only, compliance check | 1–3% passive; 8–15% systematic | Requires consent refresh |
| **EXPIRED** | 730+ days | No outreach without fresh LGPD consent | N/A | Archived; requires opt-in |

**Dormancy Clock Reset Rules**

The dormancy clock resets to zero when:
- Lead replies to any message (any channel)
- Lead submits new inquiry form
- Lead initiates contact (call, message, email, portal submission)
- Agent initiates contact and lead responds

The dormancy clock does NOT reset when:
- Message is delivered (only when read + no-action, clock continues)
- Email is opened without click or reply (clock continues; minor recency boost only)
- Lead is contacted but does not respond (clock pauses for 14 days, then resumes)
- Lead visits portal but takes no action (clock pauses for 7 days for portal visit)

**Segment-Specific Dormancy Clock Adjustments**

Real estate segments have different decision cycles and platform-switching risk. Adjust first trigger thresholds and frequency as follows:

**MCMV Buyers (Government-subsidized housing):**
- First trigger: 21 days (not 14–30) — MCMV segment has extremely high platform-switching risk; competitors are aggressive; loss aversion dominates
- Frequency after first trigger: 2–3x per week for COLD_A phase (if no response after 7 days, introduce second agent or offer family-friend referral messaging)
- Rationale: MCMV buyers are usually first-time homebuyers with limited price sensitivity and high motivation. Long silence often signals switching to competitor, not loss of interest. Faster re-entry wins them back.

**Investor Leads (Buy-to-rent or fix-and-flip):**
- First trigger: 45 days (not 30–60) — investors have longer analysis cycles; require ROI justification; resent frequent "time-sensitive" framing
- Frequency after first trigger: 1x per week, event-based preferred (Selic change, new neighborhood yield analysis, cap rate shifts)
- Rationale: Investor leads need data, not urgency. One month of silence is normal while they model returns.

**Rate-Sensitive Mid-Market (Owner-occupiers with mortgage awareness):**
- First trigger: 30 days
- Frequency: monthly thereafter if no response (tied to Selic releases on Tuesdays)
- Rationale: Mid-market leads are informed; they are waiting for rate news or compensation cycles. Synchronize to economic events, not time.

**Luxury Segment (Properties above R$1.5M typically):**
- First trigger: 60 days — luxury buyers expect high-touch, not high-frequency
- Frequency: all automated contact requires human agent review (no fully-automated sequences; agent customizes each message)
- Rationale: Luxury is relationship-driven. Automation destroys perceived exclusivity. Treat as high-touch; humans only.

**Renters Evaluating Purchase (Lease-to-own pathway):**
- First trigger: 14 days — the lease expiry date is the most valuable data point; capture it at intake
- Frequency: multi-wave campaign tied to lease expiry: expiry-minus-90 days (awareness), expiry-minus-60 days (affordability check), expiry-minus-30 days (urgency/close)
- Special field: **Lease Expiry Date** — mandatory intake field for this segment; if not captured, treat as standard WARM_STALE at 14 days
- Rationale: Renters have the hardest deadline. Use it as the primary trigger, not secondary.

### 1B. Event-Based Triggers

Event-based triggers fire regardless of dormancy bracket. They may bypass dormancy thresholds entirely (e.g., new MCMV lançamento fires on all MCMV leads, even if last contacted 3 days ago) or move a lead up one dormancy tier (e.g., a Selic decrease moves COLD_B leads to COLD_A tier for re-contact eligibility).

**Market Events Trigger Table**

| Market Event | Target Lead Segments | Trigger Condition | Message Frame | Priority | Dormancy Bypass Rules |
|---|---|---|---|---|---|
| Selic rate decrease by 0.5%+ | Rate-sensitive mid-market, all MCMV | Central Bank Selic release (Tuesdays) | "Mortgage rates dropped—you may now afford properties up to R$X" | Critical | Bypass WARM_STALE, COLD_A, COLD_B; fire same day |
| Selic rate increase by 0.5%+ | Investor leads, rate-sensitive | Central Bank Selic release (Tuesdays) | "Rental yields rising—properties now yielding Y%" | Medium | COLD_B and older only; delay 2 days |
| MCMV teto increase | All MCMV leads | Government announcement (irregular; monitor official channels) | "New properties now eligible under your income bracket" | Critical | All dormancy tiers; fire within 48 hours |
| New MCMV lançamento announced in lead's preferred region | MCMV leads in region | Developer announcement + agency confirmation | "New MCMV units launching in [neighborhood]—early bird pricing available" | High | Bypass dormancy; fire within 24 hours |
| Property price drop matching prior preference | All segments, all dormancy tiers | Listing price reduction on property lead viewed/saved | "Price dropped R$X—this property now matches your budget" | High | Bypass dormancy; fire within 2 hours |
| New listing matching saved search | All segments, WARM_STALE through COLD_B | Listing ingestion matching lead's saved criteria (price, location, type) | Portfolio notification: "New [type] in [neighborhood] at R$X—matches your search" | High | WARM_STALE through COLD_B; skip COLD_C+ |
| Bank/Caixa mortgage promotion | Rate-sensitive, first-time buyers | Bank press release or promotion calendar (seasonal, predictable) | "Limited-time financing rates available—[Rate]% for [term]" | High | All dormancy tiers; fire within 48 hours of announcement |
| Quarterly market appreciation report | Investor leads | Quarterly release (Jan, Apr, Jul, Oct) | "Your region appreciated Y% this quarter—ROI updated" | Medium | COLD_B and older; fire 3 days after release |
| New rental yield index release | Investor leads, income-property buyers | Quarterly release, platform-specific (ZAP, Vivareal, Lais if available) | "Yields in [neighborhood] up to X%—2-year trend" | Medium | COLD_B and older; fire 3 days after release |

**Behavioral Events Trigger Table: Highest-Value Signals**

Behavioral events are inbound intent signals from silent leads. They are the strongest reengagement triggers because they indicate genuine, unprompted interest. Treat them with highest priority and fastest response.

| Behavioral Signal | Current Lead Status | New Status | Automation Action | Human Action | SLA |
|---|---|---|---|---|---|
| Returns to portal after 90+ days silence | COLD_C | Immediately WARM_STALE | Send top 3 listings matching prior searches via WhatsApp | Agent receives alert with engagement summary | <15 min |
| Clicks listing link in email from agency | DORMANT | COLD_A | Auto-send 3 similar listings; queue agent notification | Agent receives notification; personalized follow-up optional | <5 min |
| Opens email from agency (tracked)* | COLD_B | COLD_A | Trigger WhatsApp follow-up referencing email; mention specific listing if clicked | Agent receives email-open notification | <4 hours |
| Replies to any WhatsApp message | Any | ACTIVE | Pause all automation immediately; route to lead's assigned agent or available agent | Agent takes conversation; no further automation | Immediate |
| Saves multiple properties in single session | COLD_C | COLD_B | Auto-send property-match sequence (Days 0, 3, 7); notify agent of session activity | Agent receives session summary; may personalize follow-up | <1 hour |
| Submits new inquiry form | Any | HOT | Agent contact within 5 min; stop all scheduled automation; pause reengagement sequences | Agent takes over entirely; leads list routing | <5 min |
| Views listing 3+ times (tracked in lead timeline) | Any | Escalate one tier | Auto-send personalized listing message with agent intro; alert agent | Agent receives alert with view frequency; may offer showing | <30 min |

*Email tracking requires pixel-based opens tracking (industry standard, available via Mailchimp, SendGrid, or platform-native tools).

**Life Events and Calendar Triggers**

| Life Event / Calendar Trigger | Trigger Condition | Intake Field Required | Message Frame | Frequency |
|---|---|---|---|---|
| Lease expiry signal | Lease expiry date captured at intake; fire at T-90, T-60, T-30 days | **Lease Expiry Date** | "Your lease ends in 90 days—let's find your next home" → "60 days left—we have 5 options for you" → "30 days—time to decide" | 3-wave escalation |
| Rent increase announcement | Rent increase confirmed (by lead or market data if available) | Rent amount (optional) | "Is your rent increasing? Owning may now cost less than renting" | One-time, within 48 hours of signal |
| Birthday proximity | Birthday captured at intake; fire 3–7 days before birthday | Date of Birth | Warm relationship message (not sales pitch): "Happy Birthday! Here's a curated selection of homes for your next chapter" | Once per year |
| Agency anniversary with lead | Lead's first contact date; fire at 12-month anniversary | Intake date (automatic) | "We've been in touch for a year—let's reconnect and review what's changed for you" | Once per year |
| Post-Carnaval return | Calendar trigger (February/March, variable) | None | "Welcome back! Here's what's new in your favorite neighborhoods" | Once per year |
| Post-July school vacation reactivation | Calendar trigger (early August, school breaks end) | None | "Back to routine—new family-friendly homes ready for viewings" | Once per year |
| September pre-peak campaign | Calendar trigger (September 1–15) | None | "October–November are the busiest months—lock in your favorite neighborhoods now" | Once per year |
| Brazilian tax season (IRPF) filing | Calendar trigger (March 1 - April 30) | Investment property owner status (if known) | "FGTS available for property purchase—we can show you how to use it" | Once per year (investor segment) |
| FGTS anniversary eligibility | Employment start date captured at intake; employee becomes eligible after time threshold (varies by employer; default 3 years) | **Employment Start Date** (for MCMV/FGTS-eligible leads) | "You're now eligible for FGTS withdrawal—R$X available for down payment" | One-time upon eligibility |
| MCMV income bracket expansion announcement | Government announcement (irregular; varies) | Lead's declared income bracket | "New MCMV properties now available in your income range" | Irregular (triggered by government policy) |
| New MCMV unit launch in lead's region | Developer/MCMV program announcement + agency confirmation | Lead's preferred city/neighborhood (captured at intake) | "New MCMV units launching [neighborhood]—registration opens soon" | Triggered by program announcement |
| FGTS withdrawal rule changes | Government policy change (announced, varies) | MCMV/FGTS-eligible lead status | "FGTS rules changed—you may now withdraw more for property purchase" | Triggered by government policy |

### 1C. CRM Event Triggers

CRM-level status changes and system events trigger reengagement protocol adjustments:

| CRM Event | Trigger Condition | Action | Responsible Party |
|---|---|---|---|
| Agent reassignment | Lead is reassigned to new agent (voluntary, escalation, turnover) | New agent sends warm introduction message via WhatsApp within 24 hours: "Hi [name], I'm [new agent]—I'd like to continue helping you find your home" | New agent |
| Lead score crosses HIGH threshold (70+) | RE-RFME score rises above 70 due to behavioral activity or data update | Alert assigned agent; flag for phone outreach or video call (per agent preference) | System → Agent |
| Lead score crosses MEDIUM threshold (40–69) | Score rises from LOW to MEDIUM | Auto-qualify for event-triggered campaigns; enable behavioral-signal monitoring | System |
| Data enrichment returns valid contact | Third-party enrichment (ThinkData, ZAP API, etc.) fills in missing phone or WhatsApp after initial import | Re-enter lead into reengagement sequences at appropriate dormancy tier | System |
| Campaign opt-out rate exceeds 5% | Any campaign producing 5%+ unsubscribe rate across all leads receiving it | Pause campaign immediately; alert campaign manager and product team for review | System → Manager |
| Manual lead status change (agent to LOST) | Agent manually marks lead as LOST with reason tag (competed, relocated, purchased elsewhere, no budget, disinterested) | Remove from all automated reengagement; archive; do not re-enter without explicit agent override | Agent (with audit log) |
| Manual lead reactivation (agent to WARM_STALE) | Agent manually reactivates a DORMANT or LOST lead (with reason: new inventory match, lead reached out, external event) | Reset dormancy clock to zero; add reason tag to lead record; fire reengagement sequence | Agent (with audit log) |

---

## SECTION 2: LEAD SELECTION RULES — WHICH LEADS TO REENGAGE

Not all dormant leads should be reengaged. Reengagement is only appropriate when silence is economic, not definitive. This section defines the classification rules that separate reengageable dormant leads from lost leads requiring archival.

### 2A. Dormant vs. Lost: The Core Classification

**DORMANT: Reengageable**

A lead is classified as DORMANT (and thus eligible for reengagement) when ALL of the following are true:

1. **Reason for silence is economic friction** — Lead went silent due to factors outside the agency's control: (a) rate environment prevented affordability; (b) job transition or income adjustment; (c) saved for down payment; (d) family decision pending; (e) preference mismatch (neighborhood no longer available). Lead has not expressed dissatisfaction with agency.

2. **No explicit rejection** — Lead has not said "no longer interested," "found a property," "working with another agent," or equivalent. No opt-out submitted. No complaint or legal dispute.

3. **Preferences are matchable** — Lead's stated preferences (price range, neighborhood, property type) have or will soon have matching inventory available. If lead wants a 2-bed under R$300k in Leblon and Leblon inventory is entirely above R$600k, lead is not reengageable (mismatch, not silence).

4. **LGPD consent is valid** — Consent is dated, active, and not expired. Consent was obtained via acceptable channel (portal opt-in, email confirmation, WhatsApp confirmation, in-person). No LGPD deletion request received.

5. **Contact data is valid** — At least one contact method is confirmed active: (a) phone number validates via API (not disconnected); (b) WhatsApp number confirmed active via WhatsApp validation; (c) email has no hard bounce history.

6. **Last interaction ended on neutral terms** — Last message or interaction did not end with agent apology, complaint resolution, or negative sentiment. Last touch was standard inquiry follow-up, message, or communication.

7. **Within realistic decision window for stated situation** — If lead stated "saving for 2 years," dormancy of 1 year is within the window. If lead is MCMV-eligible and dormant 18 months, likely has transacted elsewhere; re-evaluation needed.

**LOST: Archive, No Campaign**

A lead is classified as LOST (and must be archived; no automated reengagement permitted) when ANY of the following are true:

1. **Explicit rejection** — Lead explicitly stated: "I'm not interested," "I bought elsewhere," "I rented another place," "Working with another agent," "Out of market," "No budget." Explicit rejection is documented.

2. **Transaction completed** — Lead has purchased a property, signed a lease, or invested in real estate. Confirmed via deed verification, lease signing, or lead self-report. Lead is no longer in market.

3. **Formal LGPD opt-out or unsubscribe** — Lead submitted LGPD Article 17 deletion request or clicked unsubscribe link. Consent is revoked.

4. **Strong negative sentiment or complaint** — Lead expressed dissatisfaction, frustration, or complaint. Complaint is documented in CRM notes. Example: lead was misled on financing, property was misrepresented, agent was disrespectful. Reengagement would violate trust.

5. **Contact data exhausted and unrecoverable** — All phone numbers disconnected (3+ validation attempts failed). Email hard-bounced. WhatsApp confirmed inactive. ThinkData and third-party enrichment could not recover valid contact. Lead is unfindable.

6. **Non-responsive across 10+ sustained touchpoints over 18+ months** — Lead received 10+ contact attempts across all channels (WhatsApp, SMS, email, phone, portal), spanning 18 months, with zero response and no behavioral engagement (no portal visit, no email open, no link click). At this threshold, lead is not reengageable; time and cost are better spent on acquisition.

**ARCHIVE: Do Not Campaign**

A lead is classified for ARCHIVE (indefinite pause, no campaigns, searchable but passive) when ANY of the following are true:

1. **Meets LOST criteria** (see above)

2. **Dormant 36+ months with zero behavioral signals** — 3 years of silence with no portal visit, email open, link click, or message delivery confirmation. Preferences are likely obsolete; contact data likely invalid.

3. **Data quality too poor to address** — Name field is missing or unintelligible; no phone, no WhatsApp, no email; enrichment failed; unrecoverable.

**EXPIRED: Purge or Quarantine**

A lead record is EXPIRED and must not be contacted without fresh LGPD consent when:
- **Dormant 730+ days (2 years)** — No contact, no behavioral signal, LGPD consent is presumed stale. Recapture consent before any outreach.
- **Explicit LGPD deletion request received** — Do not process leads through any system; purge from all databases per LGPD Article 17 requirements.

### 2B. RE-RFME Scoring Framework

The RE-RFME model (Recency, Frequency, Monetary proxy, Engagement) adapts the classic RFM customer scoring to real estate reengagement. It scores leads on a 0–100 scale, updated weekly or upon behavioral event.

**Component Definitions**

| Component | Definition | Data Source | Example Scoring |
|---|---|---|---|
| **Recency (R)** | Days since last meaningful interaction (message sent, contact attempt, or engagement by lead) | CRM last-touch field (auto-updated) | 0–30 days = 25 pts; 31–90 = 20 pts; 91–180 = 15 pts; 181–360 = 5 pts; 360+ = 0 pts |
| **Frequency (F)** | Number of interactions across lead lifecycle (portfolio views, messages sent, replies, property viewings booked) | CRM interaction log or activity count | 10+ interactions = 25 pts; 5–9 = 20 pts; 2–4 = 10 pts; 1 = 5 pts |
| **Monetary (M)** | Property value target or declared budget range (proxy for deal size and commission) | Intake form, lead qualification, declared budget | R$500k+ = 25 pts; R$300–500k = 20 pts; R$150–300k = 15 pts; <R$150k = 10 pts; unknown = 5 pts |
| **Engagement (E)** | Behavioral activity: portal views, email opens, link clicks, WhatsApp message deliveries, property saves | Behavioral tracking (pixel, portal logs, API) | 10+ portal views in last 30 days = 25 pts; 5–9 = 20 pts; 2–4 = 10 pts; 1 = 5 pts; email opens/clicks = 5 pts each |

**Total Score Calculation**

Sum of R + F + M + E = 0–100. Example: Lead A dormant 45 days (R=20) + 8 interactions (F=20) + R$350k budget (M=20) + 6 portal views in 30 days (E=20) = **80 total**.

**RE-RFME Clusters and Reengagement Tiers**

| Cluster | Score Range | Size | Reengagement Strategy | Channel Mix | Frequency | Expected Reactivation Rate |
|---|---|---|---|---|---|---|
| **High Value** | 70–100 | Top 20% | Immediate outreach; agent-led; personalized; fast-track to appointment | WhatsApp primary + phone | 2–3x/week | 25–40% |
| **Promising** | 40–69 | Next 30% | Automated + human review; behavioral-trigger preferred; event-based campaigns strong | WhatsApp primary + email + SMS | 1–2x/week | 8–15% |
| **Needs Attention** | 20–39 | Next 25% | Behavioral-trigger dependent; no proactive outreach unless event fires | Event-triggered only | 1–2x/month | 2–5% |
| **Needs Activation** | 0–19 | Bottom 25% | Bulk campaigns only; consent verification required; archive if no engagement after 90 days | Email/SMS bulk | 1x/month | <2% |

**Lead Score Decay Rule**

To prevent stale high scores from burying newer, active leads: **Reduce score by 25% monthly without new activity.** Example: Lead with score 80 goes uncontacted for 30 days; new score = 80 × 0.75 = 60. After 60 days of inactivity: 60 × 0.75 = 45.

Decay resets to zero upon any interaction: lead replies, views portal, opens email, etc.

**Default Threshold Guidance**

- **70–100:** High priority; immediate agent review and outreach
- **40–69:** Medium priority; eligible for automated and event-triggered campaigns
- **0–39:** Low priority; extended nurture only; bulk campaigns acceptable

### 2C. Hard Exclusion Rules (Mandatory — System Enforced)

These 13 rules are non-negotiable. Any lead meeting ANY of these conditions must be suppressed from ALL reengagement campaigns. Violation risks legal liability (LGPD), brand damage, or wasted spend.

1. **LGPD opt-out received** — Lead submitted LGPD Article 17 deletion request or checked "do not contact" box. Permanent block, all channels, all campaigns. Document deletion timestamp. Purge from systems within 30 days per LGPD.

2. **LGPD data deletion request** — Lead exercised LGPD Article 17 right. Remove from all systems. Maintain deletion log only. No contact henceforth.

3. **LGPD consent expired without refresh** — Consent is dated and has exceeded expiration (default 24 months; may vary by consent type). Lead is blocked until fresh consent is captured.

4. **Minor (under 18) without documented guardian consent** — If lead is under 18, guardian consent must be documented in CRM. If absent, suppress entirely.

5. **Active complaint or legal dispute** — Lead has filed complaint with agency, regulator, or legal action is pending. Block automation; route to legal/management. Exclude from campaigns until resolved.

6. **No valid phone number (all disconnected)** — All phone numbers on file failed validation API check (3+ attempts). No SMS possible. Fallback to email/WhatsApp only if those exist.

7. **No confirmed WhatsApp** — If WhatsApp is primary channel strategy but number has not been validated via WhatsApp API, suppress WhatsApp-only campaigns; fallback to SMS/email.

8. **No valid email (hard bounce)** — Email address has hard-bounced on 2+ attempts (invalid domain, mailbox full permanently, spam complaint). Use phone/WhatsApp only; do not send email.

9. **Data more than 25% likely outdated** — Brazilian real estate benchmark shows ~25% of RE contact records decay annually. If lead record is 2+ years old with no validation attempt, mark as "outdated data"; suppress until enriched and revalidated.

10. **Active agent conversation in progress** — Lead has replied to agent or agent is actively working lead (status not COLD_A or dormant; status is ACTIVE, HOT, or QUALIFIED). Suppress all automation; route to assigned agent.

11. **Lead contacted by any channel in last 7 days** — Agency has reached out within 7 days (WhatsApp, SMS, email, phone, message, portal notification). Suppress additional contact; respect frequency cap.

12. **Lead tagged as competitor agent or press** — Lead is known to represent competing agency, media, or data scraper. Do not contact; flag for management.

13. **Lead classified as LOST with negative sentiment tag** — Lead is marked LOST and CRM notes contain tags: "no budget," "disinterested," "competitive," "complaint," "misrepresentation." Archive; do not reengage without explicit agent override.

### 2D. Data Quality Thresholds

Data quality directly determines reengagement success. Leads with invalid or outdated contact data waste campaign budget and risk compliance violations. Use this table to enforce minimum thresholds:

| Data Field | Requirement | Action if Failed | Re-Entry Condition |
|---|---|---|---|
| **Phone** | Valid, active (not disconnected), passes carrier validation API | Attempt ThinkData enrichment (1 attempt); if failed, suppress phone outreach | Valid phone confirmed via API; re-enter at current dormancy tier |
| **WhatsApp** | Confirmed active via WhatsApp Business API validation (not assumed from phone; validated) | Fallback to SMS/email only; do not send WhatsApp | WhatsApp API re-validates number; re-enter WhatsApp tier |
| **Email** | No hard bounce in prior 2 sends; domain valid | Use phone/WhatsApp only; remove from email campaigns | Fresh email captured (form, phone, or enrichment); no recent bounce history |
| **Name** | Minimum: first name present, not gibberish | Without first name, suppress personalized campaigns; send generic-placeholder only | Full name captured; re-enter |
| **Price range / Budget** | Approximate range declared (e.g., R$200k–R$400k) | Without budget, send generic market content only; exclude property-match sequences | Budget captured via form or enrichment; re-enter |
| **LGPD Consent** | Valid, dated, method of capture recorded (portal, email, WhatsApp, in-person), not expired | Hard stop; trigger consent-refresh workflow only | Fresh LGPD consent captured (dated, method logged); re-enter |

---

## SECTION 3: EXPECTED OUTCOMES BY SCENARIO

Reengagement success varies dramatically by channel, dormancy age, segment, and campaign sophistication. This section provides quantified benchmarks drawn from PropTech platforms, Brazilian market data, and industry standards.

### 3A. Response Rates by Channel

Response rate = percentage of leads who respond (reply, click, or take action) after receiving message, within 24 hours or campaign window.

| Channel | 24-Hour Read Rate | Response Rate | Notes | Context |
|---|---|---|---|---|
| **WhatsApp** | 85–95% | 35–50% | Dominant channel in Brazil; first-message response highest; reads are >24h | Includes "seen" read-receipts; response = actual reply or action |
| **SMS** | 97–99% delivery | 10–20% | 7–10x higher response than email; backup to WhatsApp; costly per-message | Highest delivery; lowest response; best as secondary validation |
| **Email** | 15–25% open rate | 1–3% reply rate | Rich content; poor response; requires link click or explicit reply | Low effectiveness for reengagement; use for content, not direct asks |
| **Phone** | 5–15% contact rate (reached person) | 40–70% of contacts convert to conversation | Highest conversion when contact achieved; expensive (agent time); best for HIGH-VALUE cluster | Best for close; worst for outreach volume |
| **Social / Meta / Instagram** | Impressions only | CTR 0.5–2% | Retargeting, awareness; not direct response channel | Ambient support; brand building; not tracked as direct reengagement |

**Channel Selection by Dormancy and Segment**

- **WARM_STALE (14–30 days):** WhatsApp only, 1 message. If no response in 7 days, add SMS on Day 10.
- **COLD_A (30–60 days):** WhatsApp + SMS (48-hour gap); follow with email link to new listings.
- **COLD_B (60–90 days):** WhatsApp + SMS (24-hour gap) + email (Day 5); multi-touch required.
- **COLD_C to DORMANT (90+ days):** Event-driven preferred; if time-based, WhatsApp + SMS, spaced 48+ hours apart; no email unless content-focused.
- **ARCHIVE (360+ days):** Email campaign only; WhatsApp/SMS only if explicit consent refreshed.

### 3B. Reactivation Rates by Dormancy Age

Reactivation rate = percentage of contacted leads who re-engage (respond, visit portal, book appointment, or provide intent signal).

**By Dormancy Bracket**

| Dormancy Bracket | Passive Campaign (1 touch) | Systematic Campaign (multi-touch, multi-channel) | Lift Factor |
|---|---|---|---|
| 14–30 days (WARM_STALE) | 5–8% | 25–35% | 4–5x |
| 30–90 days (COLD_A/B) | 2–4% | 15–20% | 5–7x |
| 90–180 days (COLD_C) | 0.5–2% | 8–12% | 6–8x |
| 180–360 days (DORMANT) | <1% | 5–10% | 8–10x |
| 360+ days (ARCHIVE) | Negligible | 3–6% (structured campaign, consent verified) | 10–15x |

**By Segment (Highest to Lowest Reactivation Potential)**

Segment ranking assumes matched messaging, proper dormancy tier, and event/market alignment:

| Rank | Segment | Reactivation Rate | Rationale |
|---|---|---|---|
| 1 | MCMV buyers (government-backed) | 60–80% | Government backing reduces risk; genuine need; vulnerable to competitor switching if silent too long |
| 2 | Renters near lease expiry (calendar-driven) | 50–70% | Hard deadline (lease end); compulsion to act; time-bounded window |
| 3 | Rate-sensitive buyers (conditional on Selic) | 40–60% | Re-engagement timed to rate release; new affordability changes decision calculus |
| 4 | Mid-market owner-occupiers (non-Selic) | 30–50% | Stable demand; lower urgency; longer decision cycles |
| 5 | Investor leads (buy-to-rent) | 20–40% | Long analysis cycles; data-driven; lower psychological urgency |
| 6 | Luxury segment (R$1.5M+) | 15–30% | Relationship-dependent; low frequency tolerance; automation destroys perceived value |

### 3C. Conversion Chain and Time-to-Close

The reengagement conversion funnel is: Response → Requalification → Appointment → Proposal → Close.

| Stage | Conversion Rate | Notes |
|---|---|---|
| **Contact to Response** | 15–30% | Leads who engage after reengagement message |
| **Response to Requalification** | 30–50% of responders | Agent qualifies intent, budget, timeline; requalify (circumstances may have changed) |
| **Requalified to Appointment Booked** | 40–60% of requalified | Offer viewing; many requalified leads book showing |
| **Appointment to Proposal** | 25–40% of appointments | Lead sees property; agent presents financing options; proposal prepared |
| **Proposal to Close** | 8–15% of reactivated leads (end-to-end) | Typical range; varies by segment (MCMV at top, luxury at bottom) |

**Median Time-to-Close**

- **Warm reengaged leads:** 45–120 days from reactivation message to close
- **Cold-to-warm transition:** 180–360 days (full re-qualification + market re-education needed)
- **MCMV segment:** 30–60 days (shorter cycle; government program moves faster)
- **Investor segment:** 90–180 days (longer analysis; ROI modeling)
- **Luxury segment:** 180–360+ days (relationship-building, multiple viewings)

**Agency-Level ROI Math**

For every 100 leads in a systematic multi-channel campaign:
- ~1–4 close successfully (1–4% end-to-end close rate)
- At average commission R$16,000–R$30,000 per transaction
- **100-lead campaign ROI:** 1 close × R$16,000 = R$16,000 (low end); 4 closes × R$30,000 = R$120,000 (high end)
- **500-lead database:** 5–20 closures = R$80,000–R$600,000 incremental revenue from reengagement

These are already-acquired leads, zero acquisition cost, making reengagement one of the highest-ROI product improvements available to agencies.

### 3D. Opt-Out Rate Benchmarks by Frequency and Personalization

Opt-out (unsubscribe, LGPD block request) is a quality metric. High opt-out rates signal poor message-market fit or over-contact.

| Campaign Type | Frequency | Opt-Out Rate | Assessment |
|---|---|---|---|
| Generic batch messaging | Weekly | 8–15% | Unacceptably high; destroys database value quickly; causes reputational damage |
| Generic batch messaging | Monthly | 3–6% | High; indicates message perceived as spam; unsustainable long-term |
| Personalized, value-add (market updates, new listings) | Weekly | 2–4% | Short-term acceptable; weekly frequency with generic message still erodes trust |
| Personalized, value-add | Bi-weekly | 0.5–2% | Industry standard; sustainable; WhatsApp + behavioral triggers achieve this |
| Event-triggered, personalized (Selic alert, price drop, lease expiry) | Event-driven (avg 1x/month) | 0.2–1% | Best practice; highly contextual; low surprise/annoyance |

**Critical Threshold Rule**

**Any campaign producing opt-out rate above 5% must pause automatically and require manager review.**

Rationale: A 5% opt-out on a 1,000-lead database = 50 permanently blocked contacts per wave. Each contact costs R$80–R$150 to acquire. 50 × R$115 = R$5,750 in sunk value per campaign. Repeated waves destroy database.

**Opt-Out Recovery Path**

Leads who opt out should NOT be re-solicited without explicit re-consent. Recovery options:
1. Pause for 90 days; then send one low-frequency, high-value summary (quarterly market trends)
2. If lead re-engages naturally (visits portal, replies to unrelated inquiry), soft opt-in may be assumed
3. Do not re-add to high-frequency campaigns; require explicit "yes, send me updates" before resuming

### 3E. Cost per Reactivated Lead

Cost per reactivated lead (CPRL) includes all direct costs: messaging (WhatsApp API, SMS, email), data enrichment, validation, and agent time for review and follow-up.

| Reengagement Method | CPRL | Context |
|---|---|---|
| New lead acquisition (baseline, for comparison) | R$80–R$150 | Portals, SEM, offline; baseline cost |
| Database reengagement (multi-touch, systematic) | R$25–R$75 | 50–70% cheaper than acquisition |
| WhatsApp-only campaigns (1–2 touches) | R$5–R$20 | Minimal cost; only if high confidence |
| Multi-channel (WhatsApp + SMS + Email, 3–5 touches) | R$30–R$60 | 70–85% higher effectiveness justifies cost vs. single-channel |
| Data enrichment + validation + campaign | R$40–R$90 | Highest upfront cost; de-duplicates bad data; improves response |

**Cost-Benefit Analysis**

- **WARM_STALE:** CPRL ~R$15 (WhatsApp only); 25–35% reactivation = ~R$43–R$60 cost per actual reactivated lead
- **COLD_A:** CPRL ~R$35 (WhatsApp + SMS); 15–20% reactivation = ~R$175–R$233 per reactivated lead
- **COLD_B:** CPRL ~R$50 (multi-channel); 8–12% reactivation = ~R$417–R$625 per reactivated lead

For a reactivated lead that converts (1–4% close rate, depending on segment), the cost per closed deal is:
- WARM_STALE: R$43–60 ÷ 2.5% = **R$1,720–2,400 cost per close** (vs. R$16,000–30,000 commission—1–7% of deal value)

This is extraordinarily efficient compared to acquisition (typically 20–35% of first deal commission).

---

## SECTION 4: INTELLIGENT AND AUTOMATIC REENGAGEMENT RULES

This section outlines automation patterns, behavioral signal processing, and guardrails. It answers: What should the CRM do automatically? When must humans step in? How do we balance efficiency with personalization?

### 4A. CRM Automation Patterns from Leading Platforms

Four platforms demonstrate viable patterns for reengagement automation:

**GoCRM Pattern: Configurable Dormancy Windows**

GoCRM allows agencies to set a dormancy threshold (default 90 days; configurable to 30/60/180 days). When a lead crosses that threshold inactive, an automation rule fires a configurable message sequence. Key features:
- Agent can customize message templates per sequence
- Dormancy window is adjustable; multiple sequences can stack (e.g., 60-day trigger + 90-day trigger)
- Any incoming communication from lead immediately pauses outbound automation
- Messages send only during business hours (8 AM–9 PM, configurable)
- Wait time between sequence messages is configurable (1–30 days)
- No behavioral signal processing; time-based only

**Weakness:** Blind to behavioral signals; treats all leads identically within dormancy bracket. No prioritization by engagement or segment.

**BoldTrail / HomeSearch AI Pattern: Behavioral Scoring**

BoldTrail (now HomeSearch AI) integrates behavioral signals into real-time scoring. Dormant leads are re-evaluated continuously; when a new listing matches a lead's historical search criteria, the system calculates a match score. If score exceeds threshold:
- System auto-sends personalized property match via WhatsApp (templated, with property images)
- Alerts assigned agent simultaneously
- Agent receives summary: "Lead [name] viewed 5 similar properties 3 months ago; match score 92%"
- Agent can choose: follow up by phone, customize message, or let automation continue
- Behavioral signals (portal visit, email open, link click) immediately escalate lead tier

**Strength:** Combines automation with agent insight; behavioral signals drive timing; no fixed schedule.

**Weakness:** Requires inventory matching engine; non-trivial to implement. Depends on quality of historical preference data.

**Conversica Pattern: Intent Detection and Handraiser Logic**

Conversica is an AI-driven engagement platform that continuously monitors leads. Key features:
- Lead receives regular (but not excessive) automated outreach
- AI analyzes all lead responses for intent signals ("I'm interested," "when can I visit?", "what's the financing?")
- When lead shows intent (handraiser signal), automation **immediately pauses** and routes to human agent
- Re-engagement logic uses AND rule: (lead was dormant in prior campaign) AND (did not become handraiser in that campaign) AND (60+ days since first contact in prior campaign)
- Handraiser detection is pattern-based (keyword triggers: "interested," "available," "call me," etc.)

**Strength:** Clear intent-detection logic; human escalation is automatic; prevents over-messaging engaged leads.

**Weakness:** Requires AI language model and keyword training. Escalation may be false-positive heavy if threshold is low.

**Follow Up Boss Pattern: Action Plans**

Follow Up Boss (real estate CRM) implements "Action Plans" — configurable, multi-step sequences triggered by lead status changes. Key features:
- Agency defines Action Plan: "Cold Lead 90+ Days Dormant" with steps (WhatsApp Day 1, SMS Day 3, Email Day 7, Phone Day 14, etc.)
- When lead status changes to "Cold" or "Dormant," Action Plan automatically fires
- Steps execute in order; wait times are configurable
- After lead completes sequence without response, system creates manual task for agent review: "Decide: Archive or Phone Call?"
- Agent must actively decide; no leads are auto-archived

**Strength:** Transparent, audit-able workflows; agent decision points are explicit; sequences are visible in UI.

**Weakness:** Still time-based; no behavioral signal integration. Requires manual agent review at end of sequence.

### 4B. AI Signals for Predicting Optimal Reengagement Timing

Beyond simple dormancy clocks, AI can predict when a lead is most likely to respond. Use these signals with weighted scoring:

**Primary Signals (Highest Predictive Weight — 40–50% of score)**

1. **Return visit to agency portal after dormancy** — Lead has been away for 90+ days, then logs in and browses. This is the single strongest signal. Response likelihood increases 8–10x. Action: message within 15 minutes.

2. **Specific address view (not category browsing)** — Lead views a particular property multiple times (3+ views), not just browsing neighborhood category. Indicates serious consideration. Action: auto-send 3 similar listings.

3. **Multiple property views in single session after dormancy** — Lead logs in and views 5+ properties in one session after 60+ days silence. High intent signal. Action: agent alert + auto-listing match.

4. **Email link click (property-specific, not generic unsubscribe)** — Lead opens email from agency and clicks a property link (not just opens email). Indicates property interest. Action: WhatsApp follow-up with 3 similar listings.

5. **Saved search modification** — Lead updates their saved search criteria (broadens neighborhood, adjusts price range, changes property type). Indicates evolving preferences and active re-engagement with platform. Action: re-run saved search; send updated results.

**Secondary Signals (Moderate Weight — 20–30%)**

1. **Email open without click** — Email is opened but no link clicked. Weak signal; lead saw headline but not interested enough to click. Use for trigger timing (not prioritization): may send follow-up in 48 hours with better headline.

2. **WhatsApp delivery confirmation (message read)** — Indicates phone is active and lead saw message. Does NOT mean response is coming, but confirms contact data validity. Use as re-qualification signal if no response after 48 hours (re-send or escalate channel).

3. **Social media ad engagement** — Lead clicks or interacts with agency's Facebook/Instagram ad (usually retargeting). Weak signal; indicates ambient awareness. Best used as frequency cap signal (lead is already aware; don't oversaturate).

4. **Portal inquiry submission (generic, not specific property)** — Lead fills out inquiry form on portal without specifying property. Weak signal; may be generic research. Action: agent qualifies via phone/WhatsApp before sending listings.

**Contextual Enhancers (Adjust Primary Signal Strength)**

1. **Time of day** — 6–8 PM: high-intent (personal time, considered browsing). 12–1 PM: medium (work lunch, casual). 9–11 AM, 2–5 PM: low (accidental or quick check). Weight signal strength by time.

2. **Day of week** — Mid-week (Tue–Thu): higher conversion correlation. Friday evening: may be weekend planning. Weekends: Sunday browsing often = casual. Adjust message priority by day.

3. **Device type** — Desktop browsing of multiple properties = serious consideration. Mobile app = quick check, lower intent. Weight accordingly.

4. **View sequence and interval** — Lead views property A on Day 1, then property B on Day 3, then returns to property A on Day 5. Repeat viewing = strong signal. Lead views 10 properties in 5 minutes = likely accidental bulk scroll. Count unique-property views, not page-view count.

### 4C. Smart Suppression Logic

Suppression rules prevent over-contact and protect data quality. They take precedence over time-based and event-based triggers.

| Suppression Rule | Condition | Action | Exception |
|---|---|---|---|
| **Recent contact (any channel)** | Lead contacted by any channel in last 7 days | Suppress; reschedule for Day 8+ | Handraiser response (lead replied first) |
| **Active agent conversation** | Lead status is ACTIVE or HOT; agent is actively working lead | Suppress all automation; route to agent only | N/A |
| **Recent opt-out (30 days)** | Lead clicked unsubscribe or blocked in last 30 days | Suppress all channels; re-consent workflow only | None; hard stop until 30 days pass |
| **Campaign opt-out rate >5%** | Campaign-wide unsubscribe rate exceeds 5% | Pause campaign immediately; flag manager | None; automated pause |
| **Unresponsive threshold crossed** | Lead received 10+ contact attempts across 90+ days, zero response, zero engagement | Move to archive; stop campaign | Agent can manually override and force-archive |
| **More than 3 automated messages in same session** | Lead is contacted more than 3 times on same day (e.g., WhatsApp + SMS + Email all same day) | Pause until next calendar day | Behavioral signal justifies immediate action (contact within 5 min) |
| **Daily frequency cap** | Lead has received 1 automated message (any channel) already today | Hard cap; no additional messages same day | None; enforced system-wide |
| **Weekly frequency (WARM_STALE / COLD_A)** | WARM_STALE and COLD_A leads have a max of 2 messages per calendar week | Suppress 3rd message; queue for next week | None |
| **Weekly frequency (COLD_B through DORMANT)** | COLD_B, COLD_C, and DORMANT leads have a max of 1 message per calendar week | Suppress 2nd message; queue for next week | Behavioral signal (high-intent) may override to same-day |
| **Monthly frequency (ARCHIVE leads)** | ARCHIVE leads receive at most 1 message per month | Suppress; queue for next month | None |
| **Outside permitted time window** | Lead's local timezone is outside 8 AM–9 PM (or configured window) | Queue message for next permitted time | Behavioral signal (lead just visited portal) may send immediately |
| **Sunday and public holidays** | Message would send on Sunday or Brazilian public holiday (Carnival, Christmas, Independência, etc.) | Queue for next business day (Monday or day after holiday) | None; cultural respect |

### 4D. Behavioral Signal Response Matrix

When a behavioral signal fires, the system must respond with speed and appropriateness. This matrix defines the action, timeline, and responsible party.

| Behavioral Signal | Current Lead Status | New Status After Signal | Automation Action | Human Action | Response Timeline |
|---|---|---|---|---|---|
| **Returns to portal after 90+ days** | COLD_C | WARM_STALE (immediate) | Alert agent; send top 3 listings matching prior searches via WhatsApp | Agent receives email alert with engagement summary (views, time on portal) | <15 min |
| **Clicks listing link in email** | DORMANT | COLD_A (immediate) | Auto-send 3 similar listings via WhatsApp; queue agent notification | Agent receives notification; personalized follow-up optional | <5 min WhatsApp send; agent alert within 30 min |
| **Opens email from agency** | COLD_B | COLD_A (minor bump) | Trigger WhatsApp follow-up in 4 hours referencing the email | Agent receives email-open event log | <4 hours WhatsApp send |
| **Replies to any WhatsApp message** | Any | ACTIVE (immediate) | Pause ALL scheduled automation sequences; route to lead's assigned agent | Agent receives alert: "Lead [name] replied"; conversation continues with agent, no further automation | Immediate (agent should see within <5 min) |
| **Saves multiple properties in single session** | COLD_C | COLD_B (immediate) | Auto-send property-match sequence (Day 0: you saved X; Day 3: similar listings; Day 7: market update) | Agent receives session summary: "Saved 5 properties in 20 min—high intent" | <1 hour for Day 0 message |
| **Submits new inquiry form** | Any | HOT (immediate) | Agent contact within 5 min; stop all scheduled automation; pause reengagement sequences | Agent receives form alert with lead info; agent calls/WhatsApps immediately | <5 min agent contact |
| **Views listing 3+ times** | Any | Escalate one tier (immediate) | Auto-send personalized message: "You've looked at [property] 3 times—let me tell you more"; alert agent | Agent receives "high-intent" alert with view frequency; may offer showing or financing info | <30 min message send |

**Key Design Principle:** Any positive behavioral signal moves the lead up at least one dormancy tier. Agent notification fires automatically. Automation pauses and gives way to human conversation when a lead shows interest.

### 4E. Predictive Variables for Reengagement Success

Machine learning models can rank leads by likelihood-to-respond. These variables should be included in training data:

**High-Weight Variables (40–50% of model importance)**

- Recency: days since last engagement (exponential decay; 14 days = high weight, 180 days = low)
- Historical property views: frequency (lead who viewed 20 properties over lifetime is more likely to respond than lead who viewed 1)
- Behavioral activity in 7 days before campaign: any signal in last week indicates continued interest
- Match quality: relevance of new inventory to lead's historical preferences (percentage match)
- Seasonality: time of year vs. Brazilian real estate cycle (Oct–Nov campaign gets 1.5–2x lift vs. Jan)

**Medium-Weight Variables (20–30%)**

- Lead source: portal-generated leads convert 7–9%, general web 0.5–1.2%, referral 3–5%
- Segment: MCMV > renter > rate-sensitive > mid-market > investor > luxury
- Life stage: renter with lease expiry signal > owner-occupier > investor
- Initial agency response time: if agency responded within 2 hours on first inquiry, lead has higher loyalty
- Agent relationship quality: if lead has had multiple touchpoints with same agent, continuity increases response likelihood

**Lower-Weight Variables (10–20%)**

- Time of day of prior interactions: 6–8 PM browsing = slight signal lift
- Device type: desktop repeat visitors slightly more likely than mobile-only
- Geographic proximity: lead currently living near new property may be more interested
- Stated budget vs. current market pricing: leads looking above market may be window-shopping

---

## SECTION 5: BUSINESS RULES FRAMEWORK

This section establishes a unified decision hierarchy for the reengagement system. When multiple rules fire simultaneously, which wins? Who decides? When does automation stop?

### 5A. Rule Taxonomy

The system operates with four types of rules. Each has different enforcement, override, and documentation requirements:

| Rule Type | Definition | Example | Enforcement | Override Authority | Logging |
|---|---|---|---|---|---|
| **Mandatory Rules** | Legal/regulatory non-negotiables; cannot be overridden under any circumstance | LGPD opt-out block; data deletion; consent expiry | System enforced; hard block | None—system will not allow override | All override attempts logged and flagged |
| **Threshold Rules** | Quantitative limits and operating constraints | Daily message cap (1/day), weekly frequency (2/week for COLD_A), opt-out rate (5% pause) | System enforced with manager override available | Manager (with documentation) | All overrides logged; rationale required |
| **Trigger Rules** | Events initiating sequences or escalations | Time-based trigger (90 days = COLD_C); event-based trigger (Selic decrease); behavioral trigger (portal visit) | Auto-approved for system events; agent-initiated triggers generally auto-approved | Agent (for own leads); auto-approval for system events | Trigger execution logged with context |
| **Exclusion Rules** | Conditions suppressing valid triggers | Active conversation flag suppresses outbound; recent contact (7 days) suppresses re-contact | Automatic suppression; no override option (prevents over-contact and LGPD risk) | None—suppression is non-negotiable | Suppression logged with reason |

### 5B. Priority Resolution for Competing Triggers

When multiple triggers fire simultaneously (rare but possible), resolve conflicts using this five-level hierarchy:

**Level 1: Mandatory Rules Override Everything**
If a Mandatory Rule applies, all other triggers are blocked. Example: Lead submitted LGPD opt-out on the same day a Selic decrease triggered reengagement. LGPD block wins unconditionally. The Selic trigger is logged (not discarded), but message is not sent.

**Level 2: Suppression/Exclusion Rules Block Trigger Rules**
If an Exclusion Rule applies (e.g., active agent conversation, recent contact 7 days ago), the trigger is not executed; it is queued for the next available window. Example: Lead dormant 95 days (COLD_C) receives WhatsApp message from agent on Day 1. Day 1 evening, Selic decreases (event trigger fires). Suppression rule (contacted in last 7 days) blocks the Selic trigger; it is queued for Day 8.

**Level 3: Higher-Priority Trigger Wins Within Tier**
When two Trigger Rules of similar weight fire, prioritize: behavioral signal > market event > time-based. Example: Same lead, Day 10: (a) time-based trigger fires (Day 10 follow-up in sequence), (b) lead visits portal (behavioral signal). Behavioral signal has higher priority. Agent is alerted immediately; time-based follow-up is rescheduled.

**Level 4: Threshold Rules Set Operating Limits**
Threshold Rules do not cancel triggers; they queue them. Example: Lead has already received 1 message today (daily cap met). Two triggers fire: (a) Selic decrease (high priority), (b) new listing match (medium). Neither executes today; Selic trigger queues for tomorrow morning; new listing match queues for tomorrow evening.

**Level 5: Human Agent Override**
Agents can override Threshold Rules (with documentation required). Example: Agent manually overrides daily message cap to send urgent financing update and new listing to HIGH_VALUE lead on same day. Log entry: "Agent [name] override reason: financing window closing tomorrow; lead urgency HIGH." Agents cannot override Mandatory or Exclusion Rules.

**Conflict Resolution Example**

Lead state: Dormant 95 days (COLD_C), last contact 6 days ago (agent call, no response).

Triggers firing same day (Tuesday, Selic release day):
- (a) **Selic decreases 0.5%** (event trigger, Critical priority)
- (b) **New MCMV lançamento in lead's region** (event trigger, High priority)
- (c) **Weekly time-based follow-up** (time trigger, Medium priority)

Suppression rules applying:
- **Recent contact (6 days ago):** suppresses additional WhatsApp today; 7-day window not yet complete

Resolution:
1. **Selic trigger (Critical, event-based):** highest priority; not suppressed by 7-day rule because it is a critical market event overriding frequency limits
2. **Send:** 1 message today via WhatsApp: "Selic dropped—your affordability just changed. New properties now in range. Let me show you."
3. **Queue:** MCMV lançamento message for Day 3 (48 hours spacing to avoid hammer effect)
4. **Cancel:** time-based follow-up (its purpose is subsumed by Selic message)
5. **Set agent alert:** Highest-priority lead; agent should follow up by phone on Day 2

Result: Coherent narrative (Selic news first, then new inventory), not two impersonal messages on same day.

### 5C. Human-in-the-Loop Decision Map

Clarify which actions fully automate, which require human review, and which require human takeover.

**Fully Automate (No Human Required)**

- First reengagement contact after dormancy trigger fires (unless campaign opt-out rate exceeded in prior campaign)
- Listing match notifications (new property matching saved search)
- Market update messages (Selic rate release, MCMV teto announcement)
- Day 3 and Day 7 follow-ups in standard sequence (if lead has not responded)
- Data quality checks and suppression enforcement (invalid phone, hard-bounced email, no consent)
- Opt-out processing and LGPD compliance (automatic block upon opt-out; documentation logged)
- Lead score recalculations from behavioral signals (portal visit, email open, link click)
- Suppress messages outside permitted time windows (8 AM–9 PM, local time)

**Human Review Required (Agent Decides; System Surfaces)**

- First agent-initiated contact after AI detects high-intent behavioral signal (e.g., lead returns to portal after 180 days; agent decides: phone or personalized WhatsApp)
- Reengagement of leads with prior negative interaction tags (complaint, misrepresentation, competitive agent)
- Luxury segment reengagement (agent customizes every message; no templated automation)
- Escalation decision after 5+ touchpoints with zero response (agent decides: archive or escalate to phone/manager)
- Campaign message copy that deviates from approved templates (if agent wants to customize, manager review required)
- Override of Threshold Rules (daily cap, weekly frequency) — logged with rationale
- Re-activation of LOST leads (if new information suggests lead might reconsider; manager sign-off required)

**Human Escalation Required (Agent Takes Over; Automation Pauses)**

- Lead replies to any automated message (immediate pause of further automation; agent continues conversation)
- Lead expresses strong interest ("I want to visit," "send me financing options," "call me soon")
- Lead expresses frustration with contact frequency ("stop messaging me," "too many messages")
- Lead raises specific objection or question requiring personalized, expert answer
- Lead requests LGPD opt-out or submits deletion request (automation stops immediately; compliance team confirms)
- Lead files complaint or raises concern (escalate to manager; compliance review)
- Lead submits new inquiry form or request for appointment (agent contacts immediately)

### 5D. Escalation SLA Table

Speed matters for reengagement. Set and enforce response SLAs:

| Condition | Automation Action | Human Action Required | Response SLA | Owner |
|---|---|---|---|---|
| **Lead replies to any message** | Pause sequences immediately; set status to ACTIVE | Agent continues conversation; takes over fully | <5 min (high-intent response); <4 hours (neutral response) | Assigned agent |
| **Lead score crosses HIGH threshold (70+)** | Alert assigned agent; queue as priority lead | Agent reviews engagement summary; decides: phone call, video call, or personalized message | <30 min alert | System → Agent |
| **Lead clicks 3+ listings in one session** | Auto-send listing match; escalate status one tier | Agent follows up personally; may offer showing or pre-approval | <1 hour | Assigned agent |
| **Lead requests call or meeting** | Alert agent immediately with inquiry details | Agent contacts lead immediately; scheduling conversation | <15 min | Assigned agent |
| **Lead expresses frustration / complaint** | Pause all automation sequences; alert agent and manager | Manager reviews situation; agent responds personally with apology/resolution | <2 hours | Manager + Agent |
| **Opt-out received** | Execute opt-out immediately; block all channels; alert compliance | Compliance confirms LGPD documentation; confirms deletion within 30 days | <24 hours | Compliance |
| **Campaign opt-out rate exceeds 5%** | Pause campaign automatically; flag manager | Manager reviews campaign (message, frequency, targeting); decides: adjust or kill campaign | <4 hours | Manager |
| **Data enrichment completes** | New contact info available (phone, WhatsApp, email) | Validate new contact; re-enter lead into appropriate sequence | N/A (internal system) | System |

---

## SECTION 6: REFERENCE SUMMARY — IMPLEMENTATION QUICK-REFERENCE

For engineering teams building the system, this section is a compact, structured summary of all rules by type.

### Dormancy Brackets and Clock Rules

| Bracket | Days | First Trigger | Frequency | Segment Adjustments |
|---|---|---|---|---|
| WARM_STALE | 14–30 | Gentle check-in or listing match | 1x every 7–14 days | MCMV: 21 days; Investor: 45 days; Rate-sensitive: 30 days; Luxury: 60 days; Renter: 14 days |
| COLD_A | 30–60 | New listing match or market update | 1–2x per week | Apply segment-specific adjustments |
| COLD_B | 60–90 | Re-qualification probe, multi-channel | 1x per week | Apply segment-specific adjustments |
| COLD_C | 90–180 | Event-triggered only | Event-driven | Behavioral signal preferred |
| DORMANT | 180–360 | Economic/lifecycle event | Event-driven, <1x per month | Behavioral signal required |
| ARCHIVE | 360+ | Structured campaign only | Compliance check first | Consent refresh required |
| EXPIRED | 730+ | No outreach | No outreach | Purge or require fresh opt-in |

**Dormancy Clock Reset**
- Resets to zero: lead replies, submits inquiry, initiates contact, agent contacts and lead responds
- Does NOT reset: message delivered only, email opened (without click/reply), agent contacts but no response

### Event Trigger Priority Order

1. **Critical (bypass dormancy, fire immediately):** Selic decrease ≥0.5%; MCMV teto increase; MCMV new lançamento in region; LGPD compliance issue
2. **High (fire within 24 hours, all dormancy tiers):** New listing matching saved search; bank mortgage promotion; price drop on viewed property
3. **Medium (fire within 48 hours, COLD_B+):** Selic increase; quarterly market report; rental yield index; behavioral signal (portal visit, email open)
4. **Low (event-triggered only, COLD_C+):** Quarterly market updates; seasonal campaigns; birthday/anniversary

### Hard Exclusion Rules (13 Items)

1. LGPD opt-out → permanent block, all channels
2. LGPD deletion request → purge from systems
3. LGPD consent expired → block until refreshed
4. Minor without guardian consent → exclude
5. Complaint or legal dispute → escalate, do not automate
6. No valid phone → suppress phone outreach (retry enrichment)
7. No valid WhatsApp → fallback to SMS/email
8. No valid email → use phone/WhatsApp only
9. Data >25% likely outdated → suppress until re-validated
10. Active agent conversation → suppress automation; route to agent
11. Contacted in last 7 days → suppress; reschedule
12. Competitor agent or press → flag; do not contact
13. LOST with negative sentiment → archive; do not automate

### RE-RFME Cluster Definitions

| Cluster | Score Range | Size | Reengagement Tier | Frequency | Channel Priority |
|---|---|---|---|---|---|
| High Value | 70–100 | 20% | Immediate; agent-led | 2–3x/week | WhatsApp + Phone |
| Promising | 40–69 | 30% | Automated + review; event-based strong | 1–2x/week | WhatsApp + SMS + Email |
| Needs Attention | 20–39 | 25% | Behavioral trigger only | 1–2x/month | Event-triggered only |
| Needs Activation | 0–19 | 25% | Bulk campaigns only | 1x/month | Email/SMS bulk |

**Score Decay:** Reduce by 25% monthly without activity (prevents stale scores).

### Suppression Rules (Summary)

- Recent contact (7 days): suppress; reschedule
- Active conversation: suppress all automation
- Recent opt-out (30 days): suppress; re-consent only
- Campaign opt-out >5%: pause campaign
- Unresponsive 10+ touches, 90+ days: archive
- >3 messages same day: pause until next day
- Daily cap (1/day): hard stop
- Weekly cap (WARM_STALE/COLD_A: 2/week; COLD_B+: 1/week): enforce
- Monthly cap (ARCHIVE: 1/month): enforce
- Outside 8 AM–9 PM: queue for permitted window
- Sunday/holidays: queue for next business day

### Human Escalation Thresholds (When Automation Stops)

- Any lead reply → pause automation; agent takes conversation
- Lead score 70+ → alert agent; agent decides next action
- 3+ list clicks in session → agent alert; may offer showing
- Explicit intent signal → agent takes over
- Complaint or frustration → manager + agent involvement
- LGPD opt-out → compliance stops automation
- Campaign opt-out >5% → manager pauses campaign
- New inquiry form submission → agent contact <5 min

### Competing Trigger Resolution Hierarchy

1. **Mandatory Rules** override all (LGPD block, consent expiry, deletion)
2. **Suppression Rules** block triggers (active conversation, recent contact)
3. **Higher-priority trigger wins** (behavioral > event > time-based)
4. **Threshold Rules set limits** (don't cancel; queue triggers)
5. **Agent override** (Threshold Rules only, with documentation)

---

## SECTION 7: OPEN QUESTIONS FOR PRODUCT DESIGN

Implementation will need to answer these design questions. Recommend addressing them in product specification and engineering kickoff:

### 1. Lease Expiry Capture and Trigger Architecture
**Question:** How do we capture Lease Expiry Date at intake, and how do we reliably trigger three-wave campaigns (T-90, T-60, T-30 days) for renters?

**Implications:** Requires new intake form field; calendar-based trigger engine (cron job or task queue); lead lifecycle stage tracking. Will need to distinguish renters from owner-occupiers at intake.

### 2. Selic Rate and Market Event Integration
**Question:** How do we connect to Central Bank Selic data feeds and other market data APIs (MCMV teto, mortgage promotion calendars) to trigger campaigns automatically?

**Implications:** Requires API integration (Central Bank public API, possibly third-party fintech APIs), a configuration UI for "Selic decrease threshold," templating system for message customization by rate sensitivity segment.

### 3. LGPD Consent Mechanism Across Channels
**Question:** How do we manage LGPD consent for WhatsApp vs. email vs. SMS vs. landing page? Can we refresh consent via WhatsApp Business API, or must we always route to a landing page?

**Implications:** WhatsApp Business API has consent flow; email has unsubscribe requirements; SMS has TCPA/LGPD rules. Design must specify consent validation, refresh workflow, and audit logging.

### 4. Lead Scoring Model: Training Data and Updates
**Question:** What data will we use to train the RE-RFME scoring model? How frequently should it be retrained (weekly, monthly)? How do we handle segment-specific variations?

**Implications:** Requires historical lead data from partner agencies (anonymized); feature engineering for Recency, Frequency, Monetary, Engagement; retraining pipeline; A/B testing framework to validate score lift.

### 5. Phone Number Validation and Enrichment Workflow
**Question:** When a lead's phone is invalid (disconnected), how do we integrate with ThinkData or similar enrichment services? Do we attempt enrichment automatically or require agent trigger?

**Implications:** API integration with ThinkData or equivalent; cost per enrichment lookup; decision logic (automatic on WARM_STALE leads? manual on HIGH_VALUE?); fallback to email-only if enrichment fails.

### 6. Behavioral Signal Capture and Real-Time Processing
**Question:** How do we capture behavioral signals (portal visit, email open, link click, WhatsApp delivery) in real-time and feed them to the trigger engine? Do we need a streaming architecture or batch processing?

**Implications:** May require event streaming (Kafka, Kinesis); webhooks from email provider and portal; WhatsApp Business API callbacks. Real-time triggers (e.g., <5 min alert) require low-latency architecture.

### 7. Campaign Performance Dashboards and Optimization
**Question:** What metrics should product/management teams monitor to assess campaign health? How do we surface opt-out rate alerts, response rate trends, and cost-per-reactivation calculations?

**Implications:** Analytics dashboard design; metric definitions; automated alerting thresholds (e.g., pause if opt-out >5%); reporting SQL/BI tools; data warehouse schema.

### 8. Luxury Segment Human-in-the-Loop UI
**Question:** For luxury leads (all automated contact requires agent review), what does the UI/UX look like? Do agents see a "review and approve" workflow before message sends, or do they customize after automation offers a draft?

**Implications:** UI for pre-send review; template system; agent customization tools; audit trail (who approved, what was changed).

### 9. Handraiser Intent Detection and Escalation Automation
**Question:** Should we implement keyword-based intent detection (e.g., "interested," "available," "call me")? Do we escalate automatically or flag for agent review first?

**Implications:** NLP/keyword model; potential for false positives; escalation logic; fallback if model confidence is low.

### 10. Multi-Language Support and Regional Customization
**Question:** Should the system support multiple Portuguese dialects or regional variations? How do we customize event triggers for different Brazilian regions (e.g., Selic matters more in major metros)?

**Implications:** Templating system for regional variation; localization of event triggers; testing for different regions.

---

## Conclusion

Reengagement is not a single feature; it is a system of coordinated rules, triggers, and guardrails. This report has provided the operational foundation: specific dormancy brackets, event triggers, lead classification rules, expected outcomes, automation patterns, and decision hierarchies.

The framework is designed to:
- **Maximize response rates** by matching message timing to dormancy age and segment
- **Maintain database health** by enforcing frequency caps and opt-out thresholds
- **Respect LGPD compliance** by enforcing consent, deletion, and data quality rules
- **Empower agents** by automating low-value touches and escalating high-intent signals
- **Enable measurement** by providing clear KPIs (reactivation rate, cost per lead, opt-out rate, close rate)

Implementation of this framework should yield:
- **2–4% additional closes** from systematic reengagement of 500+ dormant leads per agency per year
- **R$80k–R$600k incremental annual revenue** per mid-sized agency (500 leads; 1–4% close rate)
- **<2% opt-out rate** on sustainable multi-channel campaigns (vs. 8–15% on generic blasts)
- **50–70% cost reduction** per reactivated lead vs. new acquisition (R$25–75 CPRL vs. R$80–150)

The next phase is product specification: detailed UI mockups, API contracts, database schema, and workflow definitions.

---

**Document Control**

- **Version:** 1.0
- **Date:** February 24, 2026
- **Prepared for:** Lais da Imobiliária Product and Engineering Teams
- **Related Documents:** lead-reengagement-brazil-2026-02-23.md (Market Opportunity Analysis)
- **Review Status:** Ready for Product Specification Phase
