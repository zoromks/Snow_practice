{{ config(materialized='table') }} 
 
SELECT 
    o.order_id, 
    o.status, 
    o.amount, 
    o.order_date, 
    c.customer_name, 
    c.email, 
    c.country_code 
FROM {{ ref('stg_orders') }} o 
JOIN {{ ref('stg_cust') }} c 
    ON o.customer_id = c.customer_id