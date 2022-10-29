create table payments(
    payment_id int,
    rider_id int,
    date_id varchar(8),
    amount DECIMAL(10,2)
)

insert into payments
select
payment_id,
rider_id, 
format(cast(p.date as datetime2),'yyyyMMdd') date_id,
amount
from payment p;

select top 100 * from payments