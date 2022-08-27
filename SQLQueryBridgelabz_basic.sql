--UC1-Ability to create a payroll service database-------
create database payroll_service;
select name from sys.databases
use payroll_service
------comand show all databases with size and Remark----
EXEC sp_databases

---uc2-create a employee payroll table--
create table employee_payroll
(
id int identity(1,1) primary key,
name varchar(150) not null,
salary money not null,
start_date date not null
)

select* from employee_payroll
----for checking employee_payroll table created or not-----
IF EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='employee_payroll') 
   SELECT 1 AS res ELSE SELECT 0 AS res;

   ---Uc3-for inserting records ------
insert into employee_payroll values
('Bill',10000.0,'2019-01-05'),
('Terisa',23000.0,'2017-09-10'),
('Charlie',15000.0,'2018-06-15')

---uc4---for retrieve all the data from table-----
select* from employee_payroll

----uc5-selecting particular records----
----by using where clause
select salary from employee_payroll where name='Bill'
-----by using DB functions  and operator
select name from employee_payroll where start_date between '2018-01-01' and getdate()

----UC6--- alter-> is used to add, delete, or modify columns and add and drop various constraints on an existing table.
alter table employee_payroll add gender char(1)
select * from employee_payroll

update employee_payroll set gender='M' where name in ('Bill','Charlie')
update employee_payroll set gender='F' where name='Terisa'
select * from employee_payroll
-----UC7--AggregateFunctions------------------
--getting records by total salary by gender----
select gender,sum(salary) from employee_payroll group by gender
--getting records average salary by gender----
select gender,avg(salary) from employee_payroll group by gender
--getting records minimum and maximum salary by gender----
select min(salary) from employee_payroll where gender='M'
select max(salary) from employee_payroll where gender='M'

select gender,count(salary) from employee_payroll group by gender

-----UC8-----
alter table employee_payroll add
phone varchar(15),
address varchar(200) default 'India' not null,
department varchar(20) default 'CS' not null

select * from employee_payroll
--------UC9---------
alter table employee_payroll add
basic_pay money,
deduction money,
taxable_pay money,
income_tax money,
net_pay money

-------------UC10------------
update employee_payroll set department='sales' where name='Terisa'
insert into employee_payroll values
('Terisa',23000.0,'2017-09-11','F',NULL,'India','marketing',null,null,null,null,null)
