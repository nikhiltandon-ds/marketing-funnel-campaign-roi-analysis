-- 01_schema_and_views.sql
-- Marketing Funnel & Campaign ROI Analysis
-- SQLite-compatible SQL

DROP VIEW IF EXISTS vw_campaign_performance;
CREATE VIEW vw_campaign_performance AS
SELECT
    campaign_id,
    campaign_name,
    channel,
    campaign_type,
    segment,
    region,
    SUM(impressions) AS impressions,
    SUM(clicks) AS clicks,
    SUM(leads) AS leads,
    SUM(customers) AS customers,
    ROUND(SUM(spend), 2) AS spend,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(100.0 * SUM(clicks) / NULLIF(SUM(impressions),0), 2) AS ctr_pct,
    ROUND(100.0 * SUM(leads) / NULLIF(SUM(clicks),0), 2) AS click_to_lead_pct,
    ROUND(100.0 * SUM(customers) / NULLIF(SUM(leads),0), 2) AS lead_to_customer_pct,
    ROUND(SUM(spend) / NULLIF(SUM(customers),0), 2) AS cac,
    ROUND(SUM(revenue) / NULLIF(SUM(spend),0), 2) AS roas,
    ROUND(100.0 * (SUM(revenue)-SUM(spend)) / NULLIF(SUM(spend),0), 2) AS roi_pct
FROM campaign_daily
GROUP BY
    campaign_id, campaign_name, channel, campaign_type, segment, region;

DROP VIEW IF EXISTS vw_channel_performance;
CREATE VIEW vw_channel_performance AS
SELECT
    channel,
    SUM(impressions) AS impressions,
    SUM(clicks) AS clicks,
    SUM(leads) AS leads,
    SUM(customers) AS customers,
    ROUND(SUM(spend), 2) AS spend,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(100.0 * SUM(clicks) / NULLIF(SUM(impressions),0), 2) AS ctr_pct,
    ROUND(100.0 * SUM(leads) / NULLIF(SUM(clicks),0), 2) AS click_to_lead_pct,
    ROUND(100.0 * SUM(customers) / NULLIF(SUM(leads),0), 2) AS lead_to_customer_pct,
    ROUND(SUM(spend) / NULLIF(SUM(customers),0), 2) AS cac,
    ROUND(SUM(revenue) / NULLIF(SUM(spend),0), 2) AS roas,
    ROUND(100.0 * (SUM(revenue)-SUM(spend)) / NULLIF(SUM(spend),0), 2) AS roi_pct
FROM campaign_daily
GROUP BY channel;
