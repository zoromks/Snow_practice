SELECT
    PRODUCT_ID,
    PRODUCT_NAME,
    CATEGORY,
    PRICE

FROM {{ source('raw', 'products') }}