CREATE DATABASE COUNTRY_FIELD;
 
 USE COUNTRY_FIELD;
 
 CREATE TABLE COUNTRY
 (COUNTRY_ID INT PRIMARY KEY ,
 COUNTRY_NAME VARCHAR(30) ,
 POPULATION  DECIMAL(30), 
 AREA VARCHAR (30)
 );
 
 SELECT * FROM COUNTRY;
 INSERT INTO COUNTRY (COUNTRY_ID,COUNTRY_NAME,POPULATION,AREA) VALUES
 
 (1 ,'India' ,500000 , 2973190),
 (2 ,'China' ,400000 , 9388211),
 (3 ,'USA',450000 , 9147420),
 (4 ,'UK' ,350000 , 770880),
 (5 ,'Nigeria' ,250000 , 910770),
 (6 ,'Brazil' ,250000 , 8358140),
 (7 ,'Canada' ,3550000 , 16376870),
 (8 ,'Australia' ,450900 ,1000000),
 (9 ,'Mexico' ,239000 , 1943950),
 (10 ,'Philippines' ,270000 , 298170); 
 
 SELECT * FROM COUNTRY;
 
 
 CREATE TABLE PERSONS (PERSON_ID INT PRIMARY KEY NOT NULL,
 F_NAME VARCHAR (30)
 ,L_NAME VARCHAR(30)
 ,POPULATION DECIMAL(30)
 ,RATING DECIMAL(3,1)
 ,COUNTRY_ID DECIMAL (30)
 , COUNTRY_NAME VARCHAR(30)
 );
 SELECT * FROM PERSONS;
 
 INSERT INTO PERSONS (PERSON_ID,F_NAME,L_NAME,POPULATION,RATING,COUNTRY_ID,COUNTRY_NAME) VALUES
 
 (30,'Linto' ,'Jhon' , 500000 ,2.0 , 1 ,'India'),
 (29, 'Mirchel' ,'Khan' ,400000 ,1.0 , 2 ,null),
 (28, 'Mubarak' ,'Sidhik',450000 ,1.6 , 3 ,'UK'),
(27, 'Siraj' ,'Sahid' ,350000 ,2.7 , 4 , 'USA'),
(26, 'Rhul' ,'Menon' , 250000 ,1.6 , 5 ,'Nigeria'),
(25, 'Namitha' ,'Premodh' ,250000 ,6.5 ,6 ,'Brazil'),
(24, 'Vidhu'  ,'Predhavan' ,355000 ,4.6 , 7 ,null),
(23, 'Nikhil' , 'Sanker' , 450900 ,3.9 , 8 ,'Canada'),
(22, 'Virat' ,'Kholi' , 230900 ,1.4 ,  9 ,null),
(21, 'Rohit' ,'Sharma' ,270000 ,5.9 , 10 , 'Philippines');
select * from COUNTRY;
select * from PERSONS;



alter table PERSONS add DOB date;

update PERSONS set DOB = '1985-06-15' where PERSON_ID = 21;
update PERSONS set DOB = '1990-12-05' where PERSON_ID = 22;
update PERSONS set DOB = '1989-06-25' where PERSON_ID = 23;
update PERSONS set DOB = '1975-09-15' where PERSON_ID = 24;
update PERSONS set DOB = '2000-06-30' where PERSON_ID = 25;
update PERSONS set DOB= '1997-11-25' where PERSON_ID = 26;
update PERSONS set DOB = '1986-06-14' where PERSON_ID = 27;
update PERSONS set DOB = '1995-10-05' where PERSON_ID = 28;
update PERSONS set DOB= '1985-05-19' where PERSON_ID = 29;
update PERSONS set DOB = '1974-08-12' where PERSON_ID = 30;

 #(1). Find the number of persons in each country.
select COUNTRY_NAME, count(*) as num_persons from PERSONS group by COUNTRY_NAME;

 #(2) Find the number of persons in each country sorted from high to low.
select COUNTRY_NAME, count(*) as num_persons from PERSONS group by COUNTRY_NAME order by num_persons desc;

#(3) Find out an average rating for Persons in respective countries if the average is greater than 3.0
select COUNTRY_NAME, avg(rating) as avg_rating from PERSONS group by COUNTRY_NAME having avg(rating)>3.0;

#(4) Find the countries with the same rating as the USA. (Use Subqueries)
select distinct COUNTRY_NAME from PERSONS where rating in( select rating from PERSONS where COUNTRY_NAME ='USA');

#(5)Select all countries whose population is greater than the average population of all nations.
select COUNTRY_NAME from COUNTRY where POPULATION> (select avg(population) from COUNTRY);

#PART 2

create database product;

use product;

create table customer(customer_id int primary key, f_name varchar(20),l_name varchar(20), email varchar(30), phone_no varchar(20),
address varchar(20), city varchar(20), state varchar(20), zip_code varchar(20), country varchar(20));

insert into customer(customer_id, f_name ,l_name, email, phone_no, address, city, state , zip_code, country) values 

(1, 'Prince', 'Doe', 'Prince.doe@example.com', '123-456-7890', '126 Elm St', 'Springfield', 'IL', '62721', 'USA'),
(2, 'Joel', 'Smith', 'joel.smith@example.com', '234-567-8901', '457 Oak St', 'Chicago', 'IL', '60604', 'USA'),
(3, 'Emily', 'James', 'emily.james@example.com', '345-678-9012', '589 Pine St', 'Austin', 'TX', '74301', 'USA'),
(4, 'Michael', 'John', 'michael.john@example.com', '456-789-0123', '301 Maple St', 'San Francisco', 'CA', '64105', 'USA'),
(5, 'Malvia', 'Taylor', 'Malvia.taylor@example.com', '567-890-1234', '402 Birch St', 'Seattle', 'WA', '98101', 'USA'),
(6, 'Sophia', 'Lee', 'sophia.lee@example.com', '678-901-2345', '306 Cedar St', 'New York', 'NY', '10001', 'USA'),
(7, 'Liam', 'Wilson', 'liam.wilson@example.com', '789-012-3456', '704 Fir St', 'Los Angeles', 'CA', '90001', 'USA'),
(8, 'Diana', 'Johnson', 'diana.johnson@example.com', '890-123-4567', '805 Spruce St', 'Miami', 'FL', '33101', 'USA'),
(9, 'Isabella', 'Linson', 'isabella.linson@example.com', '901-234-5678', '906 Pine St', 'Denver', 'CO', '80201', 'USA'),
(10, 'Ethan', 'Martinez', 'ethan.martinez@example.com', '012-345-6789', '777 Oak St', 'Boston', 'MA', '02101', 'USA');

SELECT * from customer;
alter table customer modify email varchar(100);



#(1)Create a view named customer_info for the Customer table that displays Customer’s Full name and email address.
# Then perform the SELECT operation for the customer_info view?
create view customer_info as select concat('f_name',' ','l_name') as fullname,email from customer;
select * from customer_info; 


 #(2) Create a view named US_Customers that displays customers located in the US?
create view us_customers as select * from customer where COUNTRY ='USA';
select * from us_customers;


 #(3) Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state?
create view customer_details as select concat('fname',' ','lname') as full_name, email,phone_no,state from customer;
select * from customer_details;


#(4)Update phone numbers of customers who live in California for Customer_details view?
update customer set phone_no = '156-8984' where state='CA';
select * from customer;
#set sql_safe_updates = 0;
#set sql_safe_updates = 1;


 #(5) Count the number of customers in each state and show only states with more than 5 customers
select state, count(*) as cust_count from customer group by STATE having count(*)>5;


#(6) Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view
select state , count(*) as num_cust from customer_details group by state;


#(7) Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
select * from customer_details order by state asc; 


























