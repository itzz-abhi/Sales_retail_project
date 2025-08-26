# Sales_retail_project
**Project Title**: Retail Store Sales Ananlysis 

**Database**: project_p1

## 🔧Overview:-
The goal of this project is to analyze transactional data from a retail store to uncover key business insights, including customer behavior, product performance, sales trends, and payment preferences. The analysis also includes data cleaning, data exploration, and the creation of reusable procedures and views for dynamic insights.

## 🎯Project Objective

🔍 **1. Data Cleaning & Preparation**

Remove records with null or missing values to ensure data integrity.

Structure the database (project_p1) and table (retail_store_transactions) for optimal querying.

📊 **2. Data Exploration**

Count total transactions (sales).

Identify the number of unique customers and products.

List distinct payment types used.

📆 **3. Time-Based Analysis**

Retrieve transactions from specific dates using stored procedures.

Analyze sales trends by month and year to detect seasonality.

Rank months based on average sales.

👥 **4. Customer Insights**

Identify top 5 customers based on total spending.

Count unique customers per product category to gauge product popularity.

💳 **5. Payment Method Analysis**

Calculate total revenue from each payment type.

Create reusable stored procedures for dynamic payment analysis.

📂 **6. Reusability & Reporting**

Create a customer summary view for quick insights into individual spending and purchase volume.

Enable dynamic, parameter-driven reporting using stored procedures and views.


## 📁Retail Sales Analysis Project Structure

**1. 🏗️ Database Setup**

```sql
CREATE DATABASE project_p1;
USE project_p1;
```

**2. 🗃️ Table Creation**

```sql
CREATE TABLE retail_store_transactions(
Product	varchar(50),
Quantity int,
UnitPrice float,
PaymentType	varchar(50),
TransactionID	varchar(50),
TotalPrice float,
Customer_id	int,
Gender	varchar(10),
sale_date date
);
```

**3. 🧹 Data Cleaning**

-->Check for NULL values in all important columns.

-->Delete records with missing (NULL) values.

-->Disable SQL safe update mode to allow deletions.

**4. 📊 Data Exploration**
4.1. General Insights:

-->Total number of transactions (sales)

-->Total number of unique customers

-->Total number of unique products

-->Total number of payment types

4.2. Unique Value Identification:

-->Distinct products

-->Distinct payment methods

**5. 🧠 Key Business Analysis**
5.1. Stored Procedures

-->get_sale_date(date): Retrieve sales on a specific date.

-->get_Payment(payment_type): Retrieve total sales per payment type.

5.2. Sales Analysis

-->Total quantity sold for a specific product (e.g., Monitor) in a specific month.

-->Total sales (SUM(TotalPrice)) and total orders (COUNT(TransactionID)) per product.

-->Total sales by gender for each product.

-->High-value transactions (TotalPrice > 2750).

5.3. Time-Based Analysis

-->Average monthly sales.

-->Ranking months based on average sales using window functions.

5.4. Customer Insights

-->Top 5 customers based on total sales.

-->Unique customer count per product (product popularity).

**6. 🔁 Reusability Components**
6.1. Stored Procedures

-->get_sale_date(IN in_sale_date DATE)

-->get_Payment(IN in_payment_type VARCHAR(50))

6.2. Views

-->Customer_view: Summary per customer including total quantity purchased and total spending.

📌 Conclusion:

This project successfully demonstrates the use of SQL for a comprehensive retail data analysis. By leveraging stored procedures, views, and advanced SQL functions like RANK() and ROW_NUMBER(), the project delivers dynamic and insightful reporting capabilities.

📈 3. Sales & Product Analysis

-->Calculate total and average sales per product.

-->Identify high-value transactions and top-selling items.

-->Analyze sales performance by gender for each product.

## 📌 Conclusion:

This project successfully demonstrates the use of SQL for a comprehensive retail data analysis. By leveraging stored procedures, views, and advanced SQL functions like RANK() and ROW_NUMBER(), the project delivers dynamic and insightful reporting capabilities.
