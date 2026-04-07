# Smart Triggered Notifications — Multi-Discipline Research Report

**Date:** April 6, 2026 | **Product:** Lais da Imobiliaria | **Scope:** 5-discipline synthesis

---

## Executive Summary

The research across UX, market analysis, data architecture, data science, and industry benchmarks converges on one finding: smart triggered notifications are a revenue-multiplying product feature, not infrastructure. For Lais, the opportunity is 8.6% revenue lift in year one through retention optimization, 2-3x lead conversion improvement via 5-minute response alerts, and 28% reduction in notification opt-outs through digests and user control.

Key numbers:
- 71% of users uninstall apps with excessive notifications
- 98% WhatsApp open rate in Brazil vs 42% email
- 100x conversion improvement when leads contacted within 5 minutes
- 34% improvement from AI-optimized send-time personalization
- 6+ push/week = 3.4x uninstall rate
- Behavior-triggered messaging: 22.9% conversion vs 3-4% broadcast

---

## The 10 Most Actionable Cross-Discipline Insights

### 1. The Fatigue Ceiling Is Lower Than You Think
**Sources:** UX Research + Search Specialist + Market Research

1-3 targeted notifications per day is the optimal range for CRM tools. Active users tolerate 4/week with 15% conversion lift. Reducing to 1/week for low-activity users cuts opt-outs by 30%. The existing Lais rules (max 3/session, max 5/day) align with research.

**What Lais Should Do:** Keep existing caps. Add activity-state segmentation: "cold open" mode (1 notification for returning users after 2+ days) and "high-velocity" mode (auto-batch during 5+ active leads).

### 2. Digests Are the Highest-Leverage Fatigue Reducer
**Sources:** UX Research + Data Research + Search Specialist

Applications using digest notifications see 35% higher engagement and 28% lower opt-out rates. No Lais notification type currently delivers a digest pattern.

**What Lais Should Do:** Build a "Resumo da manha" card at 9 AM consolidating overnight events. If 3+ Row Nudges are eligible simultaneously, collapse into a single Suggestion Card with list view.

### 3. The User Control Paradox
**Sources:** UX Research + Market Research + Search Specialist

Giving users the ability to turn notifications off keeps more turned on. Users who cannot configure preferences are significantly more likely to disable the entire channel at OS level.

**What Lais Should Do:** Build two-tier preference center: Presets (Ativo/Focado/Silencioso) + Advanced (per-group, per-channel, quiet hours, digest time). After 3 consecutive dismissals of same type, surface inline "Ver menos sugestoes desse tipo?" toggle.

### 4. Behavior-Triggered Beats Broadcast by 5-7x
**Sources:** Market Research + Data Research + Data Science

Automated behavior-triggered notifications achieve 22.9% conversion vs 3-4% for broadcasts. AI-optimized send-time adds another 34% improvement in open rates.

**What Lais Should Do:** Every notification must be triggered by a specific event + context condition, never batch-broadcast. Phase in Thompson Sampling for per-user optimal send-time after 4+ weeks of data per user.

### 5. WhatsApp Is Table-Stakes in Brazil
**Sources:** Market Research + Search Specialist

148M WhatsApp users in Brazil (99% penetration). 98% open rate vs 42% email. Utility messages cost $0.0068. Latin American consumers trust WhatsApp more than corporate emails.

**What Lais Should Do:** Phase WhatsApp as tier-1 urgent notification channel. Route: hot lead arrival and contract deadlines via WhatsApp. Enable rich quick-reply buttons for showing confirmations.

### 6. The 5-Minute Response Window Is the Highest-Value Trigger
**Sources:** Market Research + Data Research + Data Science

Brokers responding within 5 minutes are 100x more likely to convert the lead. The notification system must deliver alerts within 2-3 minutes of lead arrival.

**What Lais Should Do:** Build Hot Lead SLA trigger with <30-second delivery latency. Include one-tap calling CTA. At 5 minutes without response, escalate to manager. Show competitive pressure: "2 agents already notified."

### 7. Thompson Sampling Outperforms Fixed Timing
**Sources:** Data Science + Data Research

Thompson Sampling over 24 hour-arms with Beta distributions converges faster than UCB1. Weekly decay (0.97) prevents stale priors. Cold-start: population priors Day 1-14, nearest-neighbor transfer Day 15-60, individual model Day 60+.

**What Lais Should Do:** Start with population-average timing (Tue-Thu 9-11 AM). Deploy Thompson Sampling bandit after 4 weeks of notification engagement data. Apply action masks: no notifications before 7 AM or after 9 PM, P0 leads override timing.

### 8. Fatigue Is Predictable 7-21 Days Before Opt-Out
**Sources:** Data Science + UX Research

Key signals: dismissal rate trend (3-week slope), time-to-dismiss decreasing, click-to-action gap widening, notification preferences page visited (1-3 day precursor).

**What Lais Should Do:** Build Cox PH fatigue model. Deploy graduated suppression: effective_cap = base_cap * (1 - fatigue_score). At fatigue_score > 0.6, trigger proactive re-permission prompt with 3 frequency options.

### 9. Relevance Scoring Should Build on RE-RFME
**Sources:** Data Science + Data Research

The RE-RFME framework already codifies the most predictive domain features. LightGBM with 45-60 features (temporal, behavioral, pipeline, contextual) targeting AUC > 0.72.

**What Lais Should Do:** Map RE-RFME dimensions directly as relevance model inputs. Add recency-weighted frequency, lead urgency index, notification novelty. Train after 30K+ labeled examples.

### 10. Measure Causation, Not Just Correlation
**Sources:** Data Science + Data Research

Naive CTR is biased upward. Brokers who receive P0 notifications may have closed deals anyway. Need incremental lift measurement.

**What Lais Should Do:** Implement ghost group: suppress 15% of notifications in the 0.3-0.6 relevance band. Compare outcomes. Run for 90+ days (real estate cycles are long). Use CUPED for 30-50% variance reduction.

---

## Notification Architecture Blueprint

### System Flow
```
[Event Source] -> [Message Broker (RabbitMQ)] -> [Rule Engine] -> [Scoring Layer] -> [Priority Queue] -> [Delivery Service] -> [Channel (Push/Email/SMS/WhatsApp/In-App)] -> [Tracking] -> [Analytics/ML]
```

### Tech Stack Recommendation
| Component | Technology | Phase |
|-----------|-----------|-------|
| Event Broker | RabbitMQ (Phase 1), Kafka (Phase 3+) | 1 |
| Rule Engine | Node.js declarative rules | 1 |
| Cache | Redis (preferences, frequency caps, dedup) | 1 |
| Database | PostgreSQL with JSONB | 1 |
| Delivery | SendGrid (email), Firebase (push), Twilio (SMS) | 1 |
| WhatsApp | WhatsApp Business API | 2 |
| ML Scoring | LightGBM + Thompson Sampling | 2 |
| Metrics | Prometheus + Grafana | 1 |
| Logging | ELK Stack | 1 |

### Suppression Rules
- Dedup window: 5 minutes (key: broker_id + lead_phone + lead_email)
- Cooldown: hot lead 5min, lead update 15min, payment 1h, daily digest 23.5h
- Frequency cap: critical unlimited, high 10/day, medium 15/day, low queue-for-next-day
- Cross-channel cap: 20/day/user total
- Quiet hours: 9 PM - 7 AM (critical bypasses)

---

## Trigger Catalog

### Tier 1 — Critical (Immediate, multi-channel)
| Trigger | Latency | Channels | CTA |
|---------|---------|----------|-----|
| Hot Lead Arrival | <30 sec | Push + WhatsApp + In-App | One-tap call |
| Response SLA Breach (5 min) | At 5 min mark | Push escalation | "Call Now" |
| Contract Deadline (24h) | 24h/12h/2h before | Email + SMS + Push | "Review contract" |

### Tier 2 — High (Within 30 min)
| Trigger | Latency | Channels | CTA |
|---------|---------|----------|-----|
| Payment Overdue | Morning of due date | In-App + Email + Snackbar | "Pay boleto" |
| Deal Milestone | Within 1 hour | Push + Email | "Review details" |
| Manager Escalation | At SLA breach | Push + Slack | "Reassign lead" |

### Tier 3 — Medium (Batched/Scheduled)
| Trigger | Timing | Channels | CTA |
|---------|--------|----------|-----|
| Daily Digest | 7-9 AM | Email + In-App | "View summary" |
| Feature Adoption Nudge | Contextual | In-App Row Nudge | "Try this feature" |
| Usage Threshold (85%) | On crossing | In-App Banner | "Upgrade plan" |

### Tier 4 — Low (Queued)
| Trigger | Timing | Channels | CTA |
|---------|--------|----------|-----|
| Weekly Summary | Monday 9 AM | Email | "View report" |
| Opportunity Expiration (30d) | At 30 days | In-App + Email | "Update or archive" |
| Market Insight | Weekly | In-App Spotlight | "Learn more" |

---

## ML/AI Optimization Layer

### Phase 1: Statistical Foundation (Months 1-3)
- Instrument all notification events with full context logging
- A/B test 5 highest-volume notification types
- Population-level engagement-by-hour Beta distributions
- Build EQI dashboard
- Engagement Quality Index: EQI = ActionRate * (1 - fatigue_score) * diversity_index

### Phase 2: Relevance Model (Months 4-9)
- LightGBM relevance classifier (target AUC > 0.72)
- Thompson Sampling bandit for send-time optimization
- Fatigue prediction (Cox PH model)
- Ghost group for incremental lift measurement (15% suppression in 0.3-0.6 band)

### Phase 3: Contextual Bandit (Months 9-18)
- Broker embedding model (ALS, 64-dimensional)
- LinUCB contextual bandit for notification modality selection
- Multi-objective optimization: maximize EQI subject to opt-out < 5%
- Causal holdout experiment for retention/deal impact

---

## Brazilian Market-Specific Strategies

### WhatsApp Integration
- Primary channel for urgent agent notifications
- Rich notifications: quick-reply buttons for showing confirmations
- Utility messages free within 24-hour service window
- Track engagement separately (WhatsApp has different psychology)

### Business Hours
- Standard: 8 AM - 6 PM (real estate extends to 8 PM with showings)
- Saturday showings standard — notifications acceptable 10 AM - 5 PM
- Sunday 7-9 PM surprisingly high engagement (agents planning week ahead)
- Carnaval week: lead responsiveness drops 35%

### Seasonal Cycles
- Q1 (Jan-Mar): Post-Carnaval recovery, highest reengagement window
- Q2 (Apr-Jun): Peak buying season, increase urgency levels
- Q3 (Jul): School holidays pause for family buyers
- Q4 (Oct-Dec): FGTS spike, elevate FGTS-qualified lead priority

### Broker Segments
| Segment | Daily Notifications | Strategy |
|---------|-------------------|----------|
| Top Producers (10+ deals/mo) | 8-12 | Data-rich, competitive signals |
| Growing (3-5 deals/mo) | 4-6 | Coaching, process reminders |
| New (<3 months) | 2-3 | Feature discovery, gentle pace |
| Inactive/At-Risk | 1-2 | Win-back, high-value only |

---

## Implementation Roadmap

### Phase 1a: Foundation (Month 1-2)
- Event-driven architecture (RabbitMQ)
- Basic rule engine (decision trees)
- Dedup + cooldown suppression
- In-app + push for hot leads
- Notification event logging schema

### Phase 1b: MVP Live (Month 3-4)
- Hot Lead SLA trigger (<30 sec delivery)
- Response breach escalation (5 min)
- Contract deadline cascade (24h/12h/2h)
- Daily digest at 9 AM
- Basic frequency caps (10-15/day)

### Phase 2a: Intelligence (Month 5-8)
- Broker preference center (presets + advanced)
- Lead urgency scoring
- Send-time optimization (Thompson Sampling)
- A/B testing framework
- Analytics dashboard

### Phase 2b: WhatsApp (Month 7-10)
- WhatsApp Business API integration
- Rich notifications with quick-reply buttons
- Channel routing logic (in-app > push > WhatsApp > email)
- Portuguese-language template optimization

### Phase 3a: ML-Driven (Month 9-14)
- LightGBM relevance model
- Fatigue prediction + graduated suppression
- Ghost group for causal measurement
- Broker embedding model

### Phase 3b: Full Optimization (Month 14-18)
- LinUCB contextual bandit for modality selection
- Multi-objective EQI optimization
- Causal holdout experiment
- Predictive engagement scoring

---

## KPIs and Measurement Framework

### Primary Metrics
| Metric | Target | Measurement |
|--------|--------|-------------|
| Action Rate (AR) | >12% | Actions taken within 24h of notification |
| 5-Minute Response Rate | >60% | Hot leads contacted within 5 min |
| Engagement Quality Index | >0.15 | AR * (1 - fatigue) * diversity |
| Opt-Out Rate | <1%/month | Explicit unsubscribes + OS-level disables |
| Incremental Lift | >20% | Ghost group comparison |

### Health Checks
| Signal | Threshold | Action |
|--------|-----------|--------|
| Daily dismiss rate >50% | Warning | Audit notification relevance |
| Weekly opt-out >2% | Critical | Reduce frequency, review content |
| Delivery failure >5% | Critical | Check provider, retry logic |
| Fatigue score >0.6 for >10% users | Warning | Deploy preference prompt |

---

## Risk Register

| Risk | Probability | Impact | Mitigation |
|------|------------|--------|------------|
| Notification fatigue backfire | Medium | High | Graduated suppression, preference center, digest batching |
| WhatsApp API changes/restrictions | Medium | High | Multi-channel fallback, SMS backup |
| ML model overfitting | Medium | Medium | Holdout validation, weekly monitoring, human review |
| Cold-start poor timing | High | Low | Population priors, nearest-neighbor transfer |
| Carnaval/holiday disruption | Certain | Medium | Holiday calendar masks, seasonal model adjustments |
| LGPD data compliance | Low | Critical | Privacy-by-design, consent management, data minimization |
| Support load from notifications | Medium | Medium | Self-service preference center, gradual rollout |
| Competitive arms race | Medium | Medium | Focus on relevance quality, not quantity |

---

## Appendix: Sources by Discipline

### UX Research
- Intercom banner best practices, Salesforce Einstein NBA, Linear notifications docs
- Nielsen Norman Group notification taxonomy, IBM Carbon notification pattern
- Smashing Magazine notification UX guidelines (2025)
- WCAG 2.1 SC 4.1.3, ARIA live regions, ARIA Notify API

### Market Research
- Fortune Business Insights PropTech Market 2034, Precedence Research PropTech 2025-2034
- Braze 2024 Global Customer Engagement Review, OneSignal 2026 Best Practices
- Klaviyo push frequency analysis, Iterable STO benchmark (2.3B sends)
- WhatsApp Business statistics, Infobip global usage report

### Data Research
- AWS Event-Driven Architecture, Superhuman email timing research
- OneUpTime alert deduplication, Salesforce Einstein scoring
- PagerDuty deduplication patterns, Braze frequency capping docs
- Statsig A/B testing, ContextSDK real-time personalization

### Data Science
- Li et al. (2010) LinUCB, Chapelle and Li (2011) Thompson Sampling
- Kohavi et al. (2020) Trustworthy Online Controlled Experiments
- Deng et al. (2013) CUPED methodology
- ABRAINC 2024-2026, ZAP Imoveis quarterly index

### Search Specialist
- IJHCI (2025) notification timing optimization
- PMC notification timing clinical trial
- Novu 2024 developer survey (93% context-awareness gap)
- Figma notification redesign case study
- Leanplum retention insights (7x retention with Optimal Time)

---

**Report compiled:** April 6, 2026
**Research period:** 2024-2026 data across 100+ sources
**Disciplines:** UX Research, Market Research, Data Architecture, Data Science, Industry Search
**Product:** Lais da Imobiliaria — Brazilian PropTech CRM
