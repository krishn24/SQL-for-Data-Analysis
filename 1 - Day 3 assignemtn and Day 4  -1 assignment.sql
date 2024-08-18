use excelr;

select * from customers;
## day 3---------------------------
SELECT 
    CustomerNumber, CustomerName, state, creditlimit
FROM
    customers
WHERE
    state IS NOT NULL
        AND (creditlimit BETWEEN '50000' AND '100000')
ORDER BY creditlimit DESC;

## 2nd question-------------------------
select * from products;
Select distinct productLine from products;
SELECT DISTINCT
    productline
FROM
    products
WHERE
    productline LIKE '%cars';
-----------------------------------------------------------    
-- Day 4 assignment
DROP TABLE IF EXISTS `orders`;
Select * from orders;
CREATE TABLE `orders` (
  `orderid` Char(11) NOT NULL AUTO_INCREMENT,
  `product_code` varchar(15) DEFAULT NULL,
  `vendor` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`orderid`)
) ;

use excelr;

select * from employee;
delete from employee
where empid = '100';

select * from orders;
## Day 4 assignment question (1) answer -----------------------------------
SELECT 
    orderNumber, status, IFNULL(comments, '-') AS comments
FROM
    orders
WHERE
    status = 'shipped';
 # ----------------------------------end ---------------------------------#-------------------------#-----------------
Select ifnull(comments, '-')  as mycomments from orders;
   
Select * from payments;   
select paymentDate, min(amount) as MinPayment from payments
group by paymentDate;

select year(paymentDate) as pmtDate from payments;


SELECT 
    YEAR(paymentDate) AS pmtDate, MIN(amount) AS MinPmt
FROM
    payments
GROUP BY pmtDate
ORDER BY pmtDate ASC;


Select * from orders;
## extracts year form the order date
Select Year(orderDate) as Year from orders;
Select sum(orderNumber) as TotalOrders from orders;
Select customerNumber from orders;
## to show quarters
Select year(orderDate) as year, quarter(orderDate) as Qtr, customerNumber, sum(orderNumber) as TotalOrders from orders
Group by qtr;

use excelr;   
## to get Q1, Q2, Q3 using dates column
## you can remove orderDate after select to not to show in the table
SELECT
year(orderDate) As year, 
  CASE
    WHEN QUARTER(orderDate) = 1 THEN 'Q1'
    WHEN QUARTER(orderDate) = 2 THEN 'Q2'
    WHEN QUARTER(orderDate) = 3 THEN 'Q3'
    WHEN QUARTER(orderDate) = 4 THEN 'Q4'
  END AS quarter,
  customerNumber as UniqueCustomers, count(ordernumber) as TotalOrders
FROM orders;


SELECT
year(orderDate) As year, 
  CASE
    WHEN QUARTER(orderDate) = 1 THEN 'Q1'
    WHEN QUARTER(orderDate) = 2 THEN 'Q2'
    WHEN QUARTER(orderDate) = 3 THEN 'Q3'
    WHEN QUARTER(orderDate) = 4 THEN 'Q4'
  END AS quarter, count(distinct CustomerNumber) as UniqueCustomers, count(ordernumber) as TotalOrders
FROM orders
Group by quarter
order by quarter;

SELECT
  CASE
    WHEN QUARTER(orderDate) = 1 THEN 'Q1'
    WHEN QUARTER(orderDate) = 2 THEN 'Q2'
    WHEN QUARTER(orderDate) = 3 THEN 'Q3'
    WHEN QUARTER(orderDate) = 4 THEN 'Q4'
  END AS quarter FROM orders;

select * from orders;
select Year(orderDate) from orders;

SELECT
year(orderDate) as Year, 
CASE	
	WHEN quarter(orderDate) = 1 THEN 'Q1'
    WHEN quarter(orderDate) = 2 THen 'Q2'
    WHEN quarter(orderDate) = 3 Then 'Q3'
    when quarter(orderDate) = 4 Then 'Q4'
    End as Quarter, count(distinct customerNumber) as "Uniqe Customers"   ,Count(orderDate) as "Total Orders"
from orders
group by quarter;

select count(distinct orderNumber) from orders;
Select * from orders;
SELECT
year(orderDate) as Year, 
CASE	
	WHEN quarter(orderDate) = 1 THEN 'Q1'
    WHEN quarter(orderDate) = 2 THen 'Q2'
    WHEN quarter(orderDate) = 3 Then 'Q3'
    when quarter(orderDate) = 4 Then 'Q4'
    End as Quarter
from orders;


SELECT  count(distinct customerNumber) as UniqeCustomers from Orders; ##98
Select count(customerNumber) from orders;  ##326
use excelr;

Select jobTitle,
Case when job_Title = 'President' THEN 'P'
WHEN jobTitle LIKE '%Sales Manager%'  THEN 'SM'
WHEN jobTitle LIKE '%Sales Rep%'  THEN 'SR'
WHEN jobTitle LIKE '%VP%'  THEN 'VP'
END as jobTitle_abbr


## showing unique number of customer by year and quarter


SELECT YEAR(orderDate) AS year, 
       QUARTER(orderDate) AS quarter, 
       COUNT(DISTINCT customerNumber) AS unique_customers
FROM orders
GROUP BY YEAR(year), QUARTER(quarter);


select * from orders;


## unique items from a colum
Select count(distinct customerNumber) as UniqueCustomers from orders group by customerNumber;
-- alternative to use distinct 

## count of unique customers
Select distinct count(customerNumber) from orders;
select customerNumber from orders
group by customerNumber;

select count(customerNumber) from orders; ## 326

select month(orderdate) as Month from orders;
## get months in jan, feb format
## if you use %M - gives you full month names

SELECT DATE_FORMAT(orderdate, '%b') AS formatted_month
FROM orders
group by formatted_month;


SELECT CONCAT(ROUND(amount / 1000), 'K') AS formatted_amount
FROM payments;

select * from payments;
Select paymentDate from payments;




SELECT 
    DATE_FORMAT(paymentDate, '%b') AS Months,
    CONCAT(ROUND(amount / 1000), 'K') AS formatted_amount
FROM
    payments
    Group by Months
    order by Months;



    



