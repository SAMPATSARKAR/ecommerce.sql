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
---------------------


-- create custom datatype using alter table

-- CREATE TYPE sex_type as enum
-- ('M','F')
ALTER TABLE customer
alter column sex TYPE sex_type using sex::sex_type;
-- select * from customer
----------------------


-- new table 
-- create table product_type(
-- name varchar(30) not null,
-- id serial primary key
-- );
-- select * from customer
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
(1,'Grandview','Allen ',"best shoes"),
()