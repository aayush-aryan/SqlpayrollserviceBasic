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

  
   

   