# Lais Smart Trigger Suggestions — Final Synthesis Report

**Date:** February 11, 2026
**Purpose:** Apply benchmarked trigger strategies, engagement window research, and behavioral psychology to design smart trigger suggestions for 10 core Lais CRM topics
**Audience:** Lais product & engineering teams

---

## Executive Summary

This report translates two bodies of research — (1) benchmarked trigger strategies from top consumer and SaaS products and (2) optimal engagement window science — into concrete, implementable trigger designs for the 10 core workflows of the Lais real estate CRM.

**The central thesis:** Real estate professionals operate in high-stakes, time-sensitive environments where a missed follow-up can lose a deal worth months of work. Lais smart triggers must respect this context by being genuinely helpful (not noisy), precisely timed (not arbitrary), and progressively intelligent (learning from each broker's patterns).

### Key Design Principles for Lais

1. **Context over frequency** — One well-timed suggestion after a broker logs a visit beats five generic reminders
2. **Respect the broker's rhythm** — Real estate professionals have irregular schedules; triggers must adapt to individual patterns, not office-hour assumptions
3. **Progressive intelligence** — Start with rule-based triggers, evolve toward ML-driven personalization as usage data accumulates
4. **Value before interruption** — Every trigger must answer the broker's implicit question: "Why should I care about this right now?"
5. **Celebrate momentum** — Real estate is a long-cycle business; reinforcing progress through small wins sustains engagement

### Synthesized Framework

The report maps each Lais topic against three dimensions:

| Dimension | Source | Application |
|-----------|--------|-------------|
| **Trigger Strategy** | 7 benchmarked strategies (tooltips, checklists, tours, gamification, segmentation, empty states, time-based prompts) | Which strategy pattern fits each workflow |
| **Engagement Window** | Session-level receptivity, cognitive load zones, time-of-day patterns | When to fire each trigger |
| **Psychology Lever** | Zeigarnik, variable rewards, social proof, micro-commitments, Hook Model | Why the trigger works on a behavioral level |

---

## The 10 Lais Topics — Trigger Strategies

---

### Topic 1: Schedule Property Visits

**Core Challenge:** Brokers often register leads but delay scheduling the first visit — the single most critical conversion event in real estate. Every day without a scheduled visit increases the probability of the lead going cold.

**Primary Strategy:** Behavior-Triggered Contextual Prompt + Time-Based Intelligent Prompt (Strategies 1 & 7)

#### Trigger Moments

| Trigger | Condition | Timing | Channel |
|---------|-----------|--------|---------|
| **Post-lead registration nudge** | Broker registers a new lead but does not schedule a visit within 15 minutes | 15 min after lead creation | In-app notification |
| **Morning planning prompt** | Broker has leads with no scheduled visits | Daily at broker's typical login time | In-app + push |
| **Idle moment suggestion** | Broker is browsing a lead's profile for 30+ seconds without taking action | After 30s dwell on lead detail page | Contextual tooltip |
| **Post-call follow-through** | Broker logs a call note on a lead | 5 seconds after call note is saved | In-app slide-in |
| **Weekend planning** | Broker has 3+ unvisited leads by Friday | Friday at 4 PM (or broker's end-of-week pattern) | Push notification |

#### Message Examples

- **Post-lead nudge:** "You just added Maria Silva. Would you like to schedule a visit while the lead is fresh? Leads contacted within 24h are 3x more likely to convert."
- **Morning prompt:** "You have 4 leads without scheduled visits. The oldest, João Pereira, was added 3 days ago — want to start there?"
- **Post-call:** "Great call with Carlos. Want to lock in a visit while the conversation is still warm?"

#### Psychology Principles

- **Zeigarnik Effect:** The incomplete state (lead without visit) creates cognitive tension visible in the lead card — a subtle progress indicator showing "Next step: Schedule visit"
- **Micro-commitment ladder:** Registration → Call → Visit → Proposal → Sale. Each step makes the next feel natural
- **Loss aversion:** "Leads contacted after 48h have a 60% lower conversion rate" frames inaction as a potential loss

#### Anti-Patterns to Avoid

- Do NOT send visit reminders for leads the broker has explicitly marked as "not ready"
- Do NOT fire the idle-moment tooltip if the broker is actively editing lead details (typing = Red Zone)
- Do NOT stack the morning prompt on top of other daily summaries — consolidate into a single daily briefing

#### KPIs

| Metric | Target |
|--------|--------|
| Lead-to-visit scheduling rate | +20% from baseline |
| Average time from lead creation to first visit | Reduce by 30% |
| Trigger interaction rate (click/engage) | 15%+ |
| Trigger dismissal rate | <40% |

---

### Topic 2: Schedule a Remarketing Campaign (Dormant Lead Reengagement)

**Core Challenge:** Leads go dormant — a prospect who seemed interested weeks or months ago stops responding. Brokers lose track of these leads or don't know when to re-approach. The "remarketing campaign" feature in Lais enables systematic reengagement of dormant leads after a defined period of non-response, but brokers underutilize it because they don't know the optimal moment to trigger reengagement or they simply forget about aging leads.

**Primary Strategy:** Time-Based Intelligent Prompt + Empty State Feature Discovery + Achievement Gamification (Strategies 7, 6 & 4)

#### Trigger Moments

| Trigger | Condition | Timing | Channel |
|---------|-----------|--------|---------|
| **Dormancy alert** | A lead has had no interaction (call, message, visit) for 14 days | Day 14 of inactivity | In-app notification badge on lead card |
| **Batch reengagement prompt** | Broker has 5+ dormant leads (no activity in 21+ days) | Weekly, on broker's least busy day (learned from usage patterns) | In-app dashboard card + push |
| **Empty pipeline trigger** | Broker's active pipeline drops below a threshold (e.g., fewer than 3 active leads) | When broker opens dashboard and active pipeline is thin | Empty state prompt on dashboard |
| **Post-closing momentum** | Broker just closed a sale and has dormant leads waiting | 24 hours after sale is registered | In-app celebration + suggestion |
| **Seasonal reengagement** | Leads dormant for 60-90 days during historically high-activity periods (e.g., beginning of year, post-vacation) | Seasonal calendar triggers | Email digest |

#### Message Examples

- **Dormancy alert:** "It's been 14 days since your last contact with Ana Costa. A quick check-in could reignite interest — would you like to schedule a reengagement?"
- **Batch prompt:** "You have 8 leads that haven't heard from you in 3+ weeks. Want to launch a reengagement campaign? Brokers who re-approach dormant leads recover 15-20% of them."
- **Empty pipeline:** "Your active pipeline is looking thin — but you have 12 dormant leads that might be ready for a second chance. Tap here to review them."
- **Post-closing:** "Congratulations on closing the Jardins deal! While you're on a roll, 6 dormant leads are waiting for a check-in. Want to ride the momentum?"

#### Psychology Principles

- **Loss aversion:** Framing dormant leads as "potential revenue slipping away" is more motivating than "leads to contact." Each dormant lead card could show an estimated deal value fading over time
- **Zeigarnik Effect:** A persistent, subtle indicator on the dashboard — "12 leads awaiting reengagement" — creates unresolved tension that motivates action
- **Variable rewards:** Some reengaged leads will convert, creating an unpredictable reward loop. Celebrate recoveries prominently: "You recovered a lead that was dormant for 45 days!"
- **Social proof:** "Brokers on Lais recover an average of 18% of dormant leads through reengagement campaigns" provides normative motivation

#### Reengagement Cadence Design

Based on time-based intelligent prompt research (Strategy 7), the optimal dormant lead reengagement cadence is:

| Days Dormant | Action | Intensity |
|-------------|--------|-----------|
| 14 days | First gentle re-approach (casual check-in) | Low — "Just checking in" tone |
| 21 days | Value-add touchpoint (share a new listing matching their criteria) | Medium — provide a reason to re-engage |
| 30 days | Direct question about continued interest | Medium-high — "Are you still looking?" |
| 60 days | Seasonal/market update with soft CTA | Low — informational, no pressure |
| 90+ days | Archive suggestion or long-term nurture list | Minimal — respect the silence |

#### Anti-Patterns to Avoid

- Do NOT reengagement-prompt leads the broker has explicitly disqualified
- Do NOT send batch reengagement prompts on the broker's busiest days (learn from activity patterns)
- Do NOT frame reengagement as "you forgot about these leads" — this creates guilt, not motivation. Frame as opportunity: "These leads might be ready now"
- Do NOT auto-send messages to dormant leads without broker review — the broker must control the outreach

#### KPIs

| Metric | Target |
|--------|--------|
| Dormant lead reengagement rate | 15-20% recovery |
| Time to first reengagement attempt | Reduce from current avg to <21 days |
| Remarketing campaign feature adoption | +30% of active brokers using it monthly |
| Recovered lead conversion rate | Track as separate cohort |

---

### Topic 3: Register a New Lead

**Core Challenge:** Lead registration is the entry point to the entire CRM funnel, but brokers often capture lead information on the go (at open houses, calls, networking events) and delay formal registration, leading to lost or incomplete data. The trigger system must make registration frictionless and immediate.

**Primary Strategy:** Micro-Commitment Facilitation + Progressive Onboarding Checklist + Achievement Gamification (Strategies 3, 2 & 4)

#### Trigger Moments

| Trigger | Condition | Timing | Channel |
|---------|-----------|--------|---------|
| **Quick-capture prompt** | Broker hasn't registered a new lead in 7+ days despite being active | After broker's 3rd login without a new lead | In-app subtle banner |
| **Post-event capture** | Broker logs a property visit or open house | Immediately after visit/event log | In-app prompt: "Meet anyone new at the visit?" |
| **Incomplete lead nudge** | Lead registered with only name + phone (missing email, property preferences, budget) | 2 hours after incomplete registration | In-app notification on lead card |
| **First-lead celebration** | New Lais user registers their first lead | Immediately upon first lead save | Celebration modal with next-step suggestion |
| **Bulk import discovery** | Broker has been registering leads one by one (5+ in a session) | After 3rd manual lead in same session | Tooltip: "Did you know you can import leads in bulk?" |

#### Message Examples

- **Post-event capture:** "You just logged a visit to Apartamento Copacabana. Did you meet any new prospects? Add them now while the details are fresh."
- **Incomplete lead:** "Maria Santos is missing her property preferences and budget range. Complete her profile to get better matching suggestions."
- **First-lead celebration:** "Your first lead is in! You're on your way. Next step: schedule a visit or send a proposal to keep the momentum going."
- **Bulk import:** "Registering leads one by one? Save time — import your contacts from a spreadsheet in one click."

#### Psychology Principles

- **Micro-commitments:** The quick-capture flow asks for just name + phone first (10-second action), then progressively requests more detail. Small first step → deeper investment
- **Zeigarnik Effect:** Incomplete lead profiles display a visible completion percentage. "Lead profile: 40% complete" creates a pull to fill in the gaps
- **Achievement system:** Lead registration milestones — "10th lead registered!" "First lead this week!" — celebrate the behavior of feeding the pipeline
- **Facilitator trigger (Fogg Model):** When motivation is moderate but ability is low (on the go), reduce friction to minimum: voice-to-text lead capture, single-field quick add

#### Anti-Patterns to Avoid

- Do NOT block the broker from saving a minimal lead (name + phone). Progressive completion is better than gatekeeping
- Do NOT show the "no leads registered recently" banner to brokers who are clearly active with existing leads (closing deals, scheduling visits)
- Do NOT overwhelm new users with the bulk import feature before they've manually registered at least 3 leads and understand the data model

#### KPIs

| Metric | Target |
|--------|--------|
| Leads registered per broker per week | +15% from baseline |
| Lead profile completion rate | 70%+ of leads with full profiles within 7 days |
| Time from first contact to lead registration | Reduce by 40% |
| Quick-capture → full profile conversion | 60%+ complete profile within 48h |

---

### Topic 4: Send a Proposal

**Core Challenge:** Sending a property proposal is a high-commitment action that moves a lead toward a decision. Brokers delay proposals because crafting them takes effort, they're unsure which properties to include, or they lose track of which leads are proposal-ready. Triggers must reduce friction and help brokers recognize when a lead is ready for a proposal.

**Primary Strategy:** Behavior-Triggered Contextual Prompt + Facilitator Trigger + Empty State Discovery (Strategies 1, Fogg Model & 6)

#### Trigger Moments

| Trigger | Condition | Timing | Channel |
|---------|-----------|--------|---------|
| **Post-visit proposal prompt** | Broker logs a completed property visit with a lead | 2-4 hours after visit completion (give broker time to assess) | In-app notification |
| **Lead readiness signal** | A lead has had 2+ visits and no proposal yet | When broker opens that lead's profile | Contextual banner on lead detail |
| **Property match alert** | New listing matches a lead's registered preferences (budget, location, type) | Within 1 hour of new listing registration | In-app + push |
| **Proposal template discovery** | Broker is on the proposal creation screen for the first time or hasn't sent one in 30+ days | On page load of proposal screen | Empty state with template suggestions |
| **Competitive urgency** | Multiple leads are interested in the same property | When broker views a property with 2+ interested leads | In-app alert: "2 other leads are viewing this property" |

#### Message Examples

- **Post-visit:** "How was the visit to Apartamento Vila Madalena with Rafael? If he's interested, sending a proposal within 24h keeps the momentum strong."
- **Lead readiness:** "Pedro has visited 3 properties but hasn't received a proposal yet. He might be waiting for a formal offer — want to send one?"
- **Property match:** "New listing alert: A 3BR in Pinheiros just listed at R$850K — this matches exactly what Camila is looking for. Send her a proposal?"
- **Template discovery:** "First time creating a proposal? Start with one of our templates — most brokers customize and send in under 5 minutes."

#### Psychology Principles

- **Facilitator (Fogg):** Proposal templates, pre-populated property data, and one-click send dramatically reduce the effort required. High motivation + low friction = action
- **Social proof:** "Brokers who send proposals within 24h of a visit have a 2x higher close rate" provides data-backed motivation
- **Scarcity/urgency:** The competitive urgency trigger ("2 other leads viewing this property") leverages FOMO without being manipulative — it reflects genuine market reality in real estate
- **Post-action completion window:** The 2-4 hour post-visit window is the peak receptivity moment identified in engagement research

#### Anti-Patterns to Avoid

- Do NOT auto-generate and send proposals without broker approval — proposals are high-stakes communications
- Do NOT fire the "lead readiness" banner if the broker has added notes indicating the lead isn't ready ("still deciding", "needs financing approval")
- Do NOT create fake urgency — the competitive urgency trigger should only fire when there genuinely are multiple interested leads
- Do NOT prompt for proposals on leads that have already received one (unless it's been 14+ days with no response — then suggest a follow-up, which connects to Topic 6)

#### KPIs

| Metric | Target |
|--------|--------|
| Proposal send rate (proposals/qualified leads) | +25% from baseline |
| Time from last visit to proposal sent | Reduce to <48h average |
| Proposal template usage rate | 50%+ of proposals start from template |
| Proposal → response rate | Track as conversion metric |

---

### Topic 5: Register a New Property Listing

**Core Challenge:** Property listings are the inventory that powers the entire brokerage. Incomplete listings (missing photos, floor plans, pricing) reduce matching effectiveness and client trust. Brokers often register properties hastily and never complete the listing, or they have properties they haven't digitized at all.

**Primary Strategy:** Progressive Onboarding Checklist + Empty State Feature Discovery + Zeigarnik Completion Pull (Strategies 2, 6 & Psychology)

#### Trigger Moments

| Trigger | Condition | Timing | Channel |
|---------|-----------|--------|---------|
| **Listing completeness nudge** | Property registered with <60% profile completeness (missing photos, price, description) | 4 hours after initial registration | In-app notification on listing card |
| **Photo prompt** | Listing has 0 photos | When broker views the listing detail page | Empty state: "Add photos to get 5x more lead interest" |
| **Price update reminder** | Listing price hasn't been updated in 60+ days | On the 60th day since last price edit | In-app notification |
| **New listing celebration** | Broker registers a new property | Immediately upon save | Brief celebration + checklist for completion |
| **Matching opportunity** | A newly registered listing matches existing lead preferences | Within 30 minutes of listing registration | In-app alert: "3 of your leads match this listing" |

#### Message Examples

- **Completeness nudge:** "Apartamento Itaim is only 45% complete — listings with full profiles get matched to 5x more leads. Add photos and a description?"
- **Photo empty state:** "This listing has no photos yet. Properties with 8+ photos receive 3x more inquiries. Upload photos to boost visibility."
- **Price update:** "The price for Casa Morumbi hasn't been updated in 2 months. Market conditions may have changed — want to review?"
- **Matching opportunity:** "You just listed a 2BR in Moema at R$650K. 3 of your active leads are looking for exactly this — send them proposals?"

#### Psychology Principles

- **Zeigarnik Effect (primary driver):** A visible completeness bar on every listing card — "45% complete" — creates persistent cognitive tension. Research shows 67% improvement in task completion with progress indicators
- **Loss framing:** "Listings with incomplete profiles miss 80% of potential matches" frames incompleteness as lost opportunity
- **Immediate reward:** The matching opportunity trigger provides instant gratification — register a listing, immediately see leads who want it
- **Checklist gamification:** A 5-item completion checklist (photos, price, description, floor plan, availability) with checkmarks and a celebration at 100%

#### Anti-Patterns to Avoid

- Do NOT nag about listing completeness more than once per week for the same listing
- Do NOT block listing registration by requiring all fields upfront — allow progressive completion
- Do NOT show the price update reminder for recently sold properties
- Do NOT fire the matching opportunity trigger if there are 0 matching leads — silence is better than a disappointing "0 matches"

#### KPIs

| Metric | Target |
|--------|--------|
| Average listing completeness score | 80%+ within 7 days of registration |
| Listings with photos | 90%+ have at least 3 photos |
| Listing-to-proposal conversion | Track listings that generate proposals |
| Price freshness | 80%+ of active listings updated within 60 days |

---

### Topic 6: Schedule a Follow-Up

**Core Challenge:** Follow-ups are the lifeblood of real estate sales, yet they're the most commonly dropped ball. Brokers juggle dozens of leads at various stages and rely on memory or scattered notes. A missed follow-up doesn't just lose one deal — it damages the broker's reputation. The trigger system must function as an intelligent second brain for follow-up management.

**Primary Strategy:** Time-Based Intelligent Prompts + Behavior-Triggered Contextual Prompts + Streak Gamification (Strategies 7, 1 & 4)

#### Trigger Moments

| Trigger | Condition | Timing | Channel |
|---------|-----------|--------|---------|
| **Post-interaction auto-suggest** | Broker completes any interaction with a lead (call, visit, proposal sent, message) | 5 seconds after interaction is logged | In-app slide-in: "Schedule next follow-up?" |
| **Overdue follow-up alert** | A scheduled follow-up date has passed without being marked complete | Morning of the overdue day, at broker's typical start time | Push notification + in-app badge |
| **Follow-up gap detection** | Lead has had no scheduled follow-up and last interaction was 5+ days ago | Day 5 of no scheduled activity | In-app notification on lead card |
| **Daily follow-up briefing** | Broker has follow-ups scheduled for today | At broker's typical morning login time | Dashboard card: "Today's follow-ups" |
| **Follow-up streak** | Broker has completed all scheduled follow-ups for 5+ consecutive days | Upon completing the day's last follow-up | Celebration: "5-day follow-up streak!" |

#### Message Examples

- **Post-interaction:** "You just visited Cobertura Leblon with Fernanda. When should we follow up? [Tomorrow] [In 3 days] [Next week] [Custom]"
- **Overdue alert:** "Heads up — your follow-up with Lucas about the Jardins apartment was due yesterday. Want to reach out now?"
- **Gap detection:** "It's been 7 days since your last contact with Beatriz. She viewed 2 properties — this might be a good time to check in."
- **Daily briefing:** "Good morning! You have 4 follow-ups today: Fernanda (call), Lucas (proposal), Beatriz (visit), and Pedro (message)."
- **Streak:** "5-day follow-up streak! You haven't missed a beat. Your leads are 40% more likely to convert with consistent follow-up."

#### Psychology Principles

- **Zeigarnik Effect:** Overdue follow-ups appear with a visual tension indicator (red badge, subtle urgency color). The incomplete task nags at the broker until resolved
- **Streak mechanics (Duolingo model):** Follow-up streaks create daily habit formation. Research shows 3x daily return rate with active streaks. Losing a streak triggers loss aversion — "Don't break your 12-day streak!"
- **Facilitator (Fogg):** The post-interaction prompt offers one-tap scheduling with pre-set intervals. Friction is near zero at the moment of highest motivation (just after a productive interaction)
- **Hook Model:** Trigger (notification) → Action (schedule/complete follow-up) → Variable Reward (lead responds, deal progresses) → Investment (follow-up history builds relationship data)

#### Anti-Patterns to Avoid

- Do NOT send overdue follow-up alerts during evenings or weekends unless the broker has explicitly opted into off-hours notifications
- Do NOT create guilt-based messaging ("You missed 3 follow-ups!") — frame as opportunity ("3 leads are waiting to hear from you")
- Do NOT allow follow-up fatigue: if a broker consistently dismisses follow-up suggestions for a specific lead, reduce frequency and eventually suggest archiving
- Do NOT make the streak mechanic punitive — if a broker breaks a streak, offer a "streak saver" recovery mechanism rather than resetting to zero

#### KPIs

| Metric | Target |
|--------|--------|
| Follow-up scheduling rate (% of interactions followed by a scheduled follow-up) | 80%+ |
| Overdue follow-up rate | <10% of scheduled follow-ups |
| Average follow-up completion streak | 7+ consecutive days |
| Follow-up → next stage conversion | Track progression through funnel |

---

### Topic 7: Schedule Property Availability

**Core Challenge:** Brokers need to manage when properties are available for viewing. Poor availability management leads to double-bookings, missed showings, and wasted time for both brokers and clients. The trigger system must help brokers keep availability current and capitalize on scheduling opportunities.

**Primary Strategy:** Behavior-Triggered Contextual Prompts + Time-Based Prompts + Facilitator Triggers (Strategies 1, 7 & Fogg)

#### Trigger Moments

| Trigger | Condition | Timing | Channel |
|---------|-----------|--------|---------|
| **New listing availability** | Broker registers a new property listing without setting availability | Immediately after listing save, if no availability set | In-app prompt on listing confirmation screen |
| **Visit request mismatch** | Lead requests a visit for a property with no availability slots | When the visit request is received | In-app alert to broker |
| **Weekly availability review** | Broker has active listings with availability windows older than 7 days | Weekly, on Sunday evening or Monday morning | Push notification |
| **Post-visit slot opening** | A visit is completed, freeing up the time slot | 30 minutes after visit marked complete | Contextual suggestion: "This slot is now free — open it for other leads?" |
| **High-demand alert** | A property has received 3+ visit requests in 48 hours | When 3rd request arrives | In-app alert: "High demand — consider adding more availability" |

#### Message Examples

- **New listing:** "Great, Apartamento Consolação is live! Set availability windows so leads can book visits. [Add availability now]"
- **Visit request mismatch:** "Marcos wants to visit Casa Alphaville but there are no availability slots set. Add some to accommodate his request?"
- **Weekly review:** "Quick check: 4 of your listings have outdated availability. A 2-minute update keeps your calendar accurate."
- **High demand:** "Cobertura Pinheiros is hot — 5 visit requests in the last 2 days. Add more time slots to keep up with demand?"

#### Psychology Principles

- **Facilitator (Fogg):** Pre-populated availability templates based on broker's historical patterns ("You usually show properties Tue/Thu/Sat afternoons — use this schedule?")
- **Social proof/demand signal:** "5 visit requests" creates urgency grounded in real demand, motivating the broker to act
- **Loss framing:** "3 leads couldn't book visits because no slots were available" quantifies missed opportunity

#### Anti-Patterns to Avoid

- Do NOT auto-set availability without broker confirmation
- Do NOT send weekly reviews for listings the broker has marked as inactive/rented/sold
- Do NOT create artificial urgency around availability — only use real demand signals

#### KPIs

| Metric | Target |
|--------|--------|
| Listings with active availability | 90%+ of active listings |
| Visit request fulfillment rate | 85%+ of requests accommodated |
| Average time from visit request to confirmed booking | <24 hours |
| Availability freshness | 80%+ updated within last 7 days |

---

### Topic 8: Register a Sale/Closing

**Core Challenge:** Registering a sale is the culmination of the entire pipeline, but brokers sometimes delay formal registration (paperwork burden, multi-step process) or forget to update the system after verbal agreements. Unregistered sales create inaccurate pipeline data, missed commission tracking, and lost insights. The trigger system must make sale registration effortless and celebratory.

**Primary Strategy:** Achievement-Based Gamification + Facilitator Trigger + Post-Action Completion Momentum (Strategies 4, Fogg & Engagement Windows)

#### Trigger Moments

| Trigger | Condition | Timing | Channel |
|---------|-----------|--------|---------|
| **Deal stage progression** | Lead's latest activity suggests a closing (e.g., final visit logged, contract-related notes) | When broker adds closing-related notes or tags | Contextual prompt: "Is this deal closing? Register the sale" |
| **Proposal acceptance signal** | Lead has an accepted/approved proposal with no registered sale | 48 hours after proposal status changes to "accepted" | In-app notification |
| **Sale celebration** | Broker registers a completed sale | Immediately upon save | Full celebration modal with stats |
| **Monthly/quarterly milestone** | Broker reaches a sales milestone (1st sale, 5th sale, best month) | At milestone moment | Achievement badge + leaderboard update |
| **Pipeline cleanup** | Leads in "negotiation" stage for 30+ days without update | At the 30-day mark | In-app prompt: "Update on the Jardins deal — still in negotiation?" |

#### Message Examples

- **Deal stage progression:** "You added 'contract signed' to the notes for Pedro's deal. Is this one closed? Register the sale to update your pipeline!"
- **Proposal acceptance:** "Your proposal for Apartamento Leblon was accepted 2 days ago. Ready to register the sale?"
- **Sale celebration:** "CLOSED! You just registered your 8th sale this quarter — that's 20% above your average. Here's your impact: R$4.2M in total deal value this quarter."
- **Monthly milestone:** "Best month yet! 4 sales in January. You're in the top 15% of Lais brokers this month."
- **Pipeline cleanup:** "The negotiation with Beatriz for Casa Morumbi has been open for 35 days. Quick update: still active, closed, or lost?"

#### Psychology Principles

- **Achievement gamification (primary):** Sale registration is the ultimate reward moment. The celebration should be proportional to the achievement — confetti animation, stats summary, milestone badge. This creates a Pavlovian association: register sale → feel great
- **Variable rewards:** Monthly rankings and "top X%" comparisons create variable social rewards that motivate continued performance
- **Commitment escalation:** After celebrating a sale, the post-closing momentum trigger (see Topic 2) invites the broker to re-invest energy into dormant leads, creating a virtuous cycle
- **Loss aversion for pipeline accuracy:** "Unregistered sales don't count toward your leaderboard position" incentivizes timely registration

#### Anti-Patterns to Avoid

- Do NOT make sale registration a multi-page form — it should be completable in under 2 minutes with pre-populated data from the lead/listing
- Do NOT compare brokers on leaderboards without consent — opt-in only for competitive features
- Do NOT trigger pipeline cleanup prompts for deals the broker has recently updated
- Do NOT diminish small sales — celebrate every closing regardless of deal value

#### KPIs

| Metric | Target |
|--------|--------|
| Sale registration latency | <48h from verbal agreement to system registration |
| Pipeline accuracy (sales registered vs. actual closings) | 95%+ |
| Achievement badge engagement | 60%+ of brokers view their badges/stats |
| Post-sale momentum (follow-up on dormant leads within 48h of closing) | 30%+ |

---

### Topic 9: Generate Reports

**Core Challenge:** Reporting is a powerful feature that most brokers underutilize because they don't know what reports are available, they find the interface complex, or they don't see the value until they need it for a specific situation (owner meeting, team review, personal assessment). Triggers must connect reports to the moments when they're most relevant.

**Primary Strategy:** Empty State Feature Discovery + Behavior-Triggered Contextual Prompts + Personalized Segmentation (Strategies 6, 1 & 5)

#### Trigger Moments

| Trigger | Condition | Timing | Channel |
|---------|-----------|--------|---------|
| **First report discovery** | Broker has never generated a report and has 30+ days of data | When broker navigates to reporting section for the first time | Interactive empty state with sample report preview |
| **Owner meeting prep** | Broker has a follow-up scheduled with a property owner | 24 hours before the scheduled follow-up | In-app suggestion: "Prepare a property performance report for your meeting" |
| **Monthly performance nudge** | First week of a new month | 1st or 2nd business day of month | Dashboard card: "Your January results are in — generate your monthly report" |
| **Milestone report** | Broker reaches a performance milestone (10th sale, 100th lead, 1 year on platform) | At milestone moment | "See your journey: Generate your milestone report" |
| **Comparative insight** | Broker's metrics have significantly changed (up or down) compared to previous period | When broker opens dashboard | Contextual insight: "Your conversion rate jumped 15% this month — see the full breakdown" |

#### Message Examples

- **First discovery (empty state):** "Reports turn your data into insights. Here's a preview of what your monthly performance report looks like. [Generate my first report]"
- **Owner meeting prep:** "You're meeting the owner of Casa Pinheiros tomorrow. Generate a property activity report showing visits, inquiries, and market comparisons — it takes 30 seconds."
- **Monthly nudge:** "January is in the books. You had 12 visits, 3 proposals, and 1 closing. See the full picture? [Generate monthly report]"
- **Comparative insight:** "Your lead conversion rate is up 15% from last month. Want to see what changed? [View detailed report]"

#### Psychology Principles

- **Empty state transformation:** Instead of a blank reports page, show a preview/sample of what a generated report looks like with the broker's actual data — this bridges the imagination gap
- **Contextual relevance (peak receptivity):** The owner meeting prep trigger fires at exactly the moment the report has maximum practical value — this is the "I-want-to-do" micro-moment
- **Curiosity gap:** "Your conversion rate jumped 15%" creates a curiosity gap that the report resolves
- **Facilitator:** One-click report generation with smart defaults eliminates the friction of configuring report parameters

#### Anti-Patterns to Avoid

- Do NOT push reports on brokers who have minimal data (<30 days or <5 leads) — the reports won't be meaningful
- Do NOT send monthly report nudges to brokers who already generate reports regularly — they don't need the reminder
- Do NOT overwhelm with report options — present the 2-3 most relevant reports for the broker's role and stage, not the full catalog
- Do NOT generate reports automatically and send them unsolicited — let the broker initiate

#### KPIs

| Metric | Target |
|--------|--------|
| Report feature adoption (% of brokers generating at least 1 report/month) | 40%+ |
| Report generation frequency | 2+ reports per broker per month |
| Time from report prompt to generation | <60 seconds |
| Report sharing rate (sent to owners, team) | Track as engagement metric |

---

### Topic 10: Manage Team Tasks

**Core Challenge:** Team leads and brokerage managers need to distribute and track work across their team. Task management in a CRM is often underused because managers default to WhatsApp, verbal delegation, or spreadsheets. The trigger system must demonstrate that in-platform task management is faster, more trackable, and more effective than informal alternatives.

**Primary Strategy:** Progressive Onboarding Checklist + Social Proof + Behavior-Triggered Contextual Prompts (Strategies 2, Psychology & 1)

#### Trigger Moments

| Trigger | Condition | Timing | Channel |
|---------|-----------|--------|---------|
| **First delegation prompt** | Manager assigns a lead to a team member but doesn't create an associated task | 5 seconds after lead assignment | In-app slide-in: "Add a task for this assignment?" |
| **Task completion visibility** | Team member completes an assigned task | Immediately upon completion | In-app notification to manager: "Fernanda completed: Call lead Rafael" |
| **Overdue team tasks** | Manager has team members with overdue tasks | Manager's morning login | Dashboard card: "3 overdue team tasks need attention" |
| **Weekly team pulse** | End of work week | Friday afternoon at manager's typical wrap-up time | Dashboard summary: "Team productivity this week" |
| **Team onboarding** | New team member joins the brokerage on Lais | When new member is added to team | Guided flow: "Create onboarding tasks for [Name]?" |

#### Message Examples

- **First delegation:** "You assigned Apartamento Moema to Carlos. Want to add a task to make sure it gets done? [Call lead by tomorrow] [Schedule visit this week] [Custom task]"
- **Task completion:** "Carlos completed: 'Schedule visit for Apartamento Moema' — visit is booked for Thursday."
- **Overdue tasks:** "3 tasks are overdue across your team: 2 from Carlos (both 1 day late) and 1 from Fernanda (3 days late). Review now?"
- **Weekly pulse:** "This week: Your team completed 24 of 28 tasks (86%). Top performer: Fernanda (8/8). Carlos has 2 pending — want to check in?"
- **Team onboarding:** "Welcome Carlos to the team! Create onboarding tasks to get him started: [Import his contacts] [Assign first leads] [Schedule training] [Custom]"

#### Psychology Principles

- **Social proof within teams:** Team performance visibility ("Fernanda: 8/8 tasks this week") creates healthy normative pressure without being punitive
- **Accountability loop:** The completion notification closes the delegation loop — managers see results, team members know their work is visible. This creates the Hook Model's investment phase
- **Zeigarnik for managers:** "3 overdue tasks" is an incomplete state that demands resolution
- **Progressive checklist for onboarding:** New team member onboarding as a checklist leverages the 67% completion improvement that checklists provide

#### Anti-Patterns to Avoid

- Do NOT expose individual team member performance rankings without the manager's explicit configuration — this can create toxic competition
- Do NOT send task completion notifications for trivial tasks — only for meaningful milestones (visit completed, proposal sent, not "read a lead's profile")
- Do NOT nag team members directly about overdue tasks — route through the manager, who decides how to follow up
- Do NOT make task management feel like surveillance — frame as support ("Help Carlos stay on track") not monitoring ("Track Carlos's every move")

#### KPIs

| Metric | Target |
|--------|--------|
| Team task adoption (% of managers using task management) | 50%+ |
| Task completion rate across teams | 80%+ on time |
| Delegation-to-task conversion (% of lead assignments with an associated task) | 60%+ |
| Manager weekly pulse engagement | 70%+ of managers viewing weekly summary |

---

## Cross-Topic Implementation Roadmap

### Phase 1: Foundation Triggers (Weeks 1-4)

Deploy rule-based triggers for the highest-impact, easiest-to-implement moments:

| Priority | Topic | Trigger | Why First |
|----------|-------|---------|-----------|
| 1 | Topic 6 | Post-interaction follow-up suggestion | Highest frequency action, near-zero friction |
| 2 | Topic 1 | Post-lead registration visit prompt | Critical pipeline velocity action |
| 3 | Topic 3 | Incomplete lead profile nudge | Zeigarnik Effect drives completion naturally |
| 4 | Topic 5 | Listing completeness bar + nudge | Same Zeigarnik mechanic, improves data quality |
| 5 | Topic 8 | Sale celebration modal | Positive reinforcement, builds habit of registering |

**Technical requirements:** Event listeners on core CRUD actions, basic notification system, user preference storage for dismissed triggers.

### Phase 2: Intelligent Timing (Weeks 5-8)

Add time-aware and pattern-aware triggers:

| Priority | Topic | Trigger | Why Second |
|----------|-------|---------|------------|
| 6 | Topic 6 | Daily follow-up briefing + overdue alerts | Requires scheduling system |
| 7 | Topic 2 | Dormancy detection + reengagement prompts | Requires lead activity tracking over time |
| 8 | Topic 7 | Availability freshness reminders | Requires time-based monitoring |
| 9 | Topic 4 | Post-visit proposal prompt (2-4h delay) | Requires visit event + delay queue |
| 10 | Topic 9 | Monthly report nudge | Calendar-based, simple scheduling |

**Technical requirements:** Background job scheduler, lead activity timeline tracking, broker login pattern learning.

### Phase 3: Behavioral Intelligence (Weeks 9-16)

Add context-aware and ML-informed triggers:

| Priority | Topic | Trigger | Why Third |
|----------|-------|---------|-----------|
| 11 | Topic 4 | Property match alerts | Requires matching algorithm |
| 12 | Topic 2 | Batch reengagement with optimal timing | Requires broker activity pattern learning |
| 13 | Topic 10 | Team productivity pulse + onboarding flows | Requires team analytics |
| 14 | Topic 9 | Contextual report suggestions (owner meeting prep) | Requires calendar + context integration |
| 15 | Topic 8 | Deal stage progression detection | Requires NLP on notes or structured tags |

**Technical requirements:** Property-lead matching engine, broker behavior pattern models, team analytics dashboard, contextual inference.

### Phase 4: Adaptive Optimization (Weeks 17+)

Refine all triggers with learned data:

- **Send-time optimization:** Learn each broker's peak receptivity windows (not everyone is a morning person)
- **Fatigue management:** Implement the fatigue risk scoring model to dynamically throttle triggers per broker
- **A/B testing:** Test trigger copy, timing delays, and channel preferences systematically
- **Gamification layer:** Roll out achievement badges, streaks, and leaderboards across topics
- **Cross-topic coordination:** Ensure triggers from different topics don't stack — a broker shouldn't receive a follow-up reminder, a dormancy alert, and a listing nudge in the same 10-minute window

---

## Fatigue Management for the Lais Ecosystem

### The Core Risk

Real estate brokers are mobile, busy, and context-switching constantly. A CRM that interrupts at the wrong moment will get muted, and a muted CRM is a dead CRM. Less than 1% of notifications generate engagement across the app ecosystem — Lais must be in that 1%.

### Global Trigger Budget

| Scope | Maximum | Notes |
|-------|---------|-------|
| Per session | 3 triggers | Across all 10 topics combined |
| Per hour | 1 trigger | For active in-app users |
| Per day | 5 triggers | Across all channels (in-app + push + email) |
| Per week | 15 triggers | Total, with at least 2 "quiet days" |

### Priority Hierarchy

When multiple triggers are eligible simultaneously, fire the highest-priority one and suppress the rest:

1. **Overdue follow-ups** (Topic 6) — Time-sensitive, revenue-impacting
2. **Visit/proposal opportunities** (Topics 1, 4) — Pipeline velocity
3. **Sale registration** (Topic 8) — Data accuracy
4. **Lead/listing completeness** (Topics 3, 5) — Data quality
5. **Dormant lead reengagement** (Topic 2) — Pipeline recovery
6. **Availability management** (Topic 7) — Operational efficiency
7. **Reports and team tasks** (Topics 9, 10) — Nice-to-have, non-urgent

### Suppression Rules

1. No trigger within 2 minutes of a previous trigger
2. No triggers during active typing or form completion
3. No triggers if broker dismissed a similar trigger in the last 24 hours
4. Respect "do not disturb" hours set by the broker
5. Reduce frequency by 30% if notification open rate drops below 20% over a 7-day window
6. Pause non-critical triggers entirely if fatigue risk score exceeds 0.6

### Channel Strategy

| Channel | Best For | Frequency Cap |
|---------|----------|---------------|
| **In-app contextual** (tooltips, slide-ins) | Moment-of-action prompts, feature discovery | 3/session |
| **In-app dashboard cards** | Daily briefings, summaries, milestones | 2-3 cards visible at a time |
| **Push notifications** | Overdue follow-ups, time-sensitive alerts | 1-2/day max |
| **Email** | Weekly summaries, monthly reports, dormant lead digests | 1-2/week max |

---

## Measurement Framework

### Leading Indicators (Track Weekly)

| Metric | Description | Target |
|--------|-------------|--------|
| Trigger view rate | % of brokers who see at least 1 trigger per session | 80%+ |
| Trigger interaction rate | % of triggers that receive a click/tap | 15%+ |
| Trigger-to-action conversion | % of interactions that lead to the suggested action | 40%+ |
| Trigger dismissal rate | % of triggers actively dismissed | <35% |
| Notification opt-out rate | % of brokers disabling push notifications | <10% |

### Lagging Indicators (Track Monthly)

| Metric | Description | Target |
|--------|-------------|--------|
| Pipeline velocity | Average time from lead creation to sale | Reduce by 15% |
| Broker activation rate | % of registered brokers completing 3+ key actions in first week | 60%+ |
| Feature adoption breadth | Average number of features used per broker (out of 10 topics) | 6+ |
| Broker retention (D30) | % of brokers still active at 30 days | Improve by 20% |
| NPS impact | Net Promoter Score change after trigger system launch | +5 points |

### A/B Testing Priorities

1. **Trigger timing:** 5s vs. 15s vs. 2h post-event delays
2. **Message framing:** Opportunity ("3 leads match") vs. loss ("3 leads waiting") vs. neutral ("New matches available")
3. **Channel preference:** In-app vs. push for the same trigger type
4. **Gamification presence:** With vs. without streaks/badges on follow-up completions
5. **Personalization depth:** Generic message vs. lead-name-personalized vs. full-context-personalized

---

## Summary: Trigger Strategy Map

| Topic | Primary Strategy | Key Psychology | Critical Trigger |
|-------|-----------------|----------------|-----------------|
| 1. Schedule visits | Behavior + Time-based | Zeigarnik, loss aversion | Post-lead registration nudge |
| 2. Dormant lead reengagement | Time-based + Empty state | Loss aversion, variable rewards | 14-day dormancy alert |
| 3. Register leads | Micro-commitment + Checklist | Zeigarnik, facilitator | Incomplete lead profile nudge |
| 4. Send proposals | Behavior + Facilitator | Social proof, FOMO (real) | Post-visit proposal prompt |
| 5. Register listings | Checklist + Empty state | Zeigarnik, loss framing | Listing completeness bar |
| 6. Schedule follow-ups | Time-based + Streaks | Streak mechanics, Hook Model | Post-interaction auto-suggest |
| 7. Property availability | Behavior + Facilitator | Demand signaling, loss framing | New listing availability prompt |
| 8. Register sales | Gamification + Facilitator | Achievement, variable rewards | Sale celebration modal |
| 9. Generate reports | Empty state + Contextual | Curiosity gap, facilitator | Owner meeting prep suggestion |
| 10. Team tasks | Checklist + Social proof | Accountability, Zeigarnik | First delegation prompt |

---

**Report Compiled By:** Claude
**Date:** February 11, 2026
**Based On:** Smart Trigger Suggestions Benchmark Report + Optimal Engagement Windows Research Report
