# Analysis Assumptions

1. The delivered campaign data is a deterministic synthetic portfolio dataset built for reproducibility.
2. Revenue is attributed at campaign level; no multi-touch attribution model is applied.
3. CAC uses attributed customers as the denominator.
4. ROAS uses attributed revenue divided by spend.
5. The 15% budget scenario assumes historical channel ROAS is stable after reallocation. This is a planning assumption, not a causal estimate.
6. Any production budget decision should validate marginal returns through controlled tests.

Public schema reference:
https://www.analyticsengineering.com/datasets/marketing-campaigns

Metric reference:
https://www.kaggle.com/datasets/sinderpreet/analyze-the-marketing-spending/versions/1
