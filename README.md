# Retail Superstore Operations Analysis
## Soham Jani, Winter 2025-26

### Project Overview
This project provides a data-driven deep dive into the operations of a national retail superstore from 2015–2018. By integrating SQL for data extraction and Python for advanced visualization, I analyzed growth trajectories, seasonal trends, and geographical market share to identify the core drivers of the business.
* Dataset Used: https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting?resource=download

### Technical Tools
SQL: Performed complex aggregations, window functions for ranking, and multi-year comparisons.

Python (Pandas): Cleaned and structured raw CSV outputs for analysis.

Matplotlib & Seaborn + Gemini: Developed professional visualizations including donut charts, grouped bar charts, and trend lines to communicate findings to stakeholders.

### Some Challenges
#### Revenue-Sales Mismatching
When compiling revenue / sales analysis visuals and tables, it became clear that high revenue does not always correlate with high order quanity. To normalize such data, I ordered and visualized data by both revenue and total sales value, also including average order value (AOV). Discerning commonalities in such tables allowed me to pinpoint geographical locations with high and low per-order value, as well as geographical regions with high order quanitity, but low order value. Understanding such a difference illustrates the nuanced purchasing habits of various regions, and can assist marketing + local sales teams to adapt to such a reality.


#### Visualizing Revenue Concentration
With data spanning nearly 50 states and hundreds of cities, a standard bar chart became cluttered and difficult to read, obscuring the most important contributors. I implemented a "Top N" filter in my SQL queries to isolate the Top 10 states and cities. To make the visualization professional, I grouped the remaining data points into an "Other" category and utilized horizontal bar charts with sorted values, ensuring the viewer's eye is immediately drawn to the primary revenue hubs (California and New York).

#### Effective Ranking 
Certain sub-categories were dominant in some months but disappeared in others, making it difficult to see consistent trends in monthly popularity. I used the *RANK()* window function partitioned by month to determine which categories consistently held the top spots regardless of total volume fluctuations. This revealed the year-round dominance of the "Phones" sub-category, which remained a top-three performer in almost every month of the year.

### Reflection
Building this project was a milestone in my development as a statistics student. It challenged me to move beyond simply writing functional code and start thinking like a business strategist. One of the most rewarding moments was discovering the "breakout" growth trend in 2017; it taught me that data often hides a story that a single total or average cannot tell. On the technical side, being introduced to SQL window functions to rank product performance across different months was a steep but necessary learning curve. Moving forward, I am excited to apply these analytical frameworks to even larger, more complex datasets, focusing on how predictive modeling might anticipate the seasonal peaks I identified here.
