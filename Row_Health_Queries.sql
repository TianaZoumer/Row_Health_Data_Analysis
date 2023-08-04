--Aggregates sales of hair care products in the last 4 months
--Drawn from Claims table and ranked by total_product sales
--Hair Growth Supplements #1 with 1,444
--Hair Vitamins Trio #2 with 310
--Hair and Nail Wellbeing #3 with 8, & Hair Vitamins II #4 with 4
SELECT product_name as product, COUNT(product_name) as total_product
FROM `healthcare-project-393300.row_health.claims` AS claims
WHERE lower(product_name) like '%hair%'
AND claim_date BETWEEN '2023-04-01' AND '2023-07-30'
GROUP BY 1
ORDER BY 2 DESC

--Ranks States by highest total number of claims
--Joins claims and customers 
--NJ ranks #1 with 26,279 claims
--NY #2 with 3,799
--IA #3 with 2465 and ND  with 2431
SELECT customers.state, COUNT(DISTINCT claim_id) as total_claims
FROM `healthcare-project-393300.row_health.customers` AS customers
INNER JOIN `healthcare-project-393300.row_health.claims` AS claims
ON claims.customer_id = customers.customer_id
GROUP BY 1
ORDER BY 2 DESC

--Last Christmas promotion success ranked by count of claims across type of supplement
--Hair supplements #1 with total_claims 595
--Vitamin Supplements #2 with total_claims 404
--Daily Greens Pouch #3 with total_claims 112
--No Biotin claims during Christmas Sales
SELECT 
  CASE
    WHEN lower(product_name) LIKE '%hair%' THEN 'Hair Supplements'
    WHEN lower(product_name) LIKE '%biotin%' THEN 'Biotin Supplements'
    WHEN lower(product_name) LIKE '%vitamin%' THEN 'Vitamin Supplements'
    ELSE product_name
  END AS product_category,
  COUNT(DISTINCT claim_id) as total_claims
FROM `healthcare-project-393300.row_health.claims` AS claims
WHERE 
  claim_date BETWEEN '2022-12-01' AND '2022-12-31'
GROUP BY 1
ORDER BY 2 DESC;

--Last Christmas promotion ranked by covered amount across type of supplement
--Detox + Debloat Vitamin #1 with 21,724.18
--Hair Supplements #2 with 20,601.95
--Vitamin B supplement #3 with 19,748.7
SELECT 
 CASE 
  WHEN lower(claims.product_name) like '%hair%' then 'Hair Supplement'
  WHEN lower(claims.product_name) like '%biotin%' then 'Biotin Supplement'
  WHEN lower(claims.product_name) like '%vitamin b%' then 'Vitamin B Supplement'
  ELSE product_name
 END AS products,
 ROUND(SUM(claims.covered_amount), 2) as covered_amount
FROM healthcare-project-393300.row_health.claims AS claims
WHERE DATE_TRUNC(claim_date, month) = '2022-12-01'
GROUP BY 1
ORDER BY 2 DESC;

--Queries top users of the reimbursement program through count of total_claims
--Top 2 customers with 55 total_claims each: c6875 & c36
--Top Customers 3-5 with 54 total_claims each: c127, c6942, & c124
SELECT DISTINCT(claims.customer_id), COUNT(DISTINCT claim_id) as total_claims
FROM `healthcare-project-393300.row_health.claims` AS claims
RIGHT JOIN `healthcare-project-393300.row_health.customers` AS customers
ON claims.customer_id = customers.customer_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

--Queries top users of the reimbursement program through monetary value of total_claims
--Top customer with $11,044.5 value is c7420
--Second customer with $4,094.31 is c1058
--Third customer with $3,645.0 is c15112
--Fourth customer with $3599.39 is c800
--Fifth person with $3542.36 is c1419
SELECT DISTINCT(claims.customer_id), SUM(claims.claim_amount) AS total_claim_amount
FROM `healthcare-project-393300.row_health.claims` AS claims
RIGHT JOIN `healthcare-project-393300.row_health.customers` AS customers
ON claims.customer_id = customers.customer_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 100;

--Number of claims per month, per product in 2020
--Hair Growth Supplements and Vitamin B complex consistently top products
SELECT DATE_TRUNC(claim_date, month) as month, product_name, COUNT(DISTINCT claim_id)
FROM healthcare-project-393300.row_health.claims
WHERE EXTRACT(year from claim_date) = 2020
GROUP BY 1, 2
ORDER BY 1

--June 2023: Total claims, total claims value, and total covered amount
--total_claims: 1069, claims_value: 137,411.5, covered_value: 83,032.69
SELECT COUNT(DISTINCT claim_id) as total_claims, round(SUM(claim_amount),2) as claims_value, round(SUM(covered_amount),2) as covered_value
FROM healthcare-project-393300.row_health.claims
WHERE DATE_TRUNC(claim_date, month) = '2023-06-01'

--Top 2 hair products in June 2023 by count of claims
--Hair Growth Supplements #1: 362
--Hair Vitamins Trio #2: 91
SELECT product_name, COUNT(DISTINCT claim_id) as claim_count
FROM healthcare-project-393300.row_health.claims
WHERE lower(product_name) like '%hair%'
AND DATE_TRUNC(claim_date, month) = '2023-06-01'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 2;

--Top 2 hair products in June 2023 by value of claims
--Hair Vitamins Trio #1: 18,002.49
--Hair Growth Supplements #2: 12,222.08
SELECT product_name, ROUND(SUM(claim_amount),2) as claim_amount
FROM healthcare-project-393300.row_health.claims
WHERE lower(product_name) like '%hair%'
AND DATE_TRUNC(claim_date, month) = '2023-06-01'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 2;

--Number of claims by State in 2023
--Includes values of claims by amount
--NJ highest number of claims: 7,672
--NJ highest value of claims: 859,064.53
SELECT customers.state, COUNT(DISTINCT claims.claim_id) as claims_count, round(SUM(claims.claim_amount),2) AS claims_value
FROM healthcare-project-393300.row_health.claims AS claims
JOIN healthcare-project-393300.row_health.customers AS customers
ON customers.customer_id = claims.customer_id
WHERE extract(year from claim_date) = 2021
GROUP BY 1
ORDER BY 3 DESC;

--Num_customers who have platinum plan and joined in 2023 AND any customer who signed up in 2022
--2,926 customers 
SELECT COUNT(DISTINCT customer_id) as num_customers
FROM healthcare-project-393300.row_health.customers AS customers
WHERE 
 (lower(plan) like '%platinum%' 
  AND extract(year from signup_date) = 2023)
 OR extract(year from signup_date) = 2022
