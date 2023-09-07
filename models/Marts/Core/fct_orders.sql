with orders as 
(
    select * from {{ ref ('stg_orders') }}

),

payments as 
(
    select * from {{ ref ('stg_payment') }}
),

orders_payments as
(

    select  orders.order_id,
            orders.customer_id,
            payments.AMOUNT
        from orders  inner join  payments 
        on orders.order_id = payments .id 
)

select * from orders_payments