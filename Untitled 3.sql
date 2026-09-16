-- Run as ACCOUNTADMIN
CREATE WAREHOUSE IF NOT EXISTS dbt_wh WITH WAREHOUSE_SIZE = 'XSMALL' AUTO_SUSPEND = 60 AUTO_RESUME = TRUE;

CREATE DATABASE IF NOT EXISTS retail_db;

CREATE ROLE IF NOT EXISTS dbt_role;
GRANT ROLE dbt_role TO USER mohanks;
GRANT USAGE ON WAREHOUSE dbt_wh TO ROLE dbt_role;
GRANT ALL ON DATABASE retail_db TO ROLE dbt_role;

CREATE USER IF NOT EXISTS dbt_user
  PASSWORD='Mohans@012'
  DEFAULT_ROLE = dbt_role
  DEFAULT_WAREHOUSE = dbt_wh
  DEFAULT_NAMESPACE = retail_db.raw;

GRANT ROLE dbt_role TO USER dbt_user;


show users;


SHOW EXTERNAL ACCESS INTEGRATIONS;


USE ROLE dbt_role;
USE DATABASE retail_db;

CREATE SCHEMA IF NOT EXISTS raw;

USE SCHEMA raw;

CREATE OR REPLACE TABLE raw_customers (
    customer_id INTEGER,
    first_name STRING,
    last_name STRING,
    email STRING,
    signup_date DATE,
    country STRING
);

CREATE OR REPLACE TABLE raw_orders (
    order_id INTEGER,
    customer_id INTEGER,
    order_date DATE,
    status STRING,
    order_total NUMBER(10,2)
);

CREATE OR REPLACE TABLE raw_order_items (
    order_item_id INTEGER,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    unit_price NUMBER(10,2)
);

CREATE OR REPLACE TABLE raw_products (
    product_id INTEGER,
    product_name STRING,
    category STRING,
    cost NUMBER(10,2)
);


--sample Data

INSERT INTO raw_customers VALUES
(1, 'Asha', 'Rao', 'asha.rao@email.com', '2023-01-15', 'India'),
(2, 'Liam', 'Smith', 'liam.smith@email.com', '2023-02-20', 'USA'),
(3, 'Mei', 'Chen', 'mei.chen@email.com', '2023-03-05', 'China'),
(4, 'Carlos', 'Diaz', 'carlos.diaz@email.com', '2023-04-11', 'Mexico'),
(5, 'Nora', 'Khan', 'nora.khan@email.com', '2023-05-19', 'India');

INSERT INTO raw_products VALUES
(101, 'Wireless Mouse', 'Electronics', 8.50),
(102, 'Office Chair', 'Furniture', 45.00),
(103, 'Notebook Set', 'Stationery', 2.10),
(104, 'Desk Lamp', 'Furniture', 12.00),
(105, 'Bluetooth Speaker', 'Electronics', 20.00);

INSERT INTO raw_orders VALUES
(1001, 1, '2023-06-01', 'completed', 58.50),
(1002, 2, '2023-06-03', 'completed', 45.00),
(1003, 3, '2023-06-05', 'cancelled', 0.00),
(1004, 4, '2023-06-10', 'completed', 22.10),
(1005, 5, '2023-06-12', 'completed', 32.00),
(1006, 1, '2023-07-01', 'completed', 20.00);

INSERT INTO raw_order_items VALUES
(1, 1001, 101, 2, 8.50),
(2, 1001, 103, 20, 2.05),
(3, 1002, 102, 1, 45.00),
(4, 1004, 103, 10, 2.21),
(5, 1005, 105, 1, 20.00),
(6, 1005, 104, 1, 12.00),
(7, 1006, 105, 1, 20.00);



select * from stg_customers;

models/intermediate/int_order_items_joined.sql

models/marts/dim_customers.sql

models/marts/dim_products.sql

models/marts/fct_orders.sql
models/marts/schema.yml

macros/cents_to_dollars.sql





