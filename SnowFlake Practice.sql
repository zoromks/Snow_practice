--dynamic tables:

select * from DBT_RETAIL.RAW.CUSTOMERS;

update DBT_RETAIL.RAW.CUSTOMERS set city='VSP' where customer_id=1;



create or replace dynamic table cust_dyn
target_lag='1 minute'
warehouse ='COMPUTE_WH'
as
select * from DBT_RETAIL.RAW.CUSTOMERS;


select * from cust_dyn;

alter dynamic table cust_dyn refresh;

select * from snowflake.account_usage.dynamic_table_refresh_history;

--materialized view

create materialized view cust_ord_mv as --Invalid materialized view definition. More than one table referenced in the view definition
select * from DBT_RETAIL.RAW.CUSTOMERS a
left join dbt_retail.raw.orders b on a.customer_id=b.customer_id;


create materialized view cust_mv as 
select * from DBT_RETAIL.RAW.CUSTOMERS;

select * from cust_mv;


--task

create or replace task cust_task
warehouse ='COMPUTE_WH'
schedule ='using cron * * * * * utc'
as
create or replace table a(id int);


select * from a;


select * from snowflake.account_usage.tas


