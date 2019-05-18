-- Create SQL Database ETL Project
CREATE DATABASE ETL_PROJECT;

-- This is the SQL to create the first table for our .csv Baby names file
USE ETL_PROJECT;
CREATE TABLE USA_baby_names(
  name_rank INT,
  baby_name VARCHAR(30) NOT NULL,
  baby_name_count INT,
  baby_gender VARCHAR(6)
);

-- Here is the code to write the file from the baby names .csv into the table 'usa_baby_names'.  In order to do use the below 'INFILE' command i needed to place the .csv's where MySQL has secure file priv. 
SHOW VARIABLES LIKE "secure_file_priv";
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/allBabyNamesUSA_2000s.csv' 
INTO TABLE USA_baby_names
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- The code to create the table that compares baby names to dog names
CREATE TABLE name_compare(
  name_year  VARCHAR(30) NOT NULL,
  baby_count INT,
  dog_count INT
);

-- The code to insert csv data into name_compare table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/name_comparison.csv' 
INTO TABLE name_compare
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- The code that creates the New York names table using the Google Big Query dataset
CREATE TABLE ny_baby_names(
  year  YEAR(4),
  baby_name VARCHAR(30) not null,
  name_count INT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/NY_baby_names.csv' 
INTO TABLE ny_baby_names
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from usa_baby_names;
select * from ny_baby_names;
select * from name_compare