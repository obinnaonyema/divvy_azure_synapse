create table payments(
    payment_id int,
    trip_id varchar(50),
    rider_id int,
    date_id varchar(50),
    amount DECIMAL(10,2)
)

insert into payments
select top 100 
p.payment_id,
t.trip_id,
p.rider_id, 
d.date_id,
p.amount
from payment p join trip t on p.rider_id=t.rider_id
join date d on format(cast(t.start_at as datetime2),'yyyyMMddHHmmssffff')=d.date_id;

select top 100 * from payments