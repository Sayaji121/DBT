with orders as
(
 select * from    {{ ref ( 'stg_orders')}}
),

 payments as 
(

    select * from {{ ref ('stg_payment')}}
),

 orders_payment as
(
    select ORDERID,
            sum (case when status ='success' then amount end) as AMOUNT
    from payments
    group by 1        
),

final as 
(
select orders.ORDERID,
       orders.customer_id,
       orders.order_date,
       coalesce(orders_payment.AMOUNT,0) as amount 
       from orders 
       left join orders_payment using (ORDERID)
)

select * from final
