WITH source AS ( 
    SELECT * FROM {{ source('raw', 'orders') }} 
), 
cleaned AS ( 
    SELECT 
        order_id, 
        customer_id, 
        LOWER(status)                           AS status, 
        amount::NUMERIC(18,2)                   AS amount, 
        TRY_TO_DATE(order_date,'YYYY-MM-DD')    AS order_date 
    FROM source 
) 
SELECT * FROM cleaned 