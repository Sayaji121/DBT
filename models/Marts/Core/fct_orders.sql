WITH orders as
(
 select * from    {{ ref ( 'stg_orders')}}
),

with payments as 
(

    select * from {{ ref ('stg_payment')}}
),

with orders_payment as
(
    select ORDERID,
            case (when status ='success' then payment end) as AMOUNT
    from payments
    group by 1        
),

final as 
(
select orders.ORDERID,
       orders.customer_id,
       orders.order_date,
       coalesce(orders.payment.AMOUNT,0) as amount 
       from orders 
       left join orders_payment using (ORDERID)
)

select * from final
