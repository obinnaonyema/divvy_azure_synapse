create table trips(
    trip_id varchar(50),
    rider_id int,
    date_id varchar(50),
    start_station_id varchar(50),
    end_station_id varchar(50),
    trip_duration_mins int,
    rider_age_ride_start int,
    rider_age_account_start int,
    bike_id int
);

insert into trips
select 
t.trip_id,
p.rider_id, 
d.date_id,
t.start_station_id, 
t.end_station_id,
datediff(minute,cast(t.start_at as datetime2),cast(t.ended_at as datetime2)) as trip_duration_mins,
datediff(year,cast(r.birthday as datetime2),cast(t.start_at as datetime2)) as rider_age_ride_start,
datediff(year,cast(r.birthday as datetime2),cast(r.account_start_date as datetime2)) as rider_age_account_start,
b.bike_id
from payment p join trip t on p.rider_id=t.rider_id
join date d on format(cast(t.start_at as datetime2),'yyyyMMddHHmmssffff')=d.date_id
join rider r on t.rider_id = r.rider_id
join bikes b on t.rideable_type=b.name;

select top 100 * from trips;