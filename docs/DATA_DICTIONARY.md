# Data Dictionary

## campaigns.csv

| Column | Type | Description |
|---|---|---|
| campaign_id | text | Unique campaign identifier |
| campaign_name | text | Campaign name |
| channel | text | Acquisition/marketing channel |
| campaign_type | text | Acquisition, Retargeting or Lead Gen |
| segment | text | Target segment |
| region | text | Campaign region |
| campaign_multiplier | numeric | Deterministic performance multiplier used to create realistic campaign variation |

## campaign_daily.csv

| Column | Type | Description |
|---|---|---|
| campaign_date | date | Month of observed performance |
| campaign_id | text | Campaign identifier |
| campaign_name | text | Campaign name |
| channel | text | Marketing channel |
| campaign_type | text | Campaign type |
| segment | text | Audience segment |
| region | text | Region |
| impressions | integer | Ad impressions |
| clicks | integer | Ad clicks |
| leads | integer | Captured leads |
| customers | integer | Customers attributed to the campaign |
| spend | numeric | Marketing spend |
| revenue | numeric | Attributed revenue |

## Derived Metrics

| KPI | Formula |
|---|---|
| CTR | Clicks / Impressions |
| Click → Lead | Leads / Clicks |
| Lead → Customer | Customers / Leads |
| CAC | Spend / Customers |
| ROAS | Revenue / Spend |
| ROI | (Revenue − Spend) / Spend |
