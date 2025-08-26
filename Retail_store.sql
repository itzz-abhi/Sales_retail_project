-- sales_retail_project

CREATE DATABASE project_p1;
USE project_p1;

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

SELECT *
FROM retail_store_transactions;

SELECT count(TransactionID)
FROM retail_store_transactions;

-- DATA CLEANING
SELECT *
FROM retail_store_transactions
WHERE Product = null or
Quantity = null or
UnitPrice = null or
PaymentType	= null or
TransactionID = null or	
TotalPrice = null or
Customer_id	= null or
Gender = null or
sale_date = null;

SET SQL_SAFE_UPDATES =0;

DELETE
FROM retail_store_transactions
WHERE Product = null or
Quantity = null or
UnitPrice = null or
PaymentType	= null or
TransactionID = null or	
TotalPrice = null or
Customer_id	= null or
Gender = null or
sale_date = null;

-- Data exploration

-- How many sales we have
SELECT COUNT(TransactionID) AS total_sales
FROM retail_store_transactions;

-- How many customers we have
SELECT DISTINCT Customer_id AS "Customers"
FROM retail_store_transactions;

SELECT COUNT(DISTINCT Customer_id) AS "Total Customers"
FROM retail_store_transactions;

-- How many products we have
SELECT DISTINCT Product 
FROM retail_store_transactions;

SELECT COUNT(DISTINCT Product) AS "Total Product"
FROM retail_store_transactions;

-- How many types of payment we have
SELECT DISTINCT PaymentType 
FROM retail_store_transactions;

SELECT COUNT(DISTINCT Product) AS "Total Payment Type"
FROM retail_store_transactions;

-- key problem

-- 1.retrieve all columns for sales made on specific date
DELIMITER //
CREATE PROCEDURE get_sale_date(IN in_sale_date DATE)
BEGIN
SELECT *
FROM retail_store_transactions
WHERE sale_date = in_sale_date;
END //
DELIMITER ;

CALL get_sale_date('2022-07-31');
CALL get_sale_date('2022-08-22');

-- 2.retrieve all transaction where the category is 'monitor'  and the 'quantity' is greater than 5 in the month of 'july 2022'
 SELECT Product ,SUM(Quantity) AS "Total_quantity"
 FROM retail_store_transactions
 WHERE product = 'Monitor' AND 
 DATE_FORMAT(sale_date,'%m-%Y') ='07-2022'
 GROUP BY Product;
 
 -- 3.calculate the total sales (total_sale) for each product
 SELECT Product,ROUND(SUM(totalPrice),2) AS "Total Price",COUNT(TransactionID) AS "Total Order"
 FROM retail_store_transactions
 GROUP BY Product;
 
 -- 4. calculate total price of a each product by each gender
 SELECT Product,Gender,ROUND(SUM(totalPrice),2) AS "Total Price"
 FROM retail_store_transactions
 GROUP BY Product,Gender
 ORDER BY Product;
 
 -- 5.Find all transaction where the total_sale is greater than 2750
 SELECT ROW_NUMBER() OVER(ORDER BY TransactionID) AS "Sr no.",
 TransactionID,Product,Quantity,UnitPrice,PaymentType,TotalPrice,Customer_id,Gender,sale_date
 FROM retail_store_transactions
 WHERE TotalPrice > 2750;
 
 -- 6.Calculate the average sale of each month
 SELECT DATE_FORMAT(sale_date,'%Y') AS Sale_year,DATE_FORMAT(sale_date,'%m') AS Sale_month, ROUND(AVG(TotalPrice),2) AS Average_sale,
 RANK() OVER(PARTITION BY DATE_FORMAT(sale_date,'%Y') ORDER BY AVG(TotalPrice)) AS Sr_no
 FROM retail_store_transactions
 GROUP BY Sale_month,Sale_year
 ORDER BY sr_no
LIMIT 2;

-- 7. TOT 5 Customer based on the highest total sale
SELECT Customer_id, ROUND(SUM(TotalPrice),2) AS total_sale 
FROM retail_store_transactions
GROUP BY Customer_id
ORDER BY total_sale DESC
LIMIT 5;  

-- 8 Find the number of unique customers who purchased items from each category
SELECT COUNT(DISTINCT Customer_id) AS 'Customers',Product 
FROM retail_store_transactions
GROUP BY Product;

-- 9 Total Price from each payment type
DELIMITER //
CREATE PROCEDURE get_Payment(IN in_payment_type VARCHAR(50))
BEGIN 
SELECT PaymentType,ROUND(SUM(TotalPrice),2) as total_price 
FROM  retail_store_transactions
WHERE PaymentType = in_payment_type
GROUP BY PaymentType;
END //
DELIMITER ;


CALL get_Payment('Gift Card');
CALL get_Payment('Online');
CALL get_Payment('Debit Card');
CALL get_Payment('Credit Card');
CALL get_Payment('Cash');

-- 10. Create View for customers
CREATE VIEW Customer_view AS 
SELECT DISTINCT Customer_id,COUNT(Quantity) AS Total_Quantity,ROUND(SUM(TotalPrice),2) AS Total_price
FROM retail_store_transactions
GROUP BY Customer_id
order by Customer_id;

SELECT *
FROM Customer_view;



