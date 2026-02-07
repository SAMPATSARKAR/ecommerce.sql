-- CREATE TABLE customer(
-- first_name VARCHAR(30) NOT NULL,
-- last_name VARCHAR(30) NOT NULL,
-- email VARCHAR(30) NOT NULL,
-- company VARCHAR(60) NOT NULL,
-- street VARCHAR(60) NOT NULL,
-- city VARCHAR(60) NOT NULL,
-- states CHAR(2) NOT NULL,
-- zip varchar(20) NOT NULL,
-- phone VARCHAR(20) NOT NULL,
-- birth_data DATE NULL,
-- sex CHAR(1) NOT NULL,
-- date_entered TIMESTAMP NOT NULL,
-- id SERIAL PRIMARY KEY);
-------------insertion------
-- INSERT INTO customer(first_name,last_name,email, company,
-- street,city,states,zip,phone,birth_data,sex,date_entered)
-- VALUES
--  ('christopher','nolan','ch@gmail.com','jio','st','mb',
--  'mh','100023',
--  '7009876541','1988-09-11','M',current_timestamp);
---------------------custom datatype-

-- create custom datatype using alter table

-- CREATE TYPE sex_type as enum
-- ('M','F')
------------------
ALTER TABLE customer
alter column sex TYPE sex_type using sex::sex_type;
-- select * from customer
----------------------
select * from product

-- new table 
-- create table product_type(
-- name varchar(30) not null,
-- id serial primary key
-- );
select * from product
-------------------for quantity
create table item(
 product_id INTEGER REFERENCES product(id),
 size integer NOT NULL,
 COLOR VARCHAR(30) not null,
 picture varchar(256) not null,
 price numeric(6,2) not null,
 id serial primary key
)

--------------------for quality
create table product(
 type_id INTEGER REFERENCES product_type(id),
	name varchar(20) not null,
	supplier varchar(30) not null,
	description text not null,
 	id serial primary key
 );
select * from product;
begin;
update product
set id = id-13;
commit;

-------creating sales order
CREATE TABLE sales_order(
cust_id int references customer(id),
sales_person_id int references sales_person(id),
time_order_taken timestamp not null,
purchase_order_number integer not null,
credit_card_number varchar(16) not null,
credit_card_exp_mon smallint not null,
credit_card_exp_day smallint not null,
credit_card_sec_code smallint not null,
name_on_card varchar(100) not null,
id SERIAL PRIMARY KEY);


-----creating sales_item
create table sales_ittem(
item_id int references item(id),
sales_order_id int references sales_order(id),
quantity int not null,
discopunt numeric(3,2) null default 0,
taxable boolean not null default false,
sales_tax_rate numeric(5,2) not null default 0,
id serial primary key
);
-------transaction table
create table transaction_type(
name varchar(30) not null,
id serial primary key);

----alter table name
alter table transaction_type rename to transaction;
---create index transaction id on transaction
create index transaction_id_2 on transaction(name,payment_type);
select * from transaction
alter table transaction add column payment_type varchar(30) not null;
truncate table transaction_type

insert into product_type(name) values ('Business');
insert into product_type(name) values ('Casual');
insert into product_type(name) values ('Athletics');

select * from product_type;
--------


Insert into product values
(1,'Grandview','Allen ','best shoes'),
(1,'Claskston','allen','Indian goods'),
(1,'Derby','John','Best good'),
(1,'Oakwood','Rahul','Premium leather wallet'),
(1,'Brookfield','Sneha','Organic food items'),
(2,'Riverside','Amit','Sports accessories'),
(2,'Hilltop','Neha','Handmade crafts'),
(2,'Greenfield','Rohan','Eco-friendly products'),
(3,'Maplewood','Priya','Home decor items'),
(3,'Silverline','Karan','Electronics accessories'),
(2,'Lakeside','Anita','Kitchen essentials'),
(2,'Sunset','Vikram','Fitness equipment'),
(1,'Pinecrest','Meera','Beauty and skincare products');

select * from product;
alter table sales_ittem rename to sales_item
alter table sales_item rename column discopunt to disCoupn

alter table customer alter column zip type int using zip::int
select * from customer
INSERT INTO customer
(first_name, last_name, email, company, street, city, states, zip, phone, birth_data, sex, date_entered)
VALUES
('Amit','Sharma','amit1@gmail.com','Infosys','MG Road','Bengaluru','KA','560001','9876543201','1995-04-12','M',NOW()),
('Neha','Verma','neha2@gmail.com','TCS','Park Street','Kolkata','WB','700016','9876543202','1996-06-21','F',NOW()),
('Rahul','Mehta','rahul3@gmail.com','Reliance','Link Road','Mumbai','MH','400076','9876543203','1994-01-15','M',NOW()),
('Priya','Singh','priya4@gmail.com','Wipro','Civil Lines','Delhi','DL','110054','9876543204','1997-09-03','F',NOW()),
('Karan','Patel','karan5@gmail.com','Adani','SG Highway','Ahmedabad','GJ','380015','9876543205','1993-12-30','M',NOW()),
('Anjali','Nair','anjali6@gmail.com','Infosys','Marine Drive','Kochi','KL','682020','9876543206','1998-07-11','F',NOW()),
('Rohit','Gupta','rohit7@gmail.com','Flipkart','Sector 18','Noida','UP','201301','9876543207','1995-02-17','M',NOW()),
('Sneha','Iyer','sneha8@gmail.com','Amazon','OMR Road','Chennai','TN','600097','9876543208','1996-11-09','F',NOW()),
('Vikas','Yadav','vikas9@gmail.com','Zomato','DLF Phase 3','Gurgaon','HR','122002','9876543209','1994-05-25','M',NOW()),
('Pooja','Kulkarni','pooja10@gmail.com','Infosys','FC Road','Pune','MH','411004','9876543210','1997-08-14','F',NOW()),

('Arjun','Reddy','arjun11@gmail.com','Microsoft','Hitech City','Hyderabad','TS','500081','9876543211','1993-03-02','M',NOW()),
('Kavya','Menon','kavya12@gmail.com','Google','Indiranagar','Bengaluru','KA','560038','9876543212','1998-10-19','F',NOW()),
('Suresh','Kumar','suresh13@gmail.com','HCL','Mount Road','Chennai','TN','600002','9876543213','1992-01-07','M',NOW()),
('Ritu','Malhotra','ritu14@gmail.com','Deloitte','CP','Delhi','DL','110001','9876543214','1996-06-30','F',NOW()),
('Nikhil','Jain','nikhil15@gmail.com','EY','MI Road','Jaipur','RJ','302001','9876543215','1995-09-09','M',NOW()),
('Shreya','Bose','shreya16@gmail.com','KPMG','Salt Lake','Kolkata','WB','700091','9876543216','1997-12-01','F',NOW()),
('Manish','Agarwal','manish17@gmail.com','Paytm','Sector 62','Noida','UP','201309','9876543217','1993-04-18','M',NOW()),
('Isha','Khanna','isha18@gmail.com','Nykaa','Bandra','Mumbai','MH','400050','9876543218','1998-02-23','F',NOW()),
('Deepak','Chopra','deepak19@gmail.com','IBM','Electronic City','Bengaluru','KA','560100','9876543219','1991-07-27','M',NOW()),
('Riya','Saxena','riya20@gmail.com','Accenture','Alkapuri','Vadodara','GJ','390007','9876543220','1999-05-16','F',NOW()),

('Tarun','Arora','tarun21@gmail.com','Capgemini','Sector 21','Chandigarh','CH','160022','9876543221','1994-08-08','M',NOW()),
('Meenal','Joshi','meenal22@gmail.com','Infosys','Kothrud','Pune','MH','411038','9876543222','1996-03-12','F',NOW()),
('Rakesh','Bansal','rakesh23@gmail.com','L&T','Sector 44','Faridabad','HR','121003','9876543223','1990-11-29','M',NOW()),
('Aarti','Mishra','aarti24@gmail.com','Byjus','Banshankari','Bengaluru','KA','560070','9876543224','1997-01-05','F',NOW()),
('Sanjay','Pandey','sanjay25@gmail.com','Tata Steel','Bistupur','Jamshedpur','JH','831001','9876543225','1989-09-17','M',NOW()),

('User26','Test','user26@gmail.com','Company26','Street 26','City26','ST','260026','9876543226','1995-01-01','M',NOW()),
('User27','Test','user27@gmail.com','Company27','Street 27','City27','ST','270027','9876543227','1995-01-01','F',NOW()),
('User28','Test','user28@gmail.com','Company28','Street 28','City28','ST','280028','9876543228','1995-01-01','M',NOW()),
('User29','Test','user29@gmail.com','Company29','Street 29','City29','ST','290029','9876543229','1995-01-01','F',NOW()),
('User30','Test','user30@gmail.com','Company30','Street 30','City30','ST','300030','9876543230','1995-01-01','M',NOW()),

('User31','Test','user31@gmail.com','Company31','Street 31','City31','ST','310031','9876543231','1995-01-01','F',NOW()),
('User32','Test','user32@gmail.com','Company32','Street 32','City32','ST','320032','9876543232','1995-01-01','M',NOW()),
('User33','Test','user33@gmail.com','Company33','Street 33','City33','ST','330033','9876543233','1995-01-01','F',NOW()),
('User34','Test','user34@gmail.com','Company34','Street 34','City34','ST','340034','9876543234','1995-01-01','M',NOW()),
('User35','Test','user35@gmail.com','Company35','Street 35','City35','ST','350035','9876543235','1995-01-01','F',NOW()),

('User36','Test','user36@gmail.com','Company36','Street 36','City36','ST','360036','9876543236','1995-01-01','M',NOW()),
('User37','Test','user37@gmail.com','Company37','Street 37','City37','ST','370037','9876543237','1995-01-01','F',NOW()),
('User38','Test','user38@gmail.com','Company38','Street 38','City38','ST','380038','9876543238','1995-01-01','M',NOW()),
('User39','Test','user39@gmail.com','Company39','Street 39','City39','ST','390039','9876543239','1995-01-01','F',NOW()),
('User40','Test','user40@gmail.com','Company40','Street 40','City40','ST','400040','9876543240','1995-01-01','M',NOW()),

('User41','Test','user41@gmail.com','Company41','Street 41','City41','ST','410041','9876543241','1995-01-01','F',NOW()),
('User42','Test','user42@gmail.com','Company42','Street 42','City42','ST','420042','9876543242','1995-01-01','M',NOW()),
('User43','Test','user43@gmail.com','Company43','Street 43','City43','ST','430043','9876543243','1995-01-01','F',NOW()),
('User44','Test','user44@gmail.com','Company44','Street 44','City44','ST','440044','9876543244','1995-01-01','M',NOW()),
('User45','Test','user45@gmail.com','Company45','Street 45','City45','ST','450045','9876543245','1995-01-01','F',NOW()),

('User46','Test','user46@gmail.com','Company46','Street 46','City46','ST','460046','9876543246','1995-01-01','M',NOW()),
('User47','Test','user47@gmail.com','Company47','Street 47','City47','ST','470047','9876543247','1995-01-01','F',NOW()),
('User48','Test','user48@gmail.com','Company48','Street 48','City48','ST','480048','9876543248','1995-01-01','M',NOW()),
('User49','Test','user49@gmail.com','Company49','Street 49','City49','ST','490049','9876543249','1995-01-01','F',NOW()),
('User50','Test','user50@gmail.com','Company50','Street 50','City50','ST','500050','9876543250','1995-01-01','M',NOW());

alter table sales_person alter column zip type int using zip::int
INSERT INTO item (product_id, size, color, picture, price)
VALUES
(8, 8, 'Blue', 'Coming Soon', 123.27),
(7, 11, 'Red', 'Coming Soon', 130.76),
(9, 12, 'Black', 'Coming Soon', 152.98),
(11, 8, 'Blue', 'Coming Soon', 175.58),
(7, 11, 'Light Brown', 'Coming Soon', 146.83),

(4, 8, 'Green', 'Coming Soon', 159.82),
(12, 8, 'Light Brown', 'Coming Soon', 171.92),
(1, 12, 'Light Brown', 'Coming Soon', 128.77),
(2, 10, 'Gray', 'Coming Soon', 102.45),
(10, 8, 'Green', 'Coming Soon', 186.86),

(1, 8, 'Blue', 'Coming Soon', 139.73),
(9, 8, 'Light Brown', 'Coming Soon', 151.57),
(2, 10, 'Green', 'Coming Soon', 177.16),
(3, 9, 'Gray', 'Coming Soon', 124.87),
(8, 8, 'Black', 'Coming Soon', 129.40),

(5, 9, 'Black', 'Coming Soon', 107.55),
(6, 10, 'Navy', 'Coming Soon', 143.60),
(4, 11, 'Red', 'Coming Soon', 168.90),
(3, 8, 'Blue', 'Coming Soon', 119.99),
(12, 9, 'Brown', 'Coming Soon', 182.30),

(10, 10, 'Black', 'Coming Soon', 164.25),
(11, 9, 'Blue', 'Coming Soon', 158.44),
(7, 10, 'Green', 'Coming Soon', 141.10),
(6, 8, 'Gray', 'Coming Soon', 116.75),
(5, 11, 'Brown', 'Coming Soon', 173.88),

(9, 9, 'Black', 'Coming Soon', 149.60),
(2, 8, 'Blue', 'Coming Soon', 121.35),
(1, 10, 'Gray', 'Coming Soon', 134.22),
(8, 12, 'Green', 'Coming Soon', 189.95),
(4, 9, 'Red', 'Coming Soon', 155.40),

(3, 10, 'Black', 'Coming Soon', 162.18),
(12, 10, 'Brown', 'Coming Soon', 176.05),
(11, 11, 'Blue', 'Coming Soon', 181.70),
(10, 9, 'Green', 'Coming Soon', 138.66),
(6, 11, 'Navy', 'Coming Soon', 169.30),

(5, 8, 'Black', 'Coming Soon', 111.25),
(7, 9, 'Red', 'Coming Soon', 147.90),
(2, 12, 'Gray', 'Coming Soon', 158.10),
(9, 11, 'Light Brown', 'Coming Soon', 172.45),
(1, 9, 'Blue', 'Coming Soon', 126.80),

(8, 10, 'Black', 'Coming Soon', 160.55),
(4, 12, 'Green', 'Coming Soon', 184.90),
(3, 11, 'Gray', 'Coming Soon', 170.33),
(6, 9, 'Blue', 'Coming Soon', 133.48),
(12, 11, 'Brown', 'Coming Soon', 178.62),

(10, 12, 'Black', 'Coming Soon', 192.00),
(5, 10, 'Green', 'Coming Soon', 145.75),
(7, 8, 'Red', 'Coming Soon', 118.40),
(2, 9, 'Blue', 'Coming Soon', 129.95),
(9, 8, 'Tan', 'coming soon', 3199.00),
(9, 9, 'Tan', 'coming soon', 3199.00),
(9,10, 'Tan', 'coming soon', 3199.00),

(10, 6, 'Black', 'coming soon', 2599.00),
(10, 7, 'Black', 'coming soon', 2599.00),
(10, 8, 'Black', 'coming soon', 2599.00),
(10, 9, 'Black', 'coming soon', 2599.00),
(10,10, 'Black', 'coming soon', 2599.00);
select * from item;
begin;
update item
set id = id-50;
commit;