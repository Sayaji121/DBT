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
        from orders  inner join  payments using (id)
)

select * from orders_payments