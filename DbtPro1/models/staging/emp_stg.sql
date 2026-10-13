{{ config(materialized='incremental',
            unique_key='id'
            ) }}

select *,{{add7days('current_timestamp()')}} as loaded_at from {{source('analytics','emp')}}

{% if is_incremental() %}

where dt > (select max(dt) from {{this}})

{% endif %}


