/*UC1*/
--Creating a database
create database Employee_Payroll_Service;
--To use a database
use Employee_Payroll_Service;

/*UC2*/
--Creating a table
CREATE TABLE Employee_Payroll (
    ID int identity(1,1) primary key,
    Name varchar(50),
    Salary Float,
    Start_Date varchar(20));