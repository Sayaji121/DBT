with sources as 
(
    select * from {{ source ('jaffle_shop', 'customers')}}
),

staged as (

    select
        id as customer_id,
        first_name,
        last_name

    from sources

)
select * from staged