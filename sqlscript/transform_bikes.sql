
create table bikes(
    bike_id int IDENTITY(1,1) not null,
    name varchar(50)
);

insert into bikes
select distinct rideable_type from trip;

select * from bikes;