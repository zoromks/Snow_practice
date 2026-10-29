select * from fct_orders;


select * from raw.orders;




-- CREATE A RAW TABLE

CREATE or replace TABLE raw.employee_details (
    id INT,
    name VARCHAR(255),
    position VARCHAR(255),
    department VARCHAR(255),
    salary INT,
    received_at TIMESTAMP
);


select * from stg_emp;


-- INSERT INTO TABLE

INSERT INTO raw.employee_details (id, name, position, department, salary, received_at)
VALUES 
    (201, 'Alex Johnson', 'Marketing Specialist', 'Marketing', 62000, '2024-02-03 08:45:00'),
    (202, 'Brooke Williams', 'Sales Representative', 'Sales', 72000, '2024-02-03 09:15:00'),
    (203, 'Chris Lee', 'Software Engineer', 'Engineering', 81000, '2024-02-03 09:45:00'),
    (204, 'Dana Smith', 'HR Manager', 'Human Resources', 92000, '2024-02-03 10:30:00'),
    (205, 'Emma Brown', 'Financial Analyst', 'Finance', 76000, '2024-02-03 11:00:00'),
    (206, 'Frank White', 'Data Scientist', 'Data Science', 87000, '2024-02-03 11:30:00'),
    (207, 'Grace Miller', 'Operations Manager', 'Operations', 97000, '2024-02-03 12:15:00'),
    (208, 'Harry Davis', 'UX/UI Designer', 'Design', 72000, '2024-02-03 12:45:00'),
    (209, 'Isabel Taylor', 'Customer Support Rep', 'Support', 56000, '2024-02-03 13:30:00'),
    (210, 'Jack Anderson', 'Product Manager', 'Product', 91000, '2024-02-03 14:00:00');


select * from raw.employee_details;

select * from stg_emp;


insert into stg_emp select * from raw.employee_details;

delete from stg_emp;

delete from raw.employee_details where id in (213,214);

-- INSERT TWO NEW ROWS


INSERT INTO raw.employee_details (id, name, position, department, salary, received_at)
VALUES 
    (211, 'Alex Johnson', 'Marketing Specialist', 'Marketing', 62000, '2024-02-04 08:45:00'),
    (212, 'Brooke Williams', 'Sales Representative', 'Sales', 72000, '2024-02-05 09:15:00');


INSERT INTO raw.employee_details (id, name, position, department, salary, received_at)
VALUES 
    (216, 'ohnson', 'Marketing Specialist', 'Marketing', 62000, '2024-02-04 08:50:00'),
    (217, 'Brooke Williams', 'Sales Representative', 'Sales', 72000, '2024-02-05 09:45:00');




--HOW TO DO UPDATES

INSERT INTO raw.employee_details (id, name, position, department, salary, received_at)
VALUES 
    (201, 'Alex Johnson', 'Senior Marketing Specialist', 'Marketing', 62000, '2024-02-06 08:45:00'),
    (202, 'Brooke Williams', 'Senior Sales Representative', 'Sales', 72000, '2024-02-07 09:15:00');

select * from DBT_TUTORIAL.STAGING.STG__EMPLOYEE_DETAILS

truncate table raw.employee_details; 

select * from raw.employee_details order by id;




create table emp(id int,
nam varchar(10),
dt timestamp,
upd timestamp
);

select * from emp;

insert into emp values(1,'mk',current_timestamp,null);

insert into emp values(2,'sd',current_timestamp,null);
insert into emp values(3,'as',current_timestamp,null);
insert into emp values(4,'sdf',current_timestamp,null);

insert into emp values(5,'ase',current_timestamp,null);
insert into emp values(6,'qwert',current_timestamp,null);



select * from emp_stg; --2026-10-04 23:48:34.245 -0700

select * from analytics.emp;

select * from emp_snap;

select * from emp;

delete from emp where id in (5,6);

update emp set nam='amk' where id=3;


select * from emp_stg;

create database fivetran_db;
