# Row_Health_Data_Analysis
This portfolio project analyzes Row Health Data, analyzing campaigns, claims and customer tables I am able to assess the successes of customer acquisition and campaign impression across states and platforms.

## Excel Insight Overview
This excel analysis focused on the success of campaigns, categorically and across platform, in order to observe the success of an initiative through metrics of sign-up rate, relative cost of per sign up, click-through rate, and cost of impression.

### North Star Metrics: Averages from 2019-2023 

1. Signup Rate: the average signup rate was 0.36% acrosss 16.2K total signups.
2. Cost per Signup: the average signup was $204, ranging from $0.2 to $1.5K per campaign
1. Click Through Rate: the average click through rate was 13.2% across 9M impressions.
2. Cost per Impression: the average cost per impression was $0.03, with a maximum of $0.25 per campaign

### Sign Up Rate and Number of Sign Ups was highest among Health For All campaigns 

![Campaign_category_customer_acquisition](https://github.com/TianaZoumer/Row_Health_Data_Analysis/assets/115896875/75540ceb-d3ad-4da0-ad64-3161ff6b88cc)

- Health for All had the best performance over-all with the top sign-up rate (2.3%) and the second highest number of sign-ups (3.5K) and a cost-per-signup of $2
- The top 4 campaigns by number of signups (#HealthyLiving, Health for All, #CoverageMatters, and Compare Health Coverage) accounted for 84% of total signups.
- Compare Health Coverage and #HealthyLiving are the only other campaigns, besides Health for All, that perform above the average sign-up rate(0.93% and 0.68%)
- Golden Years Security was the worst performing campaign, returning .01% signup rate, 23 sign ups, and $790 cost per signup

### Cost per signup was lowest among Health For All campaigns and TV campaigns

![Platform_customer_acquisition](https://github.com/TianaZoumer/Row_Health_Data_Analysis/assets/115896875/d88b94a9-f337-4592-bf13-6c1f782ad4ab)

 - Social Media had the highest number of signups (7,610) with the third highest signup rate of .34%
 - Email had a highest sign-up rate(0.5%) and returned 4130 signups
 - TV campaigns returned the second highest average signup rate, and the lowest cost-per-signup, but performed the worst in terms of number of signups (494)
 - Social Media and SEO both have above average cost of signup($206 and $290)

### Click through Rates(CTR) were highest for Summer Wellness Tips while Coverage Matters has the lowest cost-per-impression

![Campaign_category_brand_awareness](https://github.com/TianaZoumer/Row_Health_Data_Analysis/assets/115896875/b78935ee-1f50-4e03-b728-3700997c4424)

- Summer Wellness Tips CTR(28%) was more than double the average, but also has the highest cost-per-impression at $.054 (nearly double the average)
- Benefit updates has the second highest average CTR(19%), well above-average, and the third lowest cost-per-impression($.009) well below-average
- Four campaign categories (#CoverageMatters, Tailored Health Plans, Family Coverage Plan, and Golden Years Security) performed with a below average CTR
- Family Coverage Plan and Golden Years Security had the lowest CTR(0% and 1%) both also have cost-per-impression below average ($.004 and $.014)

### Click Through Rates(CTR) were Highest for Email users, while SEO has the lowest cost-per-impression

![Platform_brand_awareness](https://github.com/TianaZoumer/Row_Health_Data_Analysis/assets/115896875/34368a69-b051-47a8-ba44-1ea6b8472399)

- Email outperformed other platforms in terms of CTR(23%), though the number of impressions was second lowest (2,022,478)
- TV has the lowest number of impressions (609,439) accounting for 6.71% of total impressions, but a below average cost-per-impression
- Social Media has the highest total number of impressions (3,259,312) and an average click-thorugh rate, though has an above average cost-per-impression($.025)
- The top three platforms by number of impressions and click-through-rate are Email, SEO, and Social Media.

## Recommendations

### Increase Signups:
- Prioritize campaigns in the Health for All category and campaigns that run on email, as these have the highest signup rate and also the lowest cost-per-signup.
- Reallocate SEO budget to email campaigns, as SEO has similar signup rates and signup coutns as email but the cost per signup is more than 2x higher
- Within email campaigns, consider removing the low-performing categories.

### Increase Brand Awareness
- Prioritize campaigns run on email and SEO as these have high CTR and low cost-per-impression. Though it is worth investigating the branding and timing of these campaigns across platforms relative to each other as there is not a clear leader for brand awareness from these metrics.
- Continue investing in Summer Wellness Tips campaigns for their high CTR, and investigate specific drivers for high-impression cost
- Explore campaigns with low/no signups, including Golden Years Security and Family Coverage Plan

## SQL Insight Overview
This SQL analysis focuses on answering stakeholder questions about the sales of hair care products, total number of claims across different states, the success of various promotions, and customer interactions with the reimbursement program.

## Questions
1. What were the top hair-related products in recent months?
2. Which states have the highest claims so far?
3. During the promotion last Christmas, which category of products were the most popular between hair supplements, biotin supplements, or vitamin supplements?
4. Who are the top users of the reimbursement program?

## Findings

### Sales Analysis

1. Hair Growth Supplements was the top-selling product in the past 4 months, with 1,444 sales, followed by Hair Vitamins Trio (310 sales), Hair and Nail Wellbeing (8 sales), and Hair Vitamins II (4 sales).

2. In June 2023, the top hair care products by count of claims were Hair Growth Supplements (362 claims) and Hair Vitamins Trio (91 claims).

3. The top hair care products in June 2023 by the value of claims were Hair Vitamins Trio ($18,002.49) and Hair Growth Supplements ($12,222.08).

### State Claims Analysis

1. The state with the highest total number of claims was New Jersey (26,279 claims), followed by New York (3,799 claims), Iowa (2,465 claims), and North Dakota (2,431 claims).

2. In 2023, the state with the highest number of claims was New Jersey (7,672 claims), with the highest value of claims being $859,064.53.

### Promotion Success Analysis

1. The most successful product in the last Christmas promotion, ranked by count of claims, was Hair Supplements (595 claims), followed by Vitamin Supplements (404 claims), and Daily Greens Pouch (112 claims). There were no Biotin claims during the Christmas Sales.

2. Ranked by the covered amount across the type of supplement in the last Christmas promotion, Detox + Debloat Vitamin came out on top with $21,724.18, followed by Hair Supplements ($20,601.95), and Vitamin B supplement ($19,748.7).

### Reimbursement Program Analysis

1. The top users of the reimbursement program, through count of total claims, were customers c6875 and c36 (55 total claims each). Following them were customers c127, c6942, and c124 (54 total claims each).

2. In terms of the monetary value of total claims, the top users of the reimbursement program were customers c7420 ($11,044.50), c1058 ($4,094.31), c15112 ($3,645.00), c800 ($3,599.39), and c1419 ($3,542.36).

### Monthly Claims Analysis

1. In June 2023, there were 1,069 total claims, with a total claims value of $137,411.50, and a total covered value of $83,032.69.

2. The number of claims per product per month in 2020 showed that Hair Growth Supplements and Vitamin B complex were consistently the top products.

## Caveats and Next Steps

Improve Data Quality 
1. Include revenue data to calculate campaign ROI
2. Include data on campaign dates to segment by time and seasonality
3. Include customer-specific dimensions (plan, state, signup platform) to further tailor campaign recommendations

Improve Marketing Strategies
1. Investigate how campaign run-time affects average cost and signup rates
2. Regroup with marketing to adjust budget based on recommendations
3. Create marketing campaigns dashboard to track effectiveness of recommended budget

