with source as (
    select * from {{ source('raw', 'raw_customers') }}
)

select
    customer_id,
    first_name,
    last_name,
    lower(email) as email,
    signup_date,
    country
from source