## Product Category Analysis: Findings
**Revenue Composition (The 80/20 Rule)**
*Revenue is heavily concentrated in a few high-performing sub-categories.*

**The Core Drivers**: Phones (14.5%) and Chairs (14.3%) are the primary revenue anchors, accounting for nearly 29% of total store income.

**Category Intensity**: While Office Supplies drive high order volume, Technology and Furniture provide the heavy-hitting revenue required for growth.

**Product Strategy**: Volume vs. Value
There is a distinct split between "frequent" products and "valuable" products:

**High-Volume (The "Staples")**: Items like Staple Envelopes (47 orders) and Paper drive consistent traffic and customer retention.

High-Value (The "Profit Drivers"): Items like Adjustable-Height Tables (262 USD avg) and Folding Chairs (242 USD avg) drive the Average Order Value (AOV).

**Data Methodology**
I utilized several data processing techniques to arrive at these conclusions:

*Aggregation*: Summing monthly and yearly sales to calculate growth rates.

*Averaging*: Benchmarking monthly performance across a 4-year span to identify true seasonality.

*Ranking*: Using window functions to determine the #1 sub-category for every month of the year.

*Percentage of Total*: Calculating the relative revenue contribution of 17 different product sub-categories.

***Tech Stack***
*SQL*: Data extraction, ranking (Window Functions), and multi-table joins, data extraction and pivot table generation.

*Matplotlib & Seaborn*: Creating visualizations for reporting.

*Google Gemini*: Insight synthesis