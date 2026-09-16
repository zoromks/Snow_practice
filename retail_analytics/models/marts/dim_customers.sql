with customers as (
    select * from {{ ref('stg_customers') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

customer_orders as (
    select
        customer_id,
        count(order_id) as total_orders,
        sum(case when status = 'completed' then order_total else 0 end) as lifetime_value
    from orders
    group by customer_id
)

select
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.signup_date,
    c.country,
    coalesce(co.total_orders, 0) as total_orders,
    coalesce(co.lifetime_value, 0) as lifetime_value
from customers c
left join customer_orders co on c.customer_id = co.customer_id