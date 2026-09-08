-- 04_budget_reallocation.sql
-- Scenario: reallocate 15% of total budget away from the weakest channels
-- toward historically stronger channels. This is a planning scenario, not a causal forecast.

WITH channel_perf AS (
    SELECT channel, SUM(spend) AS current_spend,
           SUM(revenue) / NULLIF(SUM(spend),0) AS historical_roas
    FROM campaign_daily
    GROUP BY channel
),
scenario AS (
    SELECT
        channel,
        current_spend,
        historical_roas,
        CASE channel
            WHEN 'Video' THEN 0.50
            WHEN 'Display' THEN 0.35
            WHEN 'Paid Social' THEN 0.15
            ELSE 0.0
        END AS reduction_share,
        CASE channel
            WHEN 'Email' THEN 0.45
            WHEN 'Affiliate' THEN 0.35
            WHEN 'Paid Search' THEN 0.20
            ELSE 0.0
        END AS addition_share
    FROM channel_perf
),
total_budget AS (
    SELECT SUM(current_spend) AS total_spend FROM channel_perf
)
SELECT
    s.channel,
    ROUND(s.current_spend,2) AS current_spend,
    ROUND(s.historical_roas,2) AS historical_roas,
    ROUND(s.current_spend - (t.total_spend*0.15*s.reduction_share)
        + (t.total_spend*0.15*s.addition_share),2) AS scenario_spend,
    ROUND(
        (s.current_spend - (t.total_spend*0.15*s.reduction_share)
        + (t.total_spend*0.15*s.addition_share))
        * s.historical_roas,2
    ) AS expected_revenue
FROM scenario s
CROSS JOIN total_budget t
ORDER BY expected_revenue DESC;
