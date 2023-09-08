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

    select  
            orderid,
            sum (case when status = 'success' then amount end ) as amount
        from  payments 
        group by 1
),

final as 
(
    select
        orders.orderid,
        orders.customer_id,
        orders.order_date,
        coalesce(orders_payments.amount,0) as amount
        from orders 
        left join orders_payments using (orderid)
)

select * from final