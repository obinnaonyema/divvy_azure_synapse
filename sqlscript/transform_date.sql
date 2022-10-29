create table date (
    date_id varchar(50) not null,
    start_at datetime2 not null,
    ended_at datetime2 not null,
    year int not null,
    quarter int not null,
    month int not null,
    week int not null,
    weekday int not null,
    day int not null,
    hour int not null,
    minute int not null,
    second int not null
);

insert into date
select format(cast(start_at as datetime2),'yyyyMMddHHmmssffff') date_id,
cast(start_at as datetime2) start_at,
cast(ended_at as datetime2) ended_at,
datepart(year,cast(start_at as datetime2)) year,
datepart(quarter,cast(start_at as datetime2)) quarter,
datepart(month,cast(start_at as datetime2)) month,
datepart(week,cast(start_at as datetime2)) week,
datepart(weekday,cast(start_at as datetime2)) weekday,
datepart(day,cast(start_at as datetime2)) day,
datepart(hour,cast(start_at as datetime2)) hour,
datepart(minute,cast(start_at as datetime2)) minute,
datepart(second,cast(start_at as datetime2)) second
from trip;

