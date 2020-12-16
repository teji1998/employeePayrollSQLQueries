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

/*UC5*/
--To get the Salary based on the name
select Salary as Salary from Employee_Payroll where Name='Sravani';
select Salary as Salary from Employee_Payroll where Name='Bhagya';
select Salary as Salary from Employee_Payroll where Name='Teju';
select Salary as Salary from Employee_Payroll where Name='Aditya';
select Salary as Salary from Employee_Payroll where Name='Zeesh';
--To get records within a given date range
Select * from Employee_Payroll
 Where Start_Date between CAST ('2020-12-12' AS DATE) And  GETDATE();
 Select * from Employee_Payroll
 Where Start_Date between CAST ('2020-08-01' AS DATE) And  GETDATE();
 Select * from Employee_Payroll
 Where Start_Date between CAST ('2020-01-01' AS DATE) And  GETDATE();

 /*UC6*/
 --To alter existing table to add gender column
 ALTER TABLE Employee_Payroll ADD Gender varchar(10);
 --To update the gender as female
 Update Employee_Payroll
 SET Gender = 'Female' where Name = 'Sravani' or Name = 'Bhagya' or Name = 'Teju';
  --To update the gender as male
 Update Employee_Payroll
 SET Gender = 'Male' where Name = 'Aditya' or Name = 'Zeesh' ;

 /*UC7*/
 --To get sum of salary of the males
 Select SUM(Salary) as SUM_OF_SALARY From Employee_Payroll 
 where Gender = 'Male' Group by Gender;
 --To get sum of salary of the females
 Select SUM(Salary) as SUM_OF_SALARY From Employee_Payroll 
 where Gender = 'Female' Group by Gender;
 --To get average of salary of the males
 Select AVG(Salary) as AVERAGE_OF_SALARY From Employee_Payroll 
 where Gender = 'Male' Group by Gender;
 --To get average of salary of the males
 Select AVG(Salary) as AVERAGE_OF_SALARY From Employee_Payroll 
 where Gender = 'Female' Group by Gender;
 --To get minimum of salary of the males
 Select MIN(Salary) as MINIMUM_OF_SALARY From Employee_Payroll 
 where Gender = 'Male' Group by Gender;
 --To get minimum of salary of the females
 Select MIN(Salary) as MINIMUM_OF_SALARY From Employee_Payroll 
 where Gender = 'Female' Group by Gender;
 --To get maximum of salary of the males
 Select MAX(Salary) as MAXIMUM_OF_SALARY From Employee_Payroll 
 where Gender = 'Male' Group by Gender;
 --To get maximum of salary of the females
 Select MAX(Salary) as MAXIMUM_OF_SALARY From Employee_Payroll 
 where Gender = 'Female' Group by Gender;
 --To get count of the males
 Select COUNT(Name) as COUNT_BY_NAME From Employee_Payroll 
 where Gender = 'Male' Group by Gender;
 --To get count of the females
 Select COUNT(Name) as COUNT_BY_NAME From Employee_Payroll 
 where Gender = 'Female' Group by Gender;

/*UC8*/
--To add mobile number,address,department
ALTER TABLE Employee_Payroll 
ADD Mobile_number bigint ,
Address Varchar(50) not null default '-',
Department Varchar(50) not null default '-'; 
--To add values into new column 
Update Employee_Payroll
 SET Mobile_number = '8976456754', Address ='Hyderabad', Department = 'Sales' where Name = 'Sravani'; 
--Created a procedure to update the values
create procedure UpdateEmployees
(@Mobile_number bigint,@Address Varchar(50),@Department Varchar(50),@Name  varchar(50))
as
begin
Update Employee_Payroll
SET Mobile_number = @Mobile_number, Address =@Address, Department = @Department where Name = @Name; 
end;
--using update procedure to update values into the table
EXEC UpdateEmployees @Mobile_number='9920275347',@Address='Mumbai',@Department='EXTC',@Name='Teju';
EXEC UpdateEmployees @Mobile_number='8634988874',@Address='Telangana',@Department='IT',@Name='Bhagya';
EXEC UpdateEmployees @Mobile_number='9920568832',@Address='Hubli',@Department='Finance',@Name='Aditya';
EXEC UpdateEmployees @Mobile_number='7789006754',@Address='Goa',@Department='Marketing',@Name='Zeesh';
Select * from Employee_Payroll; --To get all records

/*UC9*/
--to rename a column in table
sp_rename 'Employee_Payroll.Salary','Basic_Pay','Column';
--to add columns regarding payroll info
ALTER TABLE Employee_Payroll 
Add Deductions float ,Taxable_Pay float,Income_Tax float, Net_Pay float;

/*UC10*/
--Creating table Employee
Create table Employee(
employee_id int identity(1,1) primary Key,
Name  varchar(50),
Gender char(1),
Mobile_Number varchar(10),
Address varchar(50)
)
--creating procedures 
create procedure EmployeeInfo
(
@Name varchar(50),
@Gender char(1),
@Mobile_number varchar(10),
@Address varchar(50)
)
as
begin
insert into Employee values
(
@Name,@Gender,@Mobile_number,@Address
)
end
--Inserting value into Employee
EXEC EmployeeInfo @Name='Sravani',@Gender='F',@Mobile_number='7689006789',@Address='Telangana';
EXEC EmployeeInfo @Name='Bhagya',@Gender='F',@Mobile_number='8900543789',@Address='Hyderabad';
EXEC EmployeeInfo @Name='Teju',@Gender='F',@Mobile_number='9920275347',@Address='Mumbai';
EXEC EmployeeInfo @Name='Adiii',@Gender='M',@Mobile_number='9820543126',@Address='Hubli';
EXEC EmployeeInfo @Name='Zeesh',@Gender='M',@Mobile_number='8679556700',@Address='Goa';
select * from Employee;
--Creating table department
Create table Department(
Department_Id int identity(1,1) primary Key,
Department_Name varchar(50)
);
--insering values in department
Insert into Department(Department_Name)
values('Sales'),
('IT'),
('EXTC'),
('Finance'),
('Marketing');
select * from Department
--Creating table payroll
create table Payroll(
PayRoll_Id int Identity(1,1) primary Key,
Start_Date date,
Basic_Pay float,
Deductions float,
Income_Tax float,
Taxable_Pay float,
Net_Pay float,
employee_id int not null foreign key references employee(employee_id)
--constraint Payroll_fK Foreign key(employee_id) references employee(employee_id)
);
--inserting values into Payroll
insert into Payroll(Start_Date,Basic_Pay,Deductions,Income_Tax,Taxable_Pay,Net_Pay,employee_id)
values('2019-12-31',60000,10000,1300,1000,500000,1),
('2020-11-13',700000,150000,1400,1100,550000,2),
('2020-04-14',40000,5000,900,500,350000,3),
('2018-09-03',540000,10000,9000,4500,490000,4),
('2020-02-14',700000,50000,3500,2500,600000,5);
select * from Payroll;



	