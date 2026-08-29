WITH source AS ( 
    SELECT * FROM {{ source('raw', 'customers') }} 
), 
cleaned AS ( 
    SELECT 
        customer_id, 
        INITCAP(name)           AS customer_name, 
        LOWER(email)            AS email, 
        UPPER(country_code)     AS country_code, 
        created_at 
    FROM source 
    WHERE is_deleted = FALSE 
) 
SELECT * FROM cleaned