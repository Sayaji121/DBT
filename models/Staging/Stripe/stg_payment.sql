with sources as
(
    select * from {{ source ('stripe','payment')}}
),

 staged as 
(
    select ID ,
           ORDERID,
           PAYMENTMETHOD,
           status,
           AMOUNT,
           CREATED,
           _BATCHED_AT 
           from sources
)
select * from staged