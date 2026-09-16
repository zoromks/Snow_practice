with orders as (
    select * from {{ ref('stg_orders') }}
),

order_items as (
    select * from {{ ref('int_order_items_joined') }}
),

order_agg as (
    select
        order_id,
        sum(line_total) as calculated_total,
        sum(line_margin) as order_margin,
        count(distinct product_id) as distinct_products,
        sum(quantity) as total_units
    from order_items
    group by order_id
)

select
    o.order_id,
    o.customer_id,
    o.order_date,
    o.status,
    o.order_total,
    oa.calculated_total,
    oa.order_margin,
    oa.distinct_products,
    oa.total_units
from orders o
left join order_agg oa on o.order_id = oa.order_id