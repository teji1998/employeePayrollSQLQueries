/*UC1*/
--Creating a database
create database Employee_Payroll_Service;
--To use a database
use Employee_Payroll_Service;

/*UC2*/
--Creating a table
CREATE TABLE Employee_Payroll (ID int identity(1,1) primary key,Name varchar(50),Salary Float,
Start_Date varchar(20));

/*UC3*/
--Inserting values into table
INSERT INTO Employee_Payroll(Name, Salary,Start_Date)
VALUES ('Sravani', '50000', '2020-12-14');
INSERT INTO Employee_Payroll(Name, Salary,Start_Date)
VALUES ('Bhagya', '60000', '2020-12-15');
INSERT INTO Employee_Payroll(Name, Salary,Start_Date)
VALUES ('Teju', '40000', '2020-04-14');
INSERT INTO Employee_Payroll(Name, Salary,Start_Date)
VALUES ('Aditya', '700000', '2020-08-23');
INSERT INTO Employee_Payroll(Name, Salary,Start_Date)
VALUES ('Zeesh', '800000', '2020-02-29');

/*UC4*/
--To retrieve all data
select * from Employee_Payroll;

	