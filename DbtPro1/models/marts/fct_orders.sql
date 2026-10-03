SELECT

    o.ORDER_ID,
    o.CUSTOMER_ID,
    o.PRODUCT_ID,
    o.ORDER_DATE,
    o.QUANTITY,

    p.PRODUCT_NAME,
    p.CATEGORY,
    p.PRICE,

    o.QUANTITY * p.PRICE AS TOTAL_AMOUNT

FROM {{ ref('stg_orders') }} o

LEFT JOIN {{ ref('stg_products') }} p
    ON o.PRODUCT_ID = p.PRODUCT_ID