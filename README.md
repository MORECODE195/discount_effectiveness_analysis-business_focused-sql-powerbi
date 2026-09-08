# Discount Effectiveness Analysis

_A data‑driven analysis revealing how discounts impact sales volume and profitability, helping businesses find the optimal balance between growth and margin._

---

## 📌 Table of Contents
- <a href="#project-overview">Project Overview</a>
- <a href="#project-objective">Project Objective</a>
- <a href="#dataset">Dataset</a>
- <a href="#tools--technologies">Tools & Technologies</a>
- <a href="#project-structure">Project Structure</a>
- <a href="#project-workflow">Project Workflow</a>
- <a href="#power-bi-dashboard">Power BI Dashboard</a>
- <a href="#key-insights">Key Insights</a>
- <a href="#dashboard-highlights">Dashboard Highlights</a>
- <a href="#business-recommendations">Business Recommendations</a>
- <a href="#author--contact">Author & Contact</a>

---
<h2><a class="anchor" id="project-overview"></a>Project Overview</h2>

A data‑driven analysis revealing how discounts impact sales volume and profitability, helping businesses find the optimal balance between growth and margin. A complete data pipeline was built using SQL Server (SSMS) for analyzing business questions and Power BI for visualization.

---
<h2><a class="anchor" id="project-objective"></a>Project Objective</h2>

Effective discounting and sales management are critical in the retail sector. This project aims to:
- Analyze the relationship between discounts and profitability.
- Identify discount ranges that generate healthy profit margins.
- Understand whether higher discounts lead to higher sales volume.
- Identify categories and sub-categories affected by heavy discounting.
- Analyze discount performance across states and cities.
- Identify products with high sales but low or negative profit.
- Compare profitability between discounted and non-discounted products.
- Recommend areas where discount strategies should be reconsidered.

---
<h2><a class="anchor" id="dataset"></a>Dataset</h2>

The project uses the Sample Superstore dataset containing transactional sales data.

Key Columns
- Row ID
- Order ID
- Order Date
- Ship Date
- Ship Mode
- Customer ID
- Customer Name
- Segment
- Country
- City
- State
- Postal Code
- Region
- Product ID
- Category
- Sub-Category
- Product Name
- Sales
- Quantity
- Discount
- Profit

Additional Columns Created
To support the discount analysis, the following calculated columns were created:

- Discount Band
- Revenue Without Discount
- Discount Amount

---

<h2><a class="anchor" id="tools--technologies"></a>Tools & Technologies</h2>

- Microsoft Excel – Initial data inspection and preparation
- SQL Server Management Studio (SSMS) – Data analysis and business queries
- Power BI – Interactive dashboard and data visualization
- DAX – Calculated columns and measures in Power BI
- GitHub – Project documentation and portfolio

---
<h2><a class="anchor" id="project-structure"></a>Project Structure</h2>

```
Discount-Effectiveness-Analysis/
 │
 ├── Dataset/
 │ └── Sample_Superstore.csv
 │
 ├── SQL/
 │ └── Discount_Effectiveness_Analysis.sql
 │
 ├── PowerBI/
 │ └── Discount_Effectiveness_Analysis_Dashboard.pbix
 │
 ├── Dashboard/
 │ └── Dashboard_Images
 │
 └── README.md
```

---
<h2><a class="anchor" id="project-workflow"></a>Project Workflow</h2>

```
Sample Superstore Dataset
         ↓
  Data Preparation
         ↓ 
Create Calculated Columns 
         ↓ 
    SQL Analysis
         ↓ 
  Business Questions 
         ↓ 
     Power BI 
         ↓ 
Interactive Dashboard 
         ↓ 
  Business Insights
         ↓ 
  Recommendations
```

---
<h2><a class="anchor" id="power-bi-dashboard"></a>Power BI Dashboard</h2>

The Power BI dashboard is divided into two main analytical sections.

1️. **Discount Overview**

This section focuses on understanding the overall impact of discounting on business profitability.

**Key Questions Answered**
- Are we discounting profitably?
- Which product categories are most affected by discounting?
- Where is discounting causing the greatest impact on profit?
- At what discount level does profitability start to decline?
- How does profit margin change as discount increases?

2️. **Discount vs. Volume**

This section analyzes whether higher discounts actually generate higher sales volume.

**Key Questions Answered**
- Do higher discounts increase the quantity of products sold?
- Which states and cities receive the highest discounts?
- How does profitability vary across different discount bands?
- Which discount range provides the best balance between volume and profit margin?
- Are high-volume areas also generating healthy profits?

---
<h2><a class="anchor" id="key-insights"></a>Key Insights</h2>

The analysis highlights several important patterns:

1. The **average discount is approximately 16%**, while the overall profit margin is approximately **12%**.
2. Higher discount levels do not necessarily result in proportionally higher sales volume.
3. The **0% discount band** generates strong quantity and healthy profitability compared with heavily discounted bands.
4. Profit margins decline significantly as discount levels increase.
5. The **30%+ discount band** shows substantially weaker profitability and can result in negative margins.
6. Some products generate strong sales but relatively low or negative profit, indicating potential issues with excessive discounting.
7. Discount performance varies across categories, sub-categories, states, and cities.
8. Lower discount ranges can provide a better balance between **sales volume and profitability**.

**Business takeaway:** Discounts can help increase sales volume, but excessive discounting can significantly reduce profitability. A more targeted discount strategy based on product, category, and region can help maintain sales while protecting profit margins.

---
<h2><a class="anchor" id="dashboard-highlights"></a>Dashboard Highlights</h2>

The Power BI dashboard includes visualizations for:

- KPI Cards
- Sales & Profit
- Average Discount
- Profit Margin %
- Discount Band Analysis
- Category Performance
- Sub-Category Performance
- State & City Analysis
- Quantity Sold
- Discount vs. Profit
- Discount vs. Volume
- Product-Level Profitability


---
<h2><a class="anchor" id="business-recommendations"></a>Business Recommendations</h2>

1. Limit excessive discounting where profit margins become negative.
2. Focus discounts on products where they generate meaningful additional sales volume.
3. Review products with high sales but low or negative profit.
4. Evaluate discount strategies separately by category, sub-category, state, and city.
5. Use lower or moderate discount ranges where they provide a better balance between volume and profitability.
6. Monitor profit margin alongside sales volume rather than using sales growth alone to measure discount effectiveness.

---
<h2><a class="anchor" id="author--contact"></a>Author & Contact</h2>

**Jay Narendra More**  
Data Analyst  
📧 Email: jaimore10@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/jay-more-42493833b/)  
