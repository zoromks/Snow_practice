
{{
    config(
    materialized='incremental',
    unique_key='id'
    ) 
}}


SELECT
    id ,
    name,
    position ,
    department ,
    salary ,
    received_at 

FROM {{ source('raw', 'employee_details') }}


{% if is_incremental() %}

where received_at> (select max(received_at) from {{this}})

{% endif %}