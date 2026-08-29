
create database dbt_db;

use database dbt_db;


CREATE SCHEMA IF NOT EXISTS dbt_db.raw; 
 
CREATE OR REPLACE TABLE dbt_db.raw.customers ( 
    customer_id     INTEGER, 
    name            VARCHAR, 
    email           VARCHAR, 
    country_code    VARCHAR(2), 
    created_at      TIMESTAMP, 
    is_deleted      BOOLEAN DEFAULT FALSE 
); 
 
CREATE OR REPLACE TABLE dbt_db.raw.orders ( 
    order_id        INTEGER, 
    customer_id     INTEGER, 
    status          VARCHAR, 
    amount          FLOAT, 
    order_date      VARCHAR,   -- intentionally stored as string 
    _loaded_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
); 
 -- Insert sample data 
INSERT INTO dbt_db.raw.customers VALUES 
    (1, 'Priya Sharma', 'priya@example.com', 'IN', CURRENT_TIMESTAMP, FALSE), 
    (2, 'Rahul Gupta', 'rahul@example.com', 'IN', CURRENT_TIMESTAMP, FALSE), 
    (3, 'James Smith', 'james@example.com', 'US', CURRENT_TIMESTAMP, FALSE), 
    (4, 'Wei Li', 'wei@example.com', 'SG', CURRENT_TIMESTAMP, TRUE);  -- deleted 
 
INSERT INTO dbt_db.raw.orders VALUES 
    (101, 1, 'delivered', 2500.00, '2024-01-15', CURRENT_TIMESTAMP), 
    (102, 1, 'shipped',   1200.50, '2024-02-01', CURRENT_TIMESTAMP), 
    (103, 2, 'pending',   750.00,  '2024-02-10', CURRENT_TIMESTAMP), 
    (104, 3, 'delivered', 3400.00, '2024-01-28', CURRENT_TIMESTAMP), 
    (105, 3, 'cancelled', 900.00,  '2024-03-01', CURRENT_TIMESTAMP);



    SELECT * FROM dbt_db.dev.fact_ords;