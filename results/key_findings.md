# Olist E-Commerce SQL Analysis — Key Findings

## 1. Overall Performance

- Total orders analyzed: **96,477**
- Total customers: **93,357**
- Total revenue: **R$15.42M**
- Average order value: **R$159.86**
- Average delivery time: **12.50 days**
- Delivered orders: **96,478**

> Note: Minor differences of one order can occur between metrics because different analyses use different joins and payment/order records.

---

## 2. Revenue Trends

Revenue increased significantly between 2016 and 2018.

| Year | Revenue |
|---|---:|
| 2016 | R$59,362.34 |
| 2017 | R$7,249,746.73 |
| 2018 | R$8,699,763.05 |

### Key Insight

**2018 generated the highest revenue**, reaching approximately **R$8.70M**, compared with **R$7.25M in 2017**.

Monthly revenue also showed strong growth throughout 2017 and 2018.

The strongest month was:

- **November 2017 — R$1.19M**

Other strong months included:

- April 2018 — R$1.16M
- March 2018 — R$1.16M
- May 2018 — R$1.15M
- January 2018 — R$1.12M

The very low values recorded in September and October 2018 appear to represent partial periods and should not be interpreted as normal monthly performance.

---

## 3. Customer Analysis

Customer purchasing frequency shows that the majority of customers made only one purchase.

| Customer Type | Customers | Average Spend | Revenue |
|---|---:|---:|---:|
| One-time | 93,098 | R$161.82 | R$15.06M |
| Repeat | 2,997 | R$314.99 | R$944K |

### Key Insight

Repeat customers spent approximately **twice as much per customer** as one-time customers.

This indicates a major opportunity to improve customer retention and encourage repeat purchases.

Customer frequency analysis showed:

- 93,099 customers made 1 order
- 2,745 customers made 2 orders
- 203 customers made 3 orders
- 30 customers made 4 orders
- A small number of customers made 5 or more purchases

### Business Opportunity

The marketplace could potentially increase revenue by:

- Improving customer retention
- Creating loyalty programs
- Offering personalized recommendations
- Providing incentives for second purchases
- Using targeted follow-up campaigns

---

## 4. Product Performance

The highest-selling products by number of items included products from categories such as:

- Ferramentas Jardim
- Móveis Decoração
- Cama Mesa Banho
- Informática Acessórios
- Relógios Presentes

The highest-revenue individual products included:

- A product in `informatica_acessorios` generating approximately **R$8,009.73**
- A product in `cama_mesa_banho` generating approximately **R$7,287.20**
- A product in `moveis_decoracao` generating approximately **R$6,428.70**

### Top Product Categories by Allocated Revenue

| Category | Allocated Revenue |
|---|---:|
| Beleza Saúde | R$258,385.79 |
| Relógios Presentes | R$217,319.41 |
| Cama Mesa Banho | R$214,332.92 |
| Esporte Lazer | R$202,319.88 |
| Informática Acessórios | R$192,796.58 |

### Key Insight

`beleza_saude` generated the highest allocated revenue among the analyzed product categories.

---

## 5. Seller Performance

The highest-revenue sellers included:

| Seller | Orders | Items Sold | Revenue | Avg. Delivery |
|---|---:|---:|---:|---:|
| 53243585... | 74 | 85 | R$47,594.72 | 14.02 days |
| 4869f7a5... | 196 | 197 | R$36,963.96 | 14.72 days |
| 7c67e144... | 184 | 256 | R$35,773.82 | 22.89 days |
| 4a3ca931... | 305 | 338 | R$34,603.63 | 14.30 days |
| fa1c13f2... | 110 | 110 | R$30,426.50 | 13.76 days |

### Key Insight

The highest-revenue seller was not necessarily the seller with the highest number of orders.

This shows that seller performance should be evaluated using multiple metrics, including:

- Revenue
- Orders
- Items sold
- Average delivery time
- Customer satisfaction

---

## 6. Delivery Performance

The analysis found:

- Delivered orders: **96,478**
- Late orders: **7,826**
- On-time orders: **88,652**
- Late delivery rate: **8.11%**
- Average delivery time: **12.50 days**

### Key Insight

Approximately **8.1% of delivered orders were late**.

This suggests that delivery performance is an important operational area for improvement.

Some sellers also showed significantly longer average delivery times.

For example:

- Seller `7c67e144...` had an average delivery time of approximately **22.89 days**
- Seller `4869f7a5...` averaged approximately **14.72 days**
- Seller `53243585...` averaged approximately **14.02 days**

---

## 7. Customer Satisfaction

The review analysis produced the following distribution:

| Review Score | Reviews |
|---|---:|
| 5 | 164 |
| 4 | 39 |
| 3 | 30 |
| 2 | 8 |
| 1 | 38 |

The majority of reviews were positive, with **5-star reviews representing the largest group**.

### Delivery and Reviews

| Delivery Status | Reviews | Average Score |
|---|---:|---:|
| On Time | 246 | 4.24 |
| Late | 24 | 2.50 |

### Key Insight

Orders delivered on time received substantially higher average review scores than late orders.

This suggests that delivery performance has a strong relationship with customer satisfaction.

---

## 8. Order Status

The order-status analysis showed:

| Status | Orders | Percentage |
|---|---:|---:|
| Delivered | 96,478 | 97.02% |
| Shipped | 1,107 | 1.11% |
| Canceled | 625 | 0.63% |
| Unavailable | 609 | 0.61% |
| Invoiced | 314 | 0.32% |
| Processing | 301 | 0.30% |
| Created | 5 | 0.01% |
| Approved | 2 | 0.00% |

### Key Insight

The overwhelming majority of orders reached the **delivered** status, indicating generally strong order fulfillment performance.

---

# Business Recommendations

Based on the analysis, the following actions could improve marketplace performance:

### 1. Increase Customer Retention
Repeat customers spend significantly more than one-time customers. Loyalty programs and personalized offers could encourage additional purchases.

### 2. Improve Delivery Performance
An approximately **8.1% late-delivery rate** represents an opportunity to improve logistics and seller fulfillment processes.

### 3. Monitor Seller Performance
Seller performance should be tracked using revenue, order volume, delivery speed, and customer satisfaction together.

### 4. Focus on High-Performing Categories
Categories such as `beleza_saude`, `relogios_presentes`, `cama_mesa_banho`, and `esporte_lazer` generated substantial revenue and could receive additional marketing attention.

### 5. Reduce Late Deliveries
The significant difference in review scores between on-time and late deliveries suggests that improving delivery reliability could also improve customer satisfaction.

---

# SQL Skills Demonstrated

This project demonstrates practical experience with:

- SQL
- MySQL
- SELECT statements
- Filtering with WHERE
- GROUP BY and HAVING
- ORDER BY
- Aggregate functions
- CASE statements
- JOINs
- Common Table Expressions (CTEs)
- Date and time analysis
- Customer segmentation
- Revenue analysis
- Product analysis
- Seller performance analysis
- Delivery analysis
- Customer satisfaction analysis
- Business insight generation
