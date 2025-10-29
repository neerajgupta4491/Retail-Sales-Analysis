create database SQL_project;

## create the table

CREATE TABLE retail_sales (
    transaction_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);

SELECT * FROM retail_sales;

## checking the null values
SELECT 
    *
FROM
    retail_sales
WHERE
    transaction_id IS NULL
        OR sale_date IS NULL
        OR sale_time IS NULL
        OR gender IS NULL
        OR category IS NULL
        OR quantity IS NULL
        OR cogs IS NULL
        OR total_sale IS NULL;
        
## How many sales we have?
SELECT 
    COUNT(*) AS total_sale
FROM
    retail_sales;
    
##1 How many uniuque customers we have ?

SELECT 
    COUNT(DISTINCT customer_id) AS total_sale
FROM
    retail_sales;
    
##2 How many uniuque category we have ?

SELECT DISTINCT 
    category
FROM
    retail_sales;

 ##3 how muchh sales made on '2022-10-09'

SELECT 
    *
FROM
    retail_sales
WHERE
    sale_date = '2022-10-09';
  
##4 Write a SQL query to all transactions where the category is 'Clothing' and
## the quantity is more than 3 

SELECT 
  *
FROM retail_sales
WHERE 
    category = 'Clothing'
AND
    quantity > 3;

## 5 Write a SQL query to calculate the total sales for each category.

SELECT 
    category,
    SUM(total_sale) as net_sale
FROM retail_sales
GROUP BY category;

##6 find the average age of customers who purchased items from the 'Beauty' category.

SELECT
ROUND(AVG(age), 1) as avg_age       
FROM retail_sales
WHERE category = 'Beauty';

##7 find all transactions where the total_sale is greater than 1500.

SELECT * FROM retail_sales
WHERE total_sale > 1500;

##8 find the total number of transactions made by each gender in each category.

SELECT 
    category,
    gender,
    COUNT(*) as total_transactions
FROM retail_sales
GROUP BY 
    category,
    gender;

##9 find the top 5 customers based on the highest total sales 

SELECT 
    customer_id,
    SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY customer_id
LIMIT 5;

## 10 find the number of unique customers who purchased items from each category.

SELECT 
    category,    
    COUNT(DISTINCT customer_id) as unique_category
FROM retail_sales
GROUP BY category;

