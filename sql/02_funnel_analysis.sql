-- 02_funnel_analysis.sql
WITH funnel AS (
    SELECT
        SUM(impressions) AS impressions,
        SUM(clicks) AS clicks,
        SUM(leads) AS leads,
        SUM(customers) AS customers
    FROM campaign_daily
)
SELECT
    impressions,
    clicks,
    leads,
    customers,
    ROUND(100.0 * clicks / NULLIF(impressions,0), 2) AS impression_to_click_pct,
    ROUND(100.0 * leads / NULLIF(clicks,0), 2) AS click_to_lead_pct,
    ROUND(100.0 * customers / NULLIF(leads,0), 2) AS lead_to_customer_pct,
    ROUND(100.0 * customers / NULLIF(impressions,0), 4) AS impression_to_customer_pct
FROM funnel;
