Create database Practice;
use Practice;

# Day 6 (3) question ----

CREATE TABLE Movies (
    Movie_id CHAR(15) UNIQUE NOT NULL,
    Name VARCHAR(15) NOT NULL,
    Release_year VARCHAR(10) DEFAULT '-',
    Cast VARCHAR(15) NOT NULL,
    Gender ENUM('male', 'female'),
    No_of_shows INT(5),
    CHECK (No_of_shows > 0)
);

Insert into Movies(
Movie_id,
Name,
Cast,
Gender,
No_of_shows)
Values ('M01','RRR','NTR','Male', 1);
Select * from Movies;
drop table supplier;
Drop table stock;

# Day 6 (4) ---------
CREATE TABLE Stock (
    Stock_id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_id INT(8),
    balance_stock INT(10),
    FOREIGN KEY (product_id)
        REFERENCES Product (product_id)
        ON DELETE CASCADE
);


CREATE TABLE supplier (
    supplier_id INT(5) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    supplier_name VARCHAR(15),
    Location VARCHAR(10)
);

CREATE TABLE Product (
    product_id INT(8) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    product_name VARCHAR(15) UNIQUE NOT NULL,
    description VARCHAR(10),
    supplier_id INT(5) NOT NULL,
    FOREIGN KEY (supplier_id)
        REFERENCES supplier (supplier_id)
        ON DELETE CASCADE
);   

