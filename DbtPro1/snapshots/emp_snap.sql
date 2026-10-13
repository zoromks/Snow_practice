{% snapshot emp_snap %}

{{
    config(
        target_schema='analytics',
        unique_key='id',
        strategy='check',
        check_cols=['nam']
    )
}}

select
*
from {{ source('analytics', 'emp') }}

{% endsnapshot %}