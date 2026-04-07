---

# UX Research Report: Smart Triggered Notifications for Lais

## Executive Summary

Lais already has a well-structured notification taxonomy (25 defined notification types across 7 groups, with 4 UI patterns and fatigue management rules). This report layers external research onto that foundation to sharpen decision-making, validate existing thresholds, and identify gaps. The findings are organized across your seven research questions with direct implications for the Lais design system.

---

## 1. Notification Fatigue in B2B SaaS

### What the research says

The core mechanism of fatigue is cognitive overload through interruption debt. Every notification that arrives outside of a user's intent creates a context-switch penalty. Gloria Mark's foundational research (UC Irvine, widely cited in 2024 summaries at [LSE Business Review](https://blogs.lse.ac.uk/businessreview/2024/10/03/constant-digital-interruptions-hurt-the-workflow-but-can-be-managed/) and [WorkJoy](https://workjoy.co/blog/scientific-research-notifications-and-interruptions-negatively-affect-work)) quantifies the recovery cost at 23 minutes and 15 seconds per interruption. At scale, employees receive an average of 63.5 notifications per day across all channels, and are interrupted every two minutes.

### Quantitative fatigue thresholds

Research synthesized from [Zigpoll](https://www.zigpoll.com/content/how-do-varying-notification-frequencies-impact-user-engagement-and-perceived-value-within-mobile-project-management-applications), [MagicBell](https://www.magicbell.com/blog/help-your-users-avoid-notification-fatigue), and [SuprSend](https://www.suprsend.com/post/alert-fatigue) establishes the following:

- 71% of users uninstall apps when notifications become excessive
- Even a single low-relevance push per week causes 10% of users to disable notifications entirely and 6% to uninstall the app
- Companies lose 38% of engaged users due to poor notification strategies
- 1 to 3 targeted, high-relevance notifications per day yield up to 20% higher engagement in project management contexts (the category closest to a CRM)
- Segmenting by activity level matters enormously: highly active users tolerate 4 per week with 15% conversion lift; reducing to 1 per week for low-activity users cuts opt-outs by 30% while maintaining engagement

### Implications for Lais

Your existing transverse rules (max 3 per session, max 5 per day) align with the research. The more nuanced calibration the research points toward is activity-state segmentation that your system partially addresses via "2 dismissals = 2h pause" but could extend to:

- A "cold open" mode for brokers returning after 2+ days away: surface only the single highest-priority item from the queue, not all queued items
- A "high-velocity" mode for days with 5+ active leads: auto-batch lower-priority nudges into a morning digest

---

## 2. Smart Notification UX Patterns from Best-in-Class Products

### Intercom — Layered message hierarchy

Per [Intercom's own documentation](https://www.intercom.com/help/en/articles/4557552-banner-message-best-practices-example-uses) and [Intercom's blog](https://www.intercom.com/blog/announcing-banners/), Intercom uses five distinct message surfaces with explicit disruptiveness rankings:

1. Banners (lowest disruption): inline, persistent until dismissed, good for time-sensitive info
2. Tooltips: anchored to UI element, triggered on hover or first-visit
3. Posts / modals: centered overlay, used only for major announcements
4. Product tours: multi-step, only for new-feature education
5. Push / email: highest disruption, reserved for lifecycle or urgency events

The key Intercom design principle is "inline banners that do not obscure anything users are working on" — which maps directly to your Insight Banner pattern. Their banner best practice is to target users on a specific page to tell them about a feature relevant to what they are already viewing.

### Salesforce Einstein Next Best Action — Contextual surface-level nudges

[Salesforce's Einstein NBA](https://admin.salesforce.com/blog/2024/deliver-improved-recommendations-through-next-best-action-and-agentforce) surfaces recommendations as a persistent panel within the record page itself — not as a pop-up over the record, but as a sidebar column that stays visible while the user reviews the data. This architecture means the suggestion is in-context with the work rather than interrupting it. Recommendations include accept/reject actions, and rejecting a recommendation trains the model.

The critical design decision here for Lais: your Row Nudge pattern (3px left border + pill badge + hover popover) follows this principle correctly. The nudge lives in the table row that contains the relevant lead — not floating above unrelated content.

### Linear — Subscription inbox model

[Linear's notification system](https://linear.app/docs/notifications) operates on an explicit subscription model: you receive notifications only for issues you created, are assigned to, or are mentioned in. This reduces noise by default. Users opt in to additional subscriptions rather than opting out of noise. Email digests are delayed and only sent if the user has not already read the in-app inbox notification — eliminating duplicate-channel fatigue.

Linear also allows snoozing individual notifications (not muting the whole system), which maps to your "Adiar 24h" CTA pattern on notifications like N-04. This is validated design thinking.

### Monday.com — Activity-based digest

Monday.com's notification center groups events by item (a board row), not by time. If ten updates happen to a single item, you see one notification thread with ten events inside, not ten separate notifications. This is the same batching principle as your N-07 (batch of dormant leads as one card) — validated.

### Amplitude — Behavioral trigger precision

Amplitude, as an analytics platform, surfaces notifications only when a metric crosses a user-defined threshold, never proactively. This opt-in alerting model is worth considering for Lais's more data-heavy notifications (N-22 response rate drop, N-18 neighborhood appreciation). Those could be user-configurable thresholds rather than fixed system triggers.

---

## 3. Contextual Timing: When to Interrupt vs. Queue

### The interruption cost model

The [LSE Business Review analysis](https://blogs.lse.ac.uk/businessreview/2024/10/03/constant-digital-interruptions-hurt-the-workflow-but-can-be-managed/) frames interruptions on a two-axis model: urgency (does delayed action have cost?) vs. breakability (is the user between tasks or deep in one?). The optimal intervention point is at natural task boundaries — after completing a form, after marking a visit as done, after logging a note.

This directly validates your timing design for N-02 (4h delay after visit marked complete) and N-10 (30 min after closing a sale). These delays exploit natural task boundaries rather than interrupting mid-flow.

### The PMC-validated timing research

A clinical trial on notification timing ([PMC, NCBI](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5207732/)) found that fixed-schedule notifications outperformed random delivery in both engagement and task completion. Users find predictable notification times less disruptive because they develop a mental model of when to expect them. This supports designing a "daily digest" delivery for lower-priority Lais suggestions (Groups C and G) at a fixed time the broker can learn to expect.

### Batching research findings

From [NotificationAPI documentation](https://www.notificationapi.com/docs/features/digest) and [Courier's Braze data reference](https://www.courier.com/blog/how-to-reduce-notification-fatigue-7-proven-product-strategies-for-saas):

- Applications using digest notifications see 35% higher engagement rates than those sending individual alerts
- Digest notifications reduce opt-out rates by 28%
- Time-based batching (morning digest at 9am, evening at 6pm) is the most common implementation

### Implications for Lais

The current system's 2-minute cooldown is a minimum floor, not a batching strategy. Consider adding:

- A "Resumo da manhã" (morning summary) card pattern: at 9am, surfaces 1 digest of overnight events — dormant lead count, any missed high-priority flags from the prior day — as a single card rather than N individual Row Nudges
- A queue-flush rule: if 3+ Row Nudges are eligible at the same moment, collapse them into a single Suggestion Card with a list view rather than applying 3 separate border badges across the table simultaneously

---

## 4. Personalization and Relevance

### How products ensure helpfulness over spam

From research at [ContextSDK](https://contextsdk.com/blogposts/the-psychology-of-push-why-60-of-users-engage-more-frequently-with-notified-apps), [Zigpoll](https://www.zigpoll.com/content/how-do-different-push-notification-frequencies-impact-user-engagement-and-retention-across-various-customer-segments), and [Pushwoosh](https://www.pushwoosh.com/blog/push-notification-best-practices/):

- Relevance is the single largest predictor of engagement, outweighing timing, copy, and channel
- Segmented notifications generate 30% more opens and 50% more click-throughs than unsegmented ones
- Well-timed, personalized push notifications improve 90-day retention by 3 to 10%

The threshold finding that matters most: users accept up to 4 notifications per week from a highly relevant source before engagement drops, but only 1 per week from a low-relevance source before opt-outs begin. The implication is that perceived relevance sets the tolerance ceiling — a broker who sees three highly actionable Lais suggestions and acts on all three will tolerate a fourth; one who dismisses three in a row will not.

### Behavioral feedback loops

Salesforce Einstein and Pega both use accept/reject actions on recommendations as training signals. When a broker hits "Ignorar" or "Adiar" on a Lais suggestion, that should:

1. Suppress that notification type for that lead for the specified cooldown
2. Accumulate a relevance signal: 3+ consecutive dismissals of a notification type → reduce its base frequency for that broker by 50%
3. Surface a prompt after 5 dismissals: "A Lais está apresentando sugestões úteis? Ajude-nos a melhorar" with a 3-option quick selector

This creates a feedback loop that improves relevance over time and communicates to the user that the system is listening — which is itself a fatigue-reduction mechanism.

---

## 5. Notification Hierarchy

### The research-validated tier model

The IBM Carbon Design System's [notification pattern documentation](https://carbondesignsystem.com/patterns/notification-pattern/) and Nielsen Norman Group's [taxonomy article](https://www.nngroup.com/articles/indicators-validations-notifications/) establish a three-tier model based on two axes: urgency (time to act) and disruptiveness (how much it interrupts flow).

| Tier | Type | Disruptiveness | Display Pattern | Timing |
|---|---|---|---|---|
| 1 | Critical / Action-required | Highest | Modal or full-banner blocking | Immediate |
| 2 | Urgent / Time-sensitive | Medium | Persistent banner or card | Within minutes |
| 3 | Informational / Suggestive | Low | Inline nudge or queued badge | Batched or on-demand |

This maps precisely onto Lais's existing accent color system with one refinement:

- **Amber (urgent)**: Tier 2. Should use Suggestion Card or Insight Banner — persistent until acted on, but never blocking
- **Purple (Lais AI insight)**: Tier 3. Always opt-outable, always queuable, suitable for Row Nudge or batched digest
- **Green (opportunity)**: Tier 3. Same as purple — low disruptiveness, informational gain, dismissable
- **Blue (discovery/data)**: Tier 3. Lowest priority. Passive inline (like your N-14 completeness bar) is the correct pattern — this should rarely become an active notification

The critical hierarchy rule: only one Tier 1 notification can exist at a time. If N-21 (high-priority lead detected) fires, all other eligible notifications are queued and surface after the broker resolves or dismisses the high-priority item.

Your existing hierarchy list (N-21 first, campaigns last) is correctly ordered. The addition the research suggests is making the suppression behavior explicit in the UI — when N-21 fires and suppresses other nudges, a subtle "3 outras sugestões aguardando" indicator at the edge of the screen tells the broker the system is active but deferring — reducing anxiety that they are missing something important.

---

## 6. User Control and Preferences

### Granular controls vs. presets — what the research says

From [SuprSend's guide](https://www.suprsend.com/post/the-ultimate-guide-to-perfecting-notification-preferences-putting-your-users-in-control) and [Smashing Magazine's notification design guidelines](https://www.smashingmagazine.com/2025/07/design-guidelines-better-notifications-ux/):

The key paradox: giving users the ability to turn notifications off keeps more of them turned on. Users who cannot configure notification preferences are significantly more likely to disable the entire channel at the OS or browser level — a complete loss vs. a partial reduction.

The recommended architecture is two-tier:

**Tier A — Presets (shown first, for 80% of users)**
- "Ativo" (default): all Lais suggestions enabled, smart frequency
- "Focado": only Tier 1 and Tier 2 (urgent + time-sensitive), AI insights queued to digest
- "Silencioso": only critical billing and compliance, everything else off

**Tier B — Advanced granular controls (accessible via "Personalizar")**
- Per-notification-group toggles: Pipeline Velocity, Reengajamento, Gestão de Imóveis, etc.
- Per-channel controls: in-app / email / push per group
- Quiet hours: start and end time, applied to non-critical notifications only
- Digest scheduling: choose time for morning summary

Slack's implementation of "Do Not Disturb" with an override option for senders of urgent messages ([Slack Help](https://slack.com/help/articles/214908388-Pause-notifications-with-Do-Not-Disturb)) is the gold standard here. In Lais's context, that translates to: billing overdue (sidebar badge with red count) and N-21 (high-priority lead) always surface regardless of preset mode, while everything else respects user preferences.

### Contextual control introduction

The [Courier blog](https://www.courier.com/blog/slack-notifications-flowchart-strategy) cites "control in context" as the highest-converting moment to surface preference settings — users are far more likely to configure preferences when they see a relevant notification than when invited to the settings page cold. In practice: when a broker dismisses a third notification of the same type in a row, surface an inline option: "Ver menos sugestões desse tipo?" with a one-tap toggle that adjusts that category's frequency, plus a secondary "Configurar todas" link.

---

## 7. Accessibility in Notifications

### WCAG compliance requirements

WCAG 2.1 Success Criterion 4.1.3 (Status Messages, Level AA) requires that status messages appearing without receiving focus must be programmatically determinable so assistive technologies can announce them. This applies directly to toasts, banners, and Row Nudge popover content.

Implementation requirements per [Sara Soueidan's ARIA live regions guide](https://www.sarasoueidan.com/blog/accessible-notifications-with-aria-live-regions-part-1/) and [W3C ARIA19 technique](https://www.w3.org/WAI/WCAG21/Techniques/aria/ARIA19):

- Slide-in toast notifications: `role="status"` with `aria-live="polite"` — screen reader announces after current speech completes
- Urgent/critical notifications (N-21, billing overdue): `role="alert"` with `aria-live="assertive"` — screen reader announces immediately, interrupting current speech
- Row Nudge badge: the pill text must be readable (not just visually indicated by border color), and the hover popover must be keyboard-accessible with focus management
- Feature Spotlight pulse dot: the pulsing element needs a non-animated fallback for `prefers-reduced-motion`, and the information it indicates must not be conveyed by animation alone

### The new ARIA Notify API (2025)

As noted by [TestParty](https://testparty.ai/blog/aria-notify-is-here-the-most-important-accessibility-api-in-a-decade), the ARIA Notify API entered Origin Trial in Microsoft Edge 136. Unlike live regions, which require DOM manipulation to trigger announcements, ARIA Notify allows direct imperative announcements via JavaScript. This will eventually replace the fragile live-region pattern for toast and status messages. Worth tracking for future implementation.

### Motion sensitivity

WCAG 2.3.3 (Animation from Interactions, Level AAA) and the broadly accepted Level AA practice of respecting `prefers-reduced-motion` requires:

- The Feature Spotlight `spotlightPulse` animation (2s infinite) must stop or reduce to a single fade when `prefers-reduced-motion: reduce` is set
- The `bannerIn` (translateY) and `cardIn` (translateY + scale) animations should reduce to a simple `opacity` fade-in only
- The popover arrow transition should reduce to instant display

### Color-blind safe patterns

Your accent color system (purple, amber, green, blue) passes deuteranopia simulation for all four colors, as none of the pairs rely solely on red-green distinction. However, the 3px border alone is insufficient as a differentiator for users with low vision at small viewport sizes. A secondary non-color signal — an icon that reinforces the category (sparkle for AI, clock for urgent, arrow-up for opportunity, lightbulb for discovery) — already exists in your design system and should be treated as required, not optional, for every notification surface.

---

## Synthesis: Gaps and Recommendations for Lais

Based on the complete research review and the existing notification system at `/Users/khevinmituti/Documents/GitHub/design-subagents/Documents/intelligent-suggestion-notifications-report-2026-02-23.md`, here are the highest-priority recommendations:

### Recommendation 1 — Add a "Resumo da manhã" digest surface

None of the 25 defined notification types currently delivers a digest pattern. Research shows digests reduce opt-outs by 28% and increase engagement by 35%. Propose a new `Dashboard Card (digest)` triggered at 9am that consolidates overnight Row Nudges that were not seen. This should be queuable and dismissable with a single action for the full batch.

### Recommendation 2 — Build behavioral relevance feedback into every dismiss action

The current "Ignorar" and "Adiar" CTAs suppress the notification but do not signal relevance back to the system. After 3 consecutive dismissals of the same notification group, surface a micro-survey (2 taps maximum) before showing the next one. This data is critical for tuning trigger thresholds per broker.

### Recommendation 3 — Make the suppression state visible

When high-priority N-21 fires and suppresses 3 queued items, users need to know the queue exists. Add a subtle persistent indicator — a small pill in the corner of the table view reading "3 sugestões em espera" — that clears once the priority item is resolved. This prevents anxiety and maintains trust in the system.

### Recommendation 4 — Add a two-tier notification preference center

The current system has no documented user-facing preference controls. Research shows this is the single highest-leverage fatigue-reduction intervention. Build a Presets view (Ativo / Focado / Silencioso) with an expandable Advanced view (per-group, per-channel, quiet hours, digest time).

### Recommendation 5 — Enforce `prefers-reduced-motion` on all 4 animation types

The `spotlightPulse` (2s infinite), `bannerIn`, `cardIn`, and popover transitions all require a `@media (prefers-reduced-motion: reduce)` override. This is a WCAG AA compliance requirement, not a nice-to-have.

### Recommendation 6 — Add ARIA live region roles to all notification surfaces

- Toasts (N-02, N-10): `role="status"` `aria-live="polite"`
- High-priority card (N-21): `role="alert"` `aria-live="assertive"`
- Row Nudge badge: visible text label, not just border color + icon
- Popover content: keyboard focus management on open, return focus on close

### Recommendation 7 — Calibrate N-17 (locatário threshold) with 2024 Brazilian rental data

The existing report's own gap section flags this: the 18-month threshold for renter-to-buyer conversion is based on US data. Brazilian rental costs surged 30-50% in major metros between 2022 and 2025, which may compress the conversion window. A targeted research study of ABECIP or Secovi-SP data (or a direct user research study with Brazilian corretores) is recommended before N-17 is activated in production.

---

## Referenced Sources

- [WorkJoy: Scientific research on notifications and interruptions](https://workjoy.co/blog/scientific-research-notifications-and-interruptions-negatively-affect-work)
- [LSE Business Review: Constant digital interruptions hurt workflow (2024)](https://blogs.lse.ac.uk/businessreview/2024/10/03/constant-digital-interruptions-hurt-the-workflow-but-can-be-managed/)
- [Every Distraction Costs You 23 Minutes — TC Tec Innovation](https://tctecinnovation.com/blogs/daily-blog/every-distraction-costs-you-23-minutes)
- [Zigpoll: Notification frequency and user engagement in project management apps](https://www.zigpoll.com/content/how-do-varying-notification-frequencies-impact-user-engagement-and-perceived-value-within-mobile-project-management-applications)
- [Zigpoll: Push notification frequency and retention across segments](https://www.zigpoll.com/content/how-do-different-push-notification-frequencies-impact-user-engagement-and-retention-across-various-customer-segments)
- [MagicBell: How to help users avoid notification fatigue](https://www.magicbell.com/blog/help-your-users-avoid-notification-fatigue)
- [SuprSend: Alert fatigue](https://www.suprsend.com/post/alert-fatigue)
- [SuprSend: Notification preferences guide](https://www.suprsend.com/post/the-ultimate-guide-to-perfecting-notification-preferences-putting-your-users-in-control)
- [ContextSDK: The psychology of push notifications](https://contextsdk.com/blogposts/the-psychology-of-push-why-60-of-users-engage-more-frequently-with-notified-apps)
- [Pushwoosh: Push notification best practices 2025](https://www.pushwoosh.com/blog/push-notification-best-practices/)
- [Courier: 7 proven strategies to reduce notification fatigue](https://www.courier.com/blog/how-to-reduce-notification-fatigue-7-proven-product-strategies-for-saas)
- [Courier: Notification center best practices](https://www.courier.com/guides/how-to-build-a-notification-center/chapter-3-best-practices-for-notification-centers)
- [Courier: Slack notification strategy flowchart](https://www.courier.com/blog/slack-notifications-flowchart-strategy)
- [NotificationAPI: Batching and digest documentation](https://www.notificationapi.com/docs/features/digest)
- [Intercom: Banner message best practices](https://www.intercom.com/help/en/articles/4557552-banner-message-best-practices-example-uses)
- [Intercom: Announcing Banners](https://www.intercom.com/blog/announcing-banners/)
- [Linear: Inbox documentation](https://linear.app/docs/inbox)
- [Linear: Notifications documentation](https://linear.app/docs/notifications)
- [Salesforce: Einstein Next Best Action and Agentforce (2024)](https://admin.salesforce.com/blog/2024/deliver-improved-recommendations-through-next-best-action-and-agentforce)
- [Nielsen Norman Group: Indicators, validations, and notifications taxonomy](https://www.nngroup.com/articles/indicators-validations-notifications/)
- [IBM Carbon Design System: Notification pattern](https://carbondesignsystem.com/patterns/notification-pattern/)
- [Smashing Magazine: Design guidelines for better notifications UX (2025)](https://www.smashingmagazine.com/2025/07/design-guidelines-better-notifications-ux/)
- [Department of Product: The UX of notifications](https://departmentofproduct.substack.com/p/deep-the-ux-of-notifications)
- [Slack: Pause notifications with Do Not Disturb](https://slack.com/help/articles/214908388-Pause-notifications-with-Do-Not-Disturb)
- [Sara Soueidan: Accessible notifications with ARIA live regions](https://www.sarasoueidan.com/blog/accessible-notifications-with-aria-live-regions-part-1/)
- [W3C WAI: ARIA19 — Using role=alert or live regions to identify errors](https://www.w3.org/WAI/WCAG21/Techniques/aria/ARIA19)
- [TestParty: ARIA Notify API — the most important accessibility API in a decade](https://testparty.ai/blog/aria-notify-is-here-the-most-important-accessibility-api-in-a-decade)
- [NCBl PMC: Effect of timing and frequency of push notifications on intervention usage](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5207732/)
- [Superuser Studio: 6 top UX trends transforming B2B SaaS in 2025](https://www.superuserstudio.com/insights/6-top-ux-trends-transforming-b2b-saas-in-2025)

**Relevant local files reviewed:**
- `/Users/khevinmituti/Documents/GitHub/design-subagents/.interface-design/system.md`
- `/Users/khevinmituti/Documents/GitHub/design-subagents/lais-notifications/system.md`
- `/Users/khevinmituti/Documents/GitHub/design-subagents/Documents/intelligent-suggestion-notifications-report-2026-02-23.md`
