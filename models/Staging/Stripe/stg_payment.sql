with payments as 
(
    select ID ,
           ORDERID,
           PAYMENTMETHOD,
           status,
           AMOUNT,
           CREATED,
           _BATCHED_AT 
           from raw.stripe.payment
)
select * from payments