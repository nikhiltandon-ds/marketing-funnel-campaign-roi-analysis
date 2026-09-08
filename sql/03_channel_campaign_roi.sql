-- 03_channel_campaign_roi.sql
-- Rank channels by efficiency and identify reallocation candidates.

WITH channel_perf AS (
    SELECT
        channel,
        SUM(spend) AS spend,
        SUM(revenue) AS revenue,
        SUM(customers) AS customers,
        SUM(impressions) AS impressions,
        SUM(clicks) AS clicks,
        SUM(leads) AS leads
    FROM campaign_daily
    GROUP BY channel
)
SELECT
    channel,
    ROUND(spend,2) AS spend,
    ROUND(revenue,2) AS revenue,
    customers,
    ROUND(100.0 * clicks / NULLIF(impressions,0),2) AS ctr_pct,
    ROUND(spend / NULLIF(customers,0),2) AS cac,
    ROUND(revenue / NULLIF(spend,0),2) AS roas,
    ROUND(100.0 * (revenue-spend) / NULLIF(spend,0),2) AS roi_pct
FROM channel_perf
ORDER BY roas DESC;

-- Campaign ranking: focus on high spend + weak ROAS for optimization.
SELECT
    campaign_id,
    campaign_name,
    channel,
    campaign_type,
    segment,
    region,
    ROUND(spend,2) AS spend,
    customers,
    ROUND(spend / NULLIF(customers,0),2) AS cac,
    ROUND(revenue / NULLIF(spend,0),2) AS roas,
    ROUND(100.0 * (revenue-spend) / NULLIF(spend,0),2) AS roi_pct
FROM vw_campaign_performance
ORDER BY roas DESC, spend DESC;
