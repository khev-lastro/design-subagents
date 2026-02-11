# UX Report: Role Collection During B2B Real Estate Tech Onboarding

## Executive Summary

This report analyzes the best practices for collecting role and job information from users during onboarding flows for B2B tech products in the real estate industry. The findings are grounded in UX research principles, cognitive science, and industry data on conversion rates and user behavior.

**Key finding**: The optimal approach uses card-based selection with 4-6 broad role categories, a clear value exchange message, progressive profiling for granular details, and a skippable flow. This combination can yield 14-30% higher conversion rates compared to traditional lengthy forms.

---

## 1. Recommended Role Collection Patterns

### Card-Based Selection (Recommended for Primary Roles)

The strongest pattern for collecting role data during onboarding is **card-based selection** when the number of role categories is between 3 and 6.

**Why it works:**
- Visual prominence enables users to compare all options simultaneously without interaction
- Higher engagement rate than form-style controls; the experience feels interactive rather than bureaucratic
- Supports rich context: icons, short descriptions, and examples help users self-identify quickly
- Mobile-friendly with large touch targets

**When to use:** 2-6 distinct role categories where immediate personalization depends on the answer.

**Limitations:** Becomes unwieldy past 7 options. For larger taxonomies, switch to a searchable dropdown or autocomplete.

### Alternative Patterns

| Pattern | Best For | Key Tradeoff |
|---------|----------|--------------|
| **Single-select dropdown** | 6+ roles, limited screen space | Hides options behind a click, reducing discoverability |
| **Autocomplete / type-ahead** | Collecting exact job titles after initial categorization | Creates inconsistent data; higher cognitive load |
| **Progressive disclosure (multi-step)** | Needing both broad category AND specific sub-role | More clicks, but each step has lower cognitive load |

### Strategic Recommendation

Use a **two-tier approach**:
1. **Tier 1 (onboarding):** Card-based selection with 4-6 broad roles
2. **Tier 2 (post-activation):** Progressive profiling to collect sub-role, experience level, and specialization through contextual in-app prompts

---

## 2. Real Estate Role Taxonomy

### Tier 1: Primary Role Categories (For Initial Selection)

Present these during onboarding as card options:

| Role | Description | Includes |
|------|-------------|----------|
| **Real Estate Agent** | "I work directly with buyers and sellers to facilitate transactions" | Licensed agents, buyer's agents, listing agents |
| **Broker / Team Lead** | "I manage a team of agents or run my own brokerage" | Managing brokers, team leads, office managers |
| **Property Manager** | "I oversee rental properties and tenant relationships" | Residential/commercial PMs, leasing managers |
| **Operations / Admin** | "I support the business with operations, admin, or coordination" | Transaction coordinators, office admins, marketing coordinators |
| **Executive / Owner** | "I'm a brokerage owner, executive, or investor" | C-suite, brokerage owners, investors, developers |
| **Other** | Free-text follow-up: "What's your role?" | Catch-all with autocomplete suggestions |

### Tier 2: Sub-Roles (For Progressive Profiling)

Collect after activation, triggered contextually:

- **Agents:** Residential, Commercial, Luxury/High-End Specialist, New (< 2 yrs), Experienced (2+ yrs)
- **Property Managers:** Residential PM, Commercial PM, HOA/Association Manager, Leasing Consultant
- **Operations:** Transaction Coordinator, Marketing Coordinator, Office Administrator, IT/Technology Manager

### Granularity Guidance

Per Hick's Law, decision time increases logarithmically with the number of choices. Analysis paralysis sets in past 7 visible options without grouping.

- **Initial screen:** 4-6 categories maximum
- **Sub-role refinement:** 3-5 options per category, shown only when relevant
- **Avoid:** Flat lists of 15+ roles on a single screen

---

## 3. Cognitive Load and Friction

### Key Research Data

| Finding | Source |
|---------|--------|
| Humans retain only 5-7 items in working memory | Miller's Law / NNGroup |
| Reducing form fields from 5 to 3 increases conversions by up to 47% | Descope |
| 86% of consumers abandon registration when it requires too much information | Descope |
| Average SaaS activation rate is 37% (63% drop off during activation) | UserGuiding |

### Friction Reduction Checklist

1. **Progressive disclosure:** Show only what is relevant to the current decision
2. **Single-column layout:** Outperforms multi-column for form completion
3. **Contextual help:** 1-2 sentence descriptions per role option, with examples of job titles
4. **Minimize required fields:** Only collect what is needed for immediate personalization
5. **Progress indicators:** "Step 2 of 4" reduces anxiety about unknown effort ahead
6. **Clear visual hierarchy:** Group related options; use whitespace to reduce clutter

### Warning Signs the Screen Is Overwhelming

- More than 7 visible options without categorization
- Dense text or complex terminology in the options
- Unclear distinctions between adjacent options
- No visual hierarchy or grouping
- Required fields with no explanation of purpose

---

## 4. Progressive Profiling vs. Upfront Collection

### When to Collect Role Upfront

- The product delivers a **fundamentally different experience** per role (e.g., agent dashboard vs. broker analytics)
- Role determines **access permissions** or available feature set
- The question is limited to **a single, simple selection** with 4-6 clear options
- The **value exchange is immediately obvious** ("We'll customize your dashboard")

### When to Use Progressive Profiling

- Role details are informative but not critical for initial setup
- Granular information is needed (years of experience, specialization, team size)
- The product works similarly across roles during initial use
- Maximizing signup completion rate is a priority

### Conversion Impact

| Approach | Impact |
|----------|--------|
| Progressive profiling | 14-30% increase in conversion rates |
| Reducing form fields | Up to 47% improvement in completion |
| Lengthy upfront forms | 86% abandonment rate |
| One B2B case study | 40% of signups never activated; 65% of churned users cited uncertainty about required info |

### Recommended Hybrid Approach

1. **During signup:** Ask for broad role category only (one question, 4-6 card options)
2. **Post-activation:** Collect granular details progressively:
   - During first use of a role-specific feature
   - Via in-app contextual prompts
   - Through optional profile completion incentives (e.g., "Complete your profile to unlock custom templates")

---

## 5. Value Exchange: Communicating Why You're Asking

### Framing That Increases Willingness to Share

Users share data when they understand the personal benefit. Research shows 41% of consumers share data for personalized recommendations.

**Effective headlines:**

| Quality | Example |
|---------|---------|
| Poor | "Select your role" |
| Better | "Let's personalize your experience" |
| Best | "Help us show you features built for your role" |

**Effective supporting copy:**

- "We'll customize your dashboard, recommended templates, and training resources based on your role."
- "This helps us show you only the features you need -- no clutter, just what matters."
- "Other [agents/brokers] like you found these features most helpful..."

### Messages That Perform Well

1. "Get personalized recommendations" -- concrete benefit
2. "See relevant features for your role" -- emphasizes filtering out noise
3. "Join 12,000+ agents like you" -- social proof
4. "Start with templates built for [your role]" -- concrete deliverable
5. "Skip the features you don't need" -- efficiency focus

### Messages That Perform Poorly

1. "Complete your profile" -- feels like busywork
2. "Required field" -- creates resentment
3. "Help us understand you better" -- vague, company-centric
4. "Select from the list below" -- purely instructional, no motivation

### Privacy Reassurance

Include brief, non-intrusive reassurance: "We use this to personalize your experience. We never share your role with third parties."

---

## 6. Wireframe: Recommended Role Selection Screen

```
+-----------------------------------------------+
|  Welcome to [Product]!                         |
|                                                |
|  Which best describes your role?               |
|  We'll personalize your dashboard and show     |
|  you the features that matter most.            |
|                                                |
|  +-------------------+  +-------------------+  |
|  |  [icon]           |  |  [icon]           |  |
|  |  Agent            |  |  Broker /         |  |
|  |                   |  |  Team Lead        |  |
|  |  I work with      |  |  I manage a team  |  |
|  |  buyers & sellers |  |  or office        |  |
|  +-------------------+  +-------------------+  |
|                                                |
|  +-------------------+  +-------------------+  |
|  |  [icon]           |  |  [icon]           |  |
|  |  Property         |  |  Operations /     |  |
|  |  Manager          |  |  Admin            |  |
|  |                   |  |                   |  |
|  |  I oversee        |  |  I support with   |  |
|  |  rentals &        |  |  ops, admin, or   |  |
|  |  tenants          |  |  coordination     |  |
|  +-------------------+  +-------------------+  |
|                                                |
|  +-------------------+                         |
|  |  [icon]           |                         |
|  |  Executive /      |                         |
|  |  Owner            |                         |
|  |                   |                         |
|  |  I own or lead    |                         |
|  |  the business     |                         |
|  +-------------------+                         |
|                                                |
|  None of these? Tell us your role >            |
|                                                |
|  Skip for now                                  |
|  (You'll see a generic dashboard)              |
|                                                |
|  Step 1 of 3  [===-------]                     |
+-----------------------------------------------+
```

### Design Notes

- Cards use large touch targets (minimum 44x44px)
- Single-column layout on mobile; 2-column grid on desktop
- Selected card shows a visible border/checkmark (not color alone, for accessibility)
- "None of these?" opens a text field with autocomplete
- "Skip for now" is visible but de-emphasized
- Progress bar sets expectations for the remaining flow

---

## 7. Common Anti-Patterns to Avoid

### 1. Excessive Information Requests
Asking for role + company size + industry + experience + team size on one screen. **Fix:** Ask one question per screen; collect the rest progressively.

### 2. Unclear Role Distinctions
Overlapping labels like "Sales Associate" vs. "Sales Specialist" vs. "Sales Representative." **Fix:** Use mutually exclusive categories with 1-2 sentence descriptions.

### 3. No Value Communication
A bare dropdown labeled "Job Role" with no context. **Fix:** Add benefit-focused headline and supporting copy.

### 4. Required with No Skip Option
Forcing role selection with no way to defer. 88% of users are less likely to return after a bad onboarding experience. **Fix:** Offer "Skip for now" with a clear explanation of what they miss.

### 5. Too Many Options Without Hierarchy
15+ roles in a flat list. **Fix:** Group into 4-6 primary categories; use progressive disclosure for sub-roles.

### 6. Generic "Other" with No Follow-Up
Including "Other" but collecting no additional data. **Fix:** Show a text field with autocomplete suggestions when "Other" is selected.

### 7. Asking Before Demonstrating Value
Role selection as the very first screen before any product value is shown. **Fix:** Show a brief value proposition or product preview first.

### 8. No Confirmation or Change Path
Users select a role but can't review or change it easily. **Fix:** Show confirmation ("Customizing for brokers...") and a Settings path to change later.

---

## 8. Accessibility Requirements

### WCAG Compliance Checklist for Role Selection

| Requirement | Standard | Implementation |
|-------------|----------|----------------|
| **Keyboard navigation** | WCAG 2.1.1 | Tab between cards, Enter/Space to select, arrow keys within groups |
| **Visible focus indicator** | WCAG 2.4.7 | Minimum 3:1 contrast ratio on focus ring (2px+ solid border) |
| **Screen reader support** | WCAG 1.3.1, 4.1.2 | Use `<fieldset>`/`<legend>` with radio inputs inside card wrappers |
| **Color independence** | WCAG 1.4.1 | Combine color with borders, checkmarks, or icons for selected state |
| **Text contrast** | WCAG 1.4.3 | 4.5:1 minimum for body text; 3:1 for large text (18px+) |
| **Touch targets** | WCAG 2.5.5 | Minimum 44x44px with 8px+ spacing between targets |
| **Labels** | WCAG 3.3.2 | Every control has a visible, programmatically associated label |
| **Zoom** | WCAG 1.4.4, 1.4.10 | Interface works at 200% zoom without horizontal scrolling |
| **Error messaging** | WCAG 3.3.1 | Validation errors are associated with the control via `aria-describedby` |

### Semantic HTML Structure

```html
<fieldset>
  <legend>Which best describes your role?</legend>
  <label class="role-card">
    <input type="radio" name="role" value="agent">
    <div class="card-content">
      <h3>Real Estate Agent</h3>
      <p>I work directly with buyers and sellers</p>
    </div>
  </label>
  <!-- Additional role cards -->
</fieldset>
```

Using native radio inputs inside styled card wrappers provides the best balance of visual design and assistive technology support.

---

## 9. Measurement Framework

### Metrics to Track

| Metric | What It Tells You | Target |
|--------|-------------------|--------|
| **Step completion rate** | % of users who select a role and proceed | > 85% |
| **Skip rate** | % of users who skip role selection | < 20% |
| **Time on step** | Seconds spent deciding (high = confusion) | < 15 seconds |
| **Distribution evenness** | Whether one role dominates (possible misclassification) | No single role > 60% |
| **"Other" rate** | Taxonomy coverage | < 10% |
| **Post-selection drop-off** | Users who select a role but abandon the next step | < 15% |
| **Role change rate** | Users who change their role later in Settings | < 5% (high = misidentification) |

### A/B Testing Priorities

1. **Headline framing:** "Which best describes your role?" vs. "Let's personalize your experience"
2. **Number of options:** 4 vs. 5 vs. 6 primary roles
3. **Skip option visibility:** Prominent vs. de-emphasized vs. absent
4. **Description length:** Role name only vs. name + 1-sentence description
5. **Card layout:** 2-column grid vs. vertical list

---

## 10. Summary of Recommendations

| Decision | Recommendation | Rationale |
|----------|---------------|-----------|
| **Collection pattern** | Card-based selection | Highest engagement; supports icons and descriptions |
| **Number of options** | 4-6 primary roles | Balances segmentation value with cognitive load (Hick's Law) |
| **Timing** | Upfront for broad role; progressive for details | Hybrid approach maximizes completion and data richness |
| **Value framing** | "We'll personalize your dashboard and features" | Concrete benefit outperforms vague messaging |
| **Skip option** | Yes, with consequence explanation | Respects autonomy; reduces forced abandonment |
| **"Other" handling** | Free-text with autocomplete | Captures edge cases without losing data |
| **Accessibility** | Native radio inputs in styled cards | Best screen reader support with full design flexibility |
| **Follow-up profiling** | Contextual in-app prompts post-activation | Collects granular data when users see its relevance |

---

## Sources

- NNGroup: Minimize Cognitive Load, 4 Principles for Forms
- Hick's Law (Laws of UX)
- Descope: Progressive Profiling 101
- UserGuiding: 100+ User Onboarding Statistics
- Userpilot: Personalized Onboarding, Drop-Off Rate Analysis
- Appcues: Mobile Onboarding UI/UX Patterns
- WCAG 2.2 Guidelines (thewcag.com, Penn State Accessibility)
- SelectLeaders: Real Estate Job Ecosystem
- ProductLed: Personalized Onboarding for SaaS
- Contentsquare: User Onboarding Challenges
- Glance: Why 90% of Users Abandon Apps During Onboarding
- Baymard Institute: Autocomplete Design Patterns
- Salt Design System: Selectable Card Pattern
