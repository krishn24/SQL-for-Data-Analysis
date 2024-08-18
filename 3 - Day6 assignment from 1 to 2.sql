# Day 6   question 1 -------------------
CREATE TABLE journey (
    Bus_ID CHAR(8) NOT NULL,
    Bus_Name VARCHAR(15) NOT NULL,
    Source_Station VARCHAR(25) NOT NULL,
    Destination VARCHAR(25) NOT NULL,
    Emal VARCHAR(30) UNIQUE
);

# Day 6 Question 2 ----------
CREATE TABLE vendor (
    Vendor_ID CHAR(10) UNIQUE NOT NULL,
    Name VARCHAR(15) NOT NULL,
    Email VARCHAR(25) UNIQUE,
    Country VARCHAR(10) DEFAULT 'N/A'
);


Insert into vendor
(
Vendor_ID,
Name,
Email
)
Values (2001,'Hari', 'Krishn24@gmail.com');
select * from Vendor;

Create table movies
