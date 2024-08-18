use excelr;
show tables;
Select * from employees;
Select distinct jobTitle
from employees;
# Day 4   question (2) ----------
SELECT 
    employeeNumber,
    firstName,
    jobTitle,
    CASE
        WHEN jobTitle = 'President' THEN 'P'
        WHEN jobTitle = 'VP Sales' OR 'VP Marketing' THEN 'VP'
        WHEN jobTitle = 'VP Marketing' THEN 'VP'
        WHEN jobTitle = 'Sales Rep' THEN 'SP'
        WHEN jobTitle = 'Sales Manager (APAC)' THEN 'SM'
        WHEN jobTitle = 'Sales Manager (NA)' THEN 'SM'
        WHEN jobTitle = 'Sale Manager (EMEA)' THEN 'SM'
    END AS jobTitle_abbr
FROM
    employees;
# Day 5 -----------------------------------------
Select year(paymentDate) as Year from payments;
Select min(amount) from payments;

SELECT 
    YEAR(paymentDate) AS year, MIN(amount) as "Min Amount"
FROM
    payments
GROUP BY year
ORDER BY year;

Select quarter(paymentDate) as QuarterCol from payments;
Select count(customerNumber) from payments;
Select distinct(count(customerNumber)) from payments;
select * from orders;
Select sum(orderNumber) as totalorders, customerNumber from orders group by customerNumber;

Select orderNumber
from
	Orders o
	join
    payments p On O.customerNumber = o.customerNumber;
    Select customerNumber from orders;
    Select distinct(customerNumber) from orders;
    Select customerNumber from payments;
    Select distinct(customerNumber) from payments;
Select count(orderNumber) from orders where status = "shipped";

 
Select Month(orderDate) as Month, Quarter(orderDate) as Quarter, count(distinct(customerNumber)) from orders group by month;

Select Year(orderDate) as year,
	case
		When quarter(orderDate) = 1 Then "Q1"
        When quarter(orderDate) = 2 Then "Q2"
        when quarter(orderDate) = 3 Then "Q3"
        Else "Q4"
	End as Quarter,
		orderNumber
		
    from orders
        Order by Quarter;
    
    SELECT 
    YEAR(orderDate), COUNT(orderNumber) AS totalOrders,
    case
		When quarter(orderDate) = 1 Then "Q1"
        When quarter(orderDate) = 2 Then "Q2"
        when quarter(orderDate) = 3 Then "Q3"
        Else "Q4"
	End as Quarter 
    
FROM
    orders
GROUP BY year(orderDate);
    
Select concat('Q', Quarter(orderdate)) as Quarter from orders;    
 
## Day 5 ans for 2 -------------
SELECT 
    YEAR(orderdate) AS year,
    CONCAT('Q', QUARTER(orderdate)) AS quarter,
    COUNT(DISTINCT customerNumber) AS "Unique customers",
    COUNT(*) AS "Total orders"
FROM
    orders
GROUP BY
    year,
    quarter
ORDER BY
    year,
    quarter;
    
# Day 7 ---------------
# employee number, Sales Person (first & last), unique customer number

Select * from employees;
Select * from customers;

SELECT e.employeeNumber,
    CONCAT(e.firstName, ' ', e.lastname) AS 'Sales Person',
    COUNT(DISTINCT c.customernumber) AS 'Uniqu customers'
FROM employees e
        JOIN
    Customers c ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY e.employeeNumber , 'Sales Person'
ORDER BY COUNT(DISTINCT c.customernumber) DESC;
   
# Day answer for 2) 
# Tables: Customers, Orders, Orderdetails, Products
/*Show total quantities, total quantities in stock, left over quantities for each product and each customer. Sort the data by customer number.*/

Select * from products;
Select customerNumber, customerName from customers;
Select productCode, productName, quantityInStock as "Total Inventory" from products;
Select quantityOrdered as "Order Quantity" from Orderdetails;

Select 
	c.customerNumber, 
    c.customerName,
    p.productCode,
    p.productName, 
    od.quantityOrdered as "Order Qty",
    p.quantityInStock as "Total Inventory",
    p.quantityInStock - od.quantityOrdered as "Left Qty"
from customers c
	Join
    orders o On c.customerNumber = o.customerNumber
    Join 
    orderdetails od on o.orderNumber = od.orderNumber
    Join
    Products p On od.productCode = p.productCode
    order by customerNumber asc;

# Question number 3

Create table Laptop_Name (Brand varchar(255));
Insert Into Laptop_Name(Brand) Values ("Dell");
Insert Into Laptop_Name(Brand) Values ("Dell");
Insert Into Laptop_Name(Brand) Values ("HP");
Insert Into Laptop_Name(Brand) Values ("HP");
Insert Into Laptop_Name(Brand) Values ("Dell");
Insert Into Laptop_Name(Brand) Values ("Acer");
Insert Into Laptop_Name(Brand) Values ("Lenova");

Create table Colours (Colour varchar (8));
Insert into Colours Values("White");
Insert into Colours Values("Blue");
Insert into Colours Values("Black");
Insert into Colours Values("Green");
Insert into Colours Values("Yello");
Insert into Colours Values("Indigo");
Insert into Colours Values("Orange");
Insert into Colours Values("Red");

Select Count(*) from Colours;  #8
Select Count(*) from Laptop_Name; #7  

Select Count(*) as Total_Rows  #56
from
	Colours
    cross join
    Laptop_Name;   
    
# Day 7, Question 4
# Project table with columns ●	EmployeeID ●	FullName ●	Gender●	ManagerID

Create table Project(
EmployeeID int,
FullName Varchar(20),
Gender char (6),
ManagerID int);


select * from Project;

INSERT INTO Project VALUES(1, 'Pranaya', 'Male', 3);
INSERT INTO Project VALUES(2, 'Priyanka', 'Female', 1);
INSERT INTO Project VALUES(3, 'Preety', 'Female', NULL);
INSERT INTO Project VALUES(4, 'Anurag', 'Male', 1);
INSERT INTO Project VALUES(5, 'Sambit', 'Male', 1);
INSERT INTO Project VALUES(6, 'Rajesh', 'Male', 3);
INSERT INTO Project VALUES(7, 'Hina', 'Female', 3);


Select "Pranaya" as ManagerName, FullName as Employee from project where ManagerID != 3
Union all
Select "Preety" as ManagerName, FullName as Employee from project where ManagerID !=1;


# Day 8 -----------------------------------------------------------
Create table Facility (
	FacilityID Int Not null,
    Name Varchar(100),
    State Varchar(100),
    Country Varchar(100)
);

Alter table Facility  
Modify column FacilityID Int Not null auto_increment primary key,
Add column City Varchar(100) Not null
;

Select * from Facility;

# Day 9 ------------------------------
CREATE TABLE University (
    ID INT,
    Name VARCHAR(40)
);

Select * from University;
INSERT INTO University
VALUES (1, "       Pune          University     "), 
               (2, "  Mumbai          University     "),
              (3, "     Delhi   University     "),
              (4, "Madras University"),
              (5, "Nagpur University");
update University
Set
	Name = trim(Name);
    Select * from University;
    
    
    
    
    
Select
	ID,
	replace(Name, " ", "") as Name from University;
 
select SUBSTRING_INDEX(Name, ' ', 1) AS first_name from University;
Select Id, concat(SUBSTRING_INDEX(Name, ' ', 1)," ", "University") as Name from University;
    
## Day 10 ---------------------------------------------------------------------
select * from orders; # order number
Select * from products; # product code (required quantity value)
Select * from orderdetails; # product code & OrderNumber


Select 
	year(o.orderDate) as Year,
    Sum(p.quantityInStock) as Value,
    Sum(p.quantityInStock)/ Sum(p.quantityInStock) * 100 as Perct
    from orders o
	join
    orderdetails od On o.orderNumber = od.orderNumber
    join
    products p on od.productCode = p.productCode
group by year;





Select year(orderDate) as year, count(Status)
from orders
where status = "shipped"
Group by year(orderDate) ;

Select Year(paymentDate) as Year from payments group by year order by year asc;
Select sum(amount) as value, year(paymentDate) as Year from payments group by year;
    

    

## Day 10 -----------------------------------------------------
Create View Product_Status as
SELECT 
    YEAR(o.orderDate) AS year,
    #SUM(od.quantityOrdered) AS value,
    CONCAT(
        SUM(od.quantityOrdered),
        " (",
        CONCAT(ROUND((SUM(od.quantityOrdered) / (SELECT SUM(quantityOrdered) FROM orderdetails) * 100), 0)),
        "%)"
    ) AS Value
FROM
    orders o
JOIN
    orderdetails od ON o.orderNumber = od.orderNumber
WHERE
    o.status = "Shipped"
GROUP BY 
    year;


Select * from Product_Status; 

# Day 11 ----------------------------------------------
DELIMITER //

CREATE PROCEDURE GetCustomerLevel(IN customerNumber INT)
BEGIN
    DECLARE creditLimitValue DECIMAL(10, 2);
    DECLARE customerLevel VARCHAR(20);

    SELECT creditLimit INTO creditLimitValue
    FROM Customers
    WHERE customerNumber = customerNumber;

    IF creditLimitValue > 100000 THEN
        SET customerLevel = 'Platinum';
    ELSEIF creditLimitValue BETWEEN 25000 AND 100000 THEN
        SET customerLevel = 'Gold';
    ELSE
        SET customerLevel = 'Silver';
    END IF;

    SELECT customerLevel;
END;
//

DELIMITER ;


Select * from customers; # 103



## ---------------------------------------------------
Select * from customers;
DELIMITER $$
CREATE PROCEDURE GetCustomerLevel(IN Cust_No Integer)
BEGIN
    DECLARE amount Decimal(10,2);
    DECLARE Cust_level varchar(20);

SELECT 
    creditLimit
INTO amount FROM
    customers
WHERE
    customerNumber = Cust_No;

    IF amount > 100000 THEN
        SET Cust_level = "Platinum";
    ELSEIF amount BETWEEN 25000 AND 100000 THEN
        SET Cust_level = "Gold";
    ELSE
        SET Cust_level = "Silver";
    END IF;

SELECT Cust_level;
END $$
DELIMITER ;

call GetCustomerLevel(103);


# Day11 2) ---------------------
Delimiter $$
CREATE PROCEDURE Get_country_payments(IN Year INT, IN Country TEXT)
BEGIN
    SELECT 
        YEAR(paymentDate) AS Year,
        country AS Country,
        #SUM(amount) AS TotalAmount,
        CONCAT(FORMAT(SUM(amount) / 1000, 0), 'K') AS TotalAmount
    FROM payments p
    JOIN customers c ON p.customerNumber = c.customerNumber
    WHERE YEAR(paymentDate) = Year AND c.country = Country
    GROUP BY Year, Country;
END $$

DELIMITER ;

# day 12 -----------------

SELECT
    Year,
    Month,
    totalorders,
    CONCAT(FORMAT(100 * (totalorders - LAG(totalorders) OVER (ORDER BY Year, MONTH(orderDate))) / LAG(totalorders) OVER (ORDER BY Year, MONTH(orderDate)), 0), '%') AS YoY_PercentageChange
FROM (
    SELECT
        YEAR(orderDate) AS Year,
        DATE_FORMAT(orderDate, '%M') AS Month,
        COUNT(status) AS totalorders
    FROM
        orders
    WHERE
        status = 'Shipped'
    GROUP BY
        Year, Month
) AS monthly_orders
ORDER BY
    Year ASC, MONTH(orderDate) ASC;



Select * from orders;
Select Year(orderDate) as Year,
	   date_format(orderDate,'%M') as Month
     from orders;
     
         
   SELECT
    YEAR(orderDate) AS Year,
    DATE_FORMAT(orderDate, '%M') AS Month,
    COUNT(status) AS "total orders",
	#lag(COUNT(status)) over () as previous_order,
    #lead(COUNT(status)) over () as Next_order,
    #lag(COUNT(status)) over () - lead(COUNT(status)) over () as diff_orders,
    #(lag(COUNT(status)) over () - lead(COUNT(status)) over ())/ lead(COUNT(status)) over () * 100 as percent
    #lag(COUNT(status)) over () - COUNT(status),
    #(COUNT(status) - lag(COUNT(status)) over ())/(lag(COUNT(status)) over ())*100 as diff,
    CONCAT(ROUND(((COUNT(status) - lag(COUNT(status)) over ()) / lag(COUNT(status)) over ()) * 100), '%') AS "% YoY Change"
FROM
    orders
WHERE
    status = 'Shipped'
GROUP BY
    Year, Month
ORDER BY
    Year ASC, MONTH(orderDate) ASC;
  
    # Day 12 (2) -------------------------------------------
CREATE TABLE emp_udf (
    Emp_Id INT Auto_increment primary key,
    Name VARCHAR(40),
    DOB DATE
);

INSERT INTO Emp_UDF(Name, DOB)
VALUES ("Piyush", "1990-03-30"), ("Aman", "1992-08-15"), ("Meena", "1998-07-28"), ("Ketan", "2000-11-21"), ("Sanjay", "1995-05-21");

Select * from emp_udf;

DELIMITER $$

CREATE FUNCTION CalculateAge(DOB DATE) RETURNS VARCHAR(50)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
	
    DECLARE age_years INT;
    DECLARE age_months INT;
    DECLARE age_in_years_and_months VARCHAR(50);

    SELECT FLOOR(DATEDIFF(CURDATE(), DOB) / 365) INTO age_years;
    SELECT FLOOR((DATEDIFF(CURDATE(), DOB) % 365) / 30) INTO age_months;

    SET age_in_years_and_months = CONCAT(age_years, ' years ', age_months, ' months');
    RETURN age_in_years_and_months;
END $$
DELIMITER ;

SELECT
    Emp_Id,
    Name,
    DOB,
    CalculateAge(DOB) AS Age
FROM
    emp_udf;


#Day 13 ------------------------------------------
Select * from orders;  # customerNumber common
Select customerNumber, customerName from customers;


SELECT 
    customerNumber, customerName
FROM
    customers
WHERE
    customerNumber NOT IN (SELECT 
            customerNumber
        FROM
            orders);
            

# day 13 (2)

SELECT c.customerNumber, c.customerName,COUNT(o.orderNumber) AS orderCount
FROM customers c
		LEFT JOIN
    orders o ON c.customerNumber = o.customerNumber
GROUP BY c.customerNumber, c.customerName

UNION

SELECT o.customerNumber, c.customerName, COUNT(o.orderNumber) AS orderCount
FROM customers c
		RIGHT JOIN
      orders o ON c.customerNumber = o.customerNumber
GROUP BY o.customerNumber, c.customerName;

#select * from orderdetails;
#select Max(quantityOrdered) as MaxQty from orderdetails where Max(quantityOrdered)< (select Max(quantityOrdered) as Hmax from orderdetails) group by orderNumber order by orderNumber;

SELECT od1.orderNumber,
    MAX(od1.quantityOrdered) AS quantityOrdered
FROM
    orderdetails od1
WHERE
    od1.quantityOrdered < (
        SELECT MAX(od2.quantityOrdered)
        FROM orderdetails od2
        WHERE od1.orderNumber = od2.orderNumber   )
GROUP BY od1.orderNumber;

#select * from orderdetails;
#select Max(quantityOrdered) as "Max(Total)", Min(quantityOrdered) as "Min(Total)" from orderdetails;
select orderNumber, count(productCode) as productcount, Max(quantityOrdered) as "Max(Total)", 
		Min(quantityOrdered) as "Min(Total)" from orderdetails group by orderNumber order by "Max(Total)" "Min(Total)";
#select orderNumber, max(quantityOrdered) as Max, Min(quantityOrdered) as Min from orderdetails where orderNumber = 10100;

#Select * from productlines;  # productline pk 
#select * from products;   #productline common
#select round(avg(buyprice),0) as averagbuyprice from products group by productLine order by averagbuyprice desc;
#select productline from productlines pl
#join
#products p on p.productLine = pl.productLine
#Where (productline > round(avg(buyprice),0));

SELECT 
    productLine, COUNT(*) AS Total
FROM
    products
WHERE
    buyPrice > (SELECT 
            AVG(buyPrice)
        FROM
            products)
GROUP BY productLine
ORDER BY Total DESC;

# Day 14 ------------------------------------------------------
Create table Emp_EH (
	EmpID int primary key,
    EmpName varchar(40),
    EmailAddress varchar(40)
    );
    
    
    
Delimiter $$
Create procedure InsertEmployeeDetails
(	InputEmpID int,
    InputEmpName varchar(40),
    InputEmailID varchar(40) )
	Begin
    Declare continue handler for sqlexception select "Error occurred";
    INSERT INTO Emp_EH(EmpID, EmpName, EmailAddress)
    Values (InputEmpID, InputEmpName,InputEmailID); 
	End $$    
Delimiter ;

call InsertEmployeeDetails(1, "abc", "abc@gmail.com");
call InsertEmployeeDetails(1, "abc", "abc@gmail.com");


Select * from Emp_EH;

# Day 15 -------------------------------------------------

Create table Emp_BIT (
Name varchar(40),
Occupation varchar(40),
Working_date date,
Working_hours Decimal(10,2)
);

INSERT INTO Emp_BIT VALUES
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);  

Select * from Emp_BIT;
## Trigger for Insert statement

#delete from Emp_BIT
#where Name = "Hari";

Delimiter $$
Create Trigger before_insert
Before Insert on Emp_BIT
For each row
Begin 
		if new.Working_hours <= 0 Then 
        Set new.Working_hours = abs(new.Working_hours);
		End if;
End $$
Delimiter ;

INSERT INTO Emp_BIT VALUES ('Hari', 'Analyst', '2020-10-04', -24); 





















