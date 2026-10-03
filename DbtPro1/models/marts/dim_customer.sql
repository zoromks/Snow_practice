SELECT

    CUSTOMER_ID,
    CUSTOMER_NAME,
    EMAIL,
    CITY,
    COUNTRY,
    CREATED_AT

FROM {{ ref('stg_customers') }}