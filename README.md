# Marketing Funnel & Campaign ROI Analysis

## Overview

An end-to-end Data Analyst portfolio project using **SQL, Power BI, and Excel** to evaluate a multi-channel marketing funnel from **Impressions → Clicks → Leads → Customers**, quantify CAC/ROAS/ROI, compare campaigns and channels, and model a budget-reallocation scenario.

> **Project intent:** demonstrate business-facing analytics, KPI design, funnel diagnosis, campaign performance analysis, and decision support — not machine learning.

## Business Questions

1. Where is the largest funnel drop-off?
2. Which acquisition channels generate the most efficient customers?
3. Which campaigns deserve scaling, optimization, or budget reduction?
4. How do CAC, ROAS and ROI differ across channels?
5. What happens under a 15% budget reallocation toward historically stronger channels?

## Tools

- SQL (SQLite-compatible)
- Power BI (data model, DAX, interactive dashboard)
- Excel (formula-driven campaign model and budget scenario)
- GitHub-ready documentation

## Dataset

The project uses a **self-contained deterministic portfolio dataset** designed around a documented public marketing-campaign data model. The public reference structure includes campaigns, daily spend, leads and attributed conversion revenue, which supports channel spend and conversion analysis. The delivered dataset is independently generated for reproducibility and is **not a redistribution of the third-party download**.

Public reference: https://www.analyticsengineering.com/datasets/marketing-campaigns

Additional metric reference: https://www.kaggle.com/datasets/sinderpreet/analyze-the-marketing-spending/versions/1

## Data Model

### campaigns
Campaign-level attributes:
- campaign_id
- campaign_name
- channel
- campaign_type
- segment
- region
- campaign_multiplier

### campaign_daily
Monthly campaign performance records:
- campaign_date
- campaign_id
- campaign_name
- channel
- campaign_type
- segment
- region
- impressions
- clicks
- leads
- customers
- spend
- revenue

## KPI Definitions

- **CTR** = Clicks / Impressions
- **Click → Lead Rate** = Leads / Clicks
- **Lead → Customer Rate** = Customers / Leads
- **CAC** = Spend / Customers
- **ROAS** = Revenue / Spend
- **ROI** = (Revenue − Spend) / Spend

## Funnel Results

Portfolio dataset totals:
- Impressions: **195,818,174**
- Clicks: **4,738,625**
- Leads: **392,336**
- Customers: **66,014**
- Spend: **₹10,567,501.54**
- Revenue: **₹33,857,079.75**
- Overall ROAS: **3.20x**
- Overall ROI: **220.4%**

## Channel Findings

| Channel | Spend | Revenue | CAC | ROAS | ROI |
|---|---:|---:|---:|---:|---:|
| Email | ₹1,123,574 | ₹8,135,327 | ₹32 | 7.24x | 624.1% |\n| Affiliate | ₹1,909,215 | ₹11,964,775 | ₹110 | 6.27x | 526.7% |\n| Paid Search | ₹2,354,474 | ₹8,371,560 | ₹297 | 3.56x | 255.6% |\n| Paid Social | ₹2,003,517 | ₹2,763,397 | ₹610 | 1.38x | 37.9% |\n| Display | ₹1,694,565 | ₹1,651,948 | ₹909 | 0.97x | -2.5% |\n| Video | ₹1,482,157 | ₹970,073 | ₹1,544 | 0.65x | -34.5% |\n

### Key observations

- **Email** is the strongest channel on ROAS in this portfolio dataset at **7.24x**, while also having the lowest CAC at **₹32**.
- **Video** is the weakest channel at **0.65x ROAS** and **₹1,544 CAC**, making it the first candidate for optimization/reduction.
- Paid Search sits between the extremes and combines meaningful scale with positive efficiency.
- Display is close to break-even in the portfolio dataset and should be tested/optimized before additional scale.

## Campaign Analysis

The SQL and Excel outputs rank all 30 campaigns using:
- Spend
- Customers
- CAC
- Revenue
- ROAS
- ROI

Example highest-ROAS campaign: **Email_Retargeting_04 (9.64x)**.

Example lowest-ROAS campaign: **Video_LeadGen_04 (0.39x)**.

## Budget Reallocation Scenario

The workbook models a planning scenario that reallocates **15% of the total marketing budget**:

### Reduce
- Video: 50% of the reallocated pool
- Display: 35%
- Paid Social: 15%

### Increase
- Email: 45%
- Affiliate: 35%
- Paid Search: 20%

Current portfolio ROAS: **3.20x**

Scenario expected ROAS: **4.00x**

Scenario expected revenue uplift vs current historical mix: **₹8,381,252**

**Important:** this is a planning scenario, not a causal forecast. It assumes historical channel ROAS remains stable after the budget shift. In real marketing operations, the recommendation should be validated with controlled budget tests and marginal-return analysis.

## Power BI Dashboard

Recommended report pages:
1. **Executive Overview** — spend, revenue, ROAS, customers, funnel KPIs
2. **Funnel Analysis** — stage volumes and drop-off
3. **Channel & Campaign Performance** — CAC/ROAS comparisons and campaign ranking
4. **Budget Reallocation** — current vs scenario allocation and expected revenue

Power BI build instructions and DAX measures are included in `powerbi/`.

## Excel Workbook

`excel/Marketing_Funnel_Campaign_ROI_Analysis.xlsx` contains:
- Dashboard
- Channel Analysis
- Campaign Analysis
- Budget Scenario
- Campaign Data
- Sources

The KPI calculations are formula-driven so the workbook can be audited.

## Repository Structure

```text
marketing-funnel-campaign-roi/
├── README.md
├── data/
│   ├── campaigns.csv
│   ├── campaign_daily.csv
│   ├── channel_performance.csv
│   ├── campaign_performance.csv
│   ├── monthly_performance.csv
│   ├── funnel_summary.csv
│   ├── budget_reallocation_scenario.csv
│   └── marketing_funnel_roi.db
├── docs/
│   └── DATA_DICTIONARY.md
├── excel/
│   └── Marketing_Funnel_Campaign_ROI_Analysis.xlsx
├── images/
│   ├── excel_dashboard.png
│   └── budget_scenario.png
├── powerbi/
│   ├── POWER_BI_BUILD_GUIDE.md
│   └── DAX_MEASURES.md
└── sql/
    ├── 01_schema_and_views.sql
    ├── 02_funnel_analysis.sql
    ├── 03_channel_campaign_roi.sql
    └── 04_budget_reallocation.sql
```

## Portfolio Positioning

This project is designed to support applications for:
- Data Analyst
- Business Analyst
- BI Analyst
- Marketing Analyst
- Growth Analyst
- Reporting Analyst

It intentionally emphasizes **SQL + Power BI + Excel + business recommendations** rather than predictive modeling.
