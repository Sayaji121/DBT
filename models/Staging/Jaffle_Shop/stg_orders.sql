with sources as 
(
     select * from {{ source ('jaffle_shop','orders')}}
),

 staged as (

    select
        id as orderid,
        user_id as customer_id,
        order_date,
        status

    from sources

)
SELECT * FROM staged