create table riders(
    rider_id int not null,
    first varchar(50) not null,
    last varchar(50) not null,
    address varchar(200) not null,
    birthday DATE not null,
    account_start_date DATETIME2 not null,
    account_end_date DATETIME2,
    is_member VARCHAR(5) not null
);

insert into riders
select 
rider_id, 
first, 
last, 
address, 
cast(birthday as datetime2) birthday,
cast(account_start_date as datetime2) account_start_date,
cast(account_end_date as datetime2) account_end_date,
is_member
 from rider;