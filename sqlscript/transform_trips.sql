create table trips(
    trip_id varchar(50),
    rider_id int,
    date_id varchar(50),
    start_at datetime2,
    ended_at datetime2,
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
t.rider_id, 
format(cast(t.start_at as datetime2),'yyyyMMdd') date_id,
start_at,
ended_at,
t.start_station_id, 
t.end_station_id,
datediff(minute,cast(t.start_at as datetime2),cast(t.ended_at as datetime2)) as trip_duration_mins,
(DATEDIFF(year, r.birthday,
    CONVERT(Datetime, SUBSTRING([start_at], 1, 19),120)) - (
        CASE WHEN MONTH(r.birthday) > MONTH(CONVERT(Datetime, SUBSTRING([start_at], 1, 19),120))
        OR MONTH(r.birthday) =
            MONTH(CONVERT(Datetime, SUBSTRING([start_at], 1, 19),120))
        AND DAY(r.birthday) >
            DAY(CONVERT(Datetime, SUBSTRING([start_at], 1, 19),120))
        THEN 1 ELSE 0 END
    )) as rider_age_ride_start,
(DATEDIFF(year, r.birthday,
    CONVERT(Datetime, SUBSTRING([account_start_date], 1, 19),120)) - (
        CASE WHEN MONTH(r.birthday) > MONTH(CONVERT(Datetime, SUBSTRING([account_start_date], 1, 19),120))
        OR MONTH(r.birthday) =
            MONTH(CONVERT(Datetime, SUBSTRING([account_start_date], 1, 19),120))
        AND DAY(r.birthday) >
            DAY(CONVERT(Datetime, SUBSTRING([account_start_date], 1, 19),120))
        THEN 1 ELSE 0 END
    )) rider_age_account_start,
b.bike_id
from trip t 
join date d on format(cast(t.start_at as datetime2),'yyyyMMdd')=d.date_id
join rider r on t.rider_id = r.rider_id
join bikes b on t.rideable_type=b.name;

select top 100 * from trips;