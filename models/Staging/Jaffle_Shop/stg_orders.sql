with orders as (

    select
        id as orderid,
        user_id as customer_id,
        order_date,
        status

    from raw.jaffle_shop.orders

)
SELECT * FROM orders