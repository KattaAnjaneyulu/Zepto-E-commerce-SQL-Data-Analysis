# Zepto E-Commerce SQL Data_Analysis

## 📌 Project Overview

This project analyzes the product inventory of **Zepto**, one of India's fastest-growing quick-commerce (10-minute grocery delivery) platforms, using **SQL in MySQL Workbench**. It follows the workflow of a real data analyst: setting up the database, exploring the data, cleaning it, and writing business-driven queries that answer questions about **pricing, discounts, stock availability, inventory and revenue**.

## 🎯 Objectives

- Create a database and table for Zepto's product data
- Explore the data to understand categories, pricing and stock
- Clean the data by handling nulls, duplicates and invalid prices
- Answer real business questions with SQL queries
- Turn the results into insights a business team could act on

## 📂 Dataset

- **Source:** Zepto inventory [dataset](https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset/data?select=zepto_v2.csv) from Kaggle (scraped from Zepto's product listings)
- **Size:** [3732 rows, 9 columns]
- **Key columns:** Category, Name, mrp, discountPercent, availableQuantity, discountedSellingPrice, weightInGms, outOfStock, quantity

## 🛠️ Tools & Skills Used

- MySQL 8.0 + MySQL Workbench
- SQL: aggregations, GROUP BY, CASE WHEN, subqueries, ORDER BY, filtering
- Git & GitHub for version control

## 🔍 Project Workflow

**1. Database & table creation:** created the database and table with proper data types, then imported the CSV (saved as UTF-8) with the Table Data Import Wizard.

**2. Data exploration:** checked total record count, previewed sample rows, found distinct categories, compared in-stock vs out-of-stock products, and looked for null values and duplicate product names.

**3. Data cleaning:** removed rows where MRP or selling price was 0, converted prices from paise to rupees, and handled duplicates and nulls.

**4. Business analysis:** answered questions such as:

- Which products give the best value (highest discount)?
- Which high-MRP products are out of stock?
- What is the estimated revenue for each category?
- Which expensive products (MRP above ₹500) offer a low discount?
- Which categories have the highest average discount?
- What is the price per gram for each product?
- How do products split into Low / Medium / Bulk weight groups?
- What is the total inventory weight per category?

## 📊 Key Insights

- Found top 10 best-value products based on discount percentage

- Identified high-MRP products that are currently out of stock

- Estimated potential revenue for each product category

- Filtered expensive products (MRP > ₹300) with minimal discount

- Ranked top 5 categories offering highest average discounts

- Calculated price per gram to identify value-for-money products

- Grouped products based on weight into Low, Medium, and Bulk categories

- Measured total inventory weight per product category

## ▶️ How to Run This Project

1. Clone the repository: `git clone` [repo link.](https://github.com/KattaAnjaneyulu/Zepto-E-commerce-SQL-Data-Analysis)
2. Open **MySQL Workbench** and create a new schema.
3. Import the dataset CSV into a table named `zepto`
4. Open `Zepto_SQL_Analysis.sql` and run it section by section: table creation → exploration → cleaning → analysis.

## 📁 Repository Structure

- `zepto_dataset.csv`: raw dataset
- `zepto_sql_analysis.sql`: all SQL queries
- `README.md`: project documentation

## 👤 Author

### **Katta Anjaneyulu**

🎓 MSc Data Science Graduate | Osmania University

📍 Hyderabad, India

🎯 Aspiring Data Analyst / Data Scientist

🗄️ SQL &nbsp;|&nbsp; 📊 Power BI &nbsp;|&nbsp; 📗 Excel &nbsp;|&nbsp; 🐍 Python

🔗 **Connect with me**

- [💼 LinkedIn](https://www.linkedin.com/in/kattaanjaneyulu)
- [🐙 GitHub](https://github.com/KattaAnjaneyulu)
- [📧 Email](https://mail.google.com/mail/?view=cm&to=kattaanjaneyulu.k@gmail.com)
