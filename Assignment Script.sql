create database EmployeeDB;

create table Employee(id int primary key, firstName varchar(50), lastName varchar(50), age int, DateOfJoining date);

Insert into Employee(id,firstName,lastName,age,DateOfJoining) values (101, "Meghana","M",29,'2022-09-21');
Insert into Employee(id,firstName,lastName,age,DateOfJoining) values (102, "Meghana","PR",27,'2022-11-02');
Insert into Employee(id,firstName,lastName,age,DateOfJoining) values (103, "Jagan","K",29,'2022-09-21');
Insert into Employee(id,firstName,lastName,age,DateOfJoining) values (104, "Lavanya","S",31,'2022-10-15');
Insert into Employee(id,firstName,lastName,age,DateOfJoining) values (102, "Kanimozhli","S",35,'2022-12-29'); -- will throw error as primary key not met
Insert into Employee(id,firstName,lastName,age,DateOfJoining) values (105, "Likitha","P",31,'2022-10-15');

select * from Employee;

delete from Employee where id = 105;

create table Account(id int, accountNumber int8, accountBalance int);


ALTER TABLE Account
ADD constraint primary key(id,accountNumber);

ALTER TABLE Account
ADD constraint foreign key(id) references Employee(id);

INSERT into Account(id,accountNumber,accountBalance) values(107,34400,10000);

select * from Account;

delete from Employee where id = 102; -- error as foreign key constraint fails
delete from Employee where id = 105; -- no error as no child for 105 in Accounts table

ALTER TABLE Account RENAME COLUMN accountBalance TO Balance;

ALTER TABLE Employee
MODIFY COLUMN firstName varchar(100);

select * from Employee where firstName like 'J%';

select * from Account where Balance > 10000;

select * from Account where Balance < 10000 and Balance > 5000;


Create Table Transactions(id int,empId int, accountNumber int, amountCredited int,amountDebited int, dateOfTransaction date);

alter table Transactions
add constraint primary key(id);

alter table Transactions
add constraint foreign key(empId) references Employee(id);

-- drop table Transactions;

alter table Transactions
add constraint foreign key(accountNumber) references Account(accountNumber);

select * from Transactions;

insert into Transactions(id,empId,accountNumber,amountCredited,amountDebited,dateOfTransaction) values (2,101,12340,0,1200,'2022-12-30');
insert into Transactions(id,empId,accountNumber,amountCredited,amountDebited,dateOfTransaction) values (5,104,12240,0,3000,'2023-01-05');

SELECT *
FROM Employee
INNER JOIN Account
ON Employee.id = Account.id;

select * from Transactions
where dateOfTransaction = '2022-12-30';

SELECT *
FROM Employee
INNER JOIN Account
ON Employee.id = Account.id and Employee.id IN ( select empId from Transactions where dateOfTransaction > '2022-11-30' and dateOfTransaction < '2023-01-01' and empId = 101) ;


 select * from Transactions where dateOfTransaction > '2022-11-30' and dateOfTransaction < '2023-01-01' and empId = 101 ;
 
 select * 
 from Employee
 INNER JOIN Transactions
 ON Employee.id = Transactions.empId
 where dateOfTransaction > '2022-11-30' and dateOfTransaction < '2023-01-01' and empId = 101;

