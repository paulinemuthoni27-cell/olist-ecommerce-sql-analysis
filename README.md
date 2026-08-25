# 🛒 Olist E-Commerce Sales & Customer Analytics

## 📌 Project Overview

This project analyzes e-commerce sales, customer behavior, product performance, geographic trends, seller performance, logistics, and customer satisfaction using SQL.

The analysis was conducted using the Olist e-commerce dataset and MySQL.

The objective was to transform raw transactional data into actionable business insights that could help an e-commerce marketplace improve revenue, customer retention, product performance, and delivery operations.

---

## 🎯 Business Questions

The analysis focuses on the following business questions:

1. How is revenue changing over time?
2. Which product categories generate the most revenue?
3. Which products generate the highest revenue?
4. How frequently do customers make repeat purchases?
5. Who are the highest-spending customers?
6. Which states generate the most orders and revenue?
7. Which states have the highest average order values?
8. How long does it take to deliver orders?
9. Which states experience the highest delivery delays?
10. Which sellers generate the most revenue?
11. Which sellers have the fastest and slowest delivery performance?
12. What is the overall customer review distribution?
13. Is there an observable relationship between delivery performance and customer satisfaction?

---

# 📊 Key Performance Indicators

| KPI | Result |
|---|---:|
| Total Revenue | **2,002,152.76** |
| Total Orders | **12,291** |
| Total Customers | **12,238** |
| Average Order Value | **162.90** |
| Repeat Customer Rate | **0.42%** |
| One-Time Customer Rate | **99.58%** |
| Average Delivery Time | **12.50 days** |
| On-Time Delivery Rate | **91.85%** |
| Late Delivery Rate | **8.15%** |
| Average Review Score | **4.02 / 5** |
| Revenue Growth 2017–2018 | **24.75%** |

---

# 📈 1. Revenue Analysis

Revenue increased substantially during the period covered by the dataset.

| Year | Revenue |
|---|---:|
| 2016 | 6,848.64 |
| 2017 | 887,777.61 |
| 2018 | 1,107,526.51 |

Revenue increased by approximately **24.75% from 2017 to 2018**.

The highest full month in the dataset was **May 2018**, generating:

**160,565.15**

November 2017 was the second-highest month with:

**153,822.97**

### Insight

> Revenue demonstrated strong growth from 2017 to 2018, increasing by 24.75%. However, partial periods at the beginning and end of the dataset should be considered when interpreting monthly performance.

---

# 👥 2. Customer Analysis

Customer purchase frequency revealed a significant retention challenge.

### Customer Frequency

- **12,187 customers** made one purchase
- **50 customers** made two purchases
- **1 customer** made four purchases
- **51 repeat customers** in total
- **99.58%** of customers were one-time purchasers
- **0.42%** were repeat customers

### Insight

> Customer retention is extremely low, with 99.58% of customers making only one purchase. This represents a significant opportunity to increase customer lifetime value through loyalty programs, personalized recommendations, and targeted post-purchase marketing.

---

# 💰 3. Customer Spending

The top 10 highest-spending customers were all one-time purchasers.

The highest-spending customer generated:

**6,726.66**

from a single order.

### Insight

> High customer spending does not necessarily translate into customer loyalty. High-value one-time customers represent a potential target group for retention campaigns.

---

# 🛍️ 4. Product Category Analysis

### Top Revenue-Generating Categories

| Category | Revenue |
|---|---:|
| beleza_saude | **225,255.10** |
| relogios_presentes | **199,901.43** |
| cama_mesa_banho | **178,072.51** |
| esporte_lazer | **172,505.76** |
| informatica_acessorios | **164,966.29** |

The **beleza_saude** category generated the highest revenue.

### Insight

> A relatively small group of product categories accounts for a substantial portion of marketplace revenue. These high-performing categories could receive greater inventory, marketing, and promotional attention.

---

# 📦 5. Product Performance

The analysis also examined products based on units sold and total revenue.

The highest-revenue product generated:

**13,440**

from **8 units sold**.

Another product generated:

**11,805**

from **36 units sold**.

### Insight

> Product revenue is influenced by both sales volume and product value. Products with lower sales volume can still generate significant revenue when their average selling value is high.

---

# 🌎 6. Geographic Analysis

São Paulo was the strongest market by order volume and revenue.

### Top States by Revenue

| State | Orders | Revenue |
|---|---:|---:|
| SP | 5,180 | **762,042.63** |
| RJ | 1,652 | **281,004.51** |
| MG | 1,387 | **216,537.12** |
| PR | 616 | **109,569.82** |
| RS | 655 | **104,476.36** |

### Insight

> São Paulo was the dominant market, generating 762,042.63 in revenue. However, smaller markets demonstrated higher average order values, indicating that market size does not necessarily correspond to customer spending per transaction.

---

# 💳 7. Average Order Value by State

The highest average order value was observed in:

**Paraíba (PB) — 276.13**

Other high-value markets included:

- Maranhão — 257.12
- Pará — 237.94
- Rondônia — 236.90
- Sergipe — 227.54

São Paulo had an average order value of:

**147.11**

### Insight

> Smaller markets can have substantially higher average order values than the largest market, creating opportunities for targeted premium-product strategies.

---

# 🚚 8. Delivery Performance

The overall average delivery time was:

**12.50 days**

### Delivery Status

| Status | Orders |
|---|---:|
| On Time | 11,289 |
| Late | 1,002 |

This corresponds to:

- **91.85% on-time delivery**
- **8.15% late delivery**

### Insight

> Although most orders were delivered on time, more than 1,000 orders experienced delays, highlighting an opportunity to improve logistics performance.

---

# 🗺️ 9. Delivery Performance by State

Average delivery times varied significantly across states.

### Slowest Average Delivery Times

| State | Average Delivery |
|---|---:|
| AL | **25.49 days** |
| AP | **25.00 days** |
| RR | **25.00 days** |
| PA | **24.28 days** |
| AM | **24.21 days** |

### Fastest

São Paulo had an average delivery time of:

**8.73 days**

### Insight

> Delivery performance varies considerably by geography. Some states experience delivery times almost three times longer than São Paulo, suggesting that regional logistics infrastructure and shipping distance may require further investigation.

---

# ⚠️ 10. Late Delivery Rate by State

The highest late-delivery rates were:

| State | Late Delivery Rate |
|---|---:|
| AL | **31.37%** |
| MA | **23.86%** |
| PI | **22.22%** |
| TO | **18.75%** |
| BA | **16.59%** |

São Paulo recorded a late-delivery rate of:

**5.85%**

### Insight

> Delivery reliability varies substantially across states. High-delay regions should be prioritized for logistics optimization and seller/shipping performance monitoring.

---

# 🏪 11. Seller Performance

The top seller by revenue generated:

**47,594.72**

from:

- 74 orders
- 85 items

### Important finding

High order volume did not necessarily correspond to the highest revenue.

For example, one seller generated more revenue from significantly fewer orders than other high-volume sellers.

### Insight

> Seller revenue performance depends on both transaction volume and product value. Seller performance should therefore be evaluated using multiple metrics rather than order volume alone.

---

# ⚡ 12. Seller Delivery Performance

Among sellers with at least 20 delivered orders:

### Fastest Seller

**8.29 days**

### Slowest Seller

**24.50 days**

This represents a difference of more than **16 days** in average delivery time.

### Insight

> Seller logistics performance varies substantially. High-revenue sellers should therefore be evaluated not only on sales performance but also on delivery efficiency.

---

# ⭐ 13. Customer Satisfaction

The available review dataset contained:

**279 unique reviews**

### Review Distribution

| Score | Reviews |
|---:|---:|
| 5 | 164 |
| 4 | 39 |
| 3 | 30 |
| 2 | 8 |
| 1 | 38 |

The average review score was approximately:

**4.02 / 5**

### Insight

> Overall customer satisfaction was positive, with an average rating of 4.02/5 and nearly 59% of available reviews receiving five stars.

### Data Limitation

The review table available for this analysis contained only 279 reviewed orders compared with the much larger order dataset. Therefore, review-related findings should not be interpreted as representative of all customers.

---

# 🚚⭐ 14. Delivery vs Customer Satisfaction

Among the reviewed orders that could be matched to delivery status:

| Delivery Status | Reviews | Average Rating |
|---|---:|---:|
| On Time | 40 | **4.28** |
| Late | 1 | **1.00** |

The late order received a one-star review.

However, because only **one late order** was included in this comparison, there is insufficient evidence to establish a statistically reliable relationship between late deliveries and customer satisfaction.

### Insight

> The available sample suggests that delivery delays may be associated with lower customer satisfaction, but the sample size is too small to support a definitive conclusion.

---

# 💡 Business Recommendations

Based on the analysis, the following actions could improve marketplace performance:

### 1. Improve customer retention

With **99.58% of customers making only one purchase**, retention should be a major strategic priority.

Possible strategies include:

- Loyalty programs
- Personalized product recommendations
- Post-purchase email campaigns
- Discounts for second purchases
- Targeted campaigns for high-value customers

### 2. Focus on high-performing categories

Categories such as `beleza_saude`, `relogios_presentes`, and `cama_mesa_banho` generated significant revenue and should receive careful inventory and marketing attention.

### 3. Improve regional logistics

States with high delivery times and late-delivery rates should be prioritized for logistics optimization.

### 4. Monitor seller performance

Seller evaluation should combine:

- Revenue
- Order volume
- Items sold
- Delivery time
- Delivery reliability

### 5. Target high-value one-time customers

High-spending customers who have made only one purchase represent an opportunity for targeted retention campaigns.

### 6. Investigate customer complaints

Although the overall review score is positive, the presence of one- and two-star reviews indicates areas where customer experience can be improved.

---

# 🛠️ Tools & Technologies

- **MySQL**
- **SQL**
- **GitHub**
- Olist E-Commerce Dataset

### SQL Techniques Used

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- HAVING
- CASE statements
- JOINs
- Subqueries
- Aggregate functions
- COUNT
- SUM
- AVG
- ROUND
- COUNT DISTINCT
- DATE_FORMAT
- YEAR
- DATEDIFF

---

# 📂 Project Structure

```text
olist-ecommerce-sql-analysis/
│
├── README.md
│
├── sql/
│   ├── 01_data_exploration.sql
│   ├── 02_customer_analysis.sql
│   ├── 03_revenue_analysis.sql
│   ├── 04_product_analysis.sql
│   ├── 05_geographic_analysis.sql
│   ├── 06_logistics_analysis.sql
│   ├── 07_seller_analysis.sql
│   └── 08_customer_satisfaction.sql
│
└── screenshots/
