with payments as 
(
    select ID ,
           ORDERID,
           PAYMENTMETHOD,
           AMOUNT,
           CREATED,
           _BATCHED_AT 
           from raw.stripe.payment
)
select * from payments