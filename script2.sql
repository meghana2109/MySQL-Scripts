create table Employee(id int primary key, firstName varchar(50), lastName varchar(50), age int, DateOfJoining date);

Insert into Employee(id,firstName,lastName,age,DateOfJoining) values (104, "Jagan","P",30,'2022-09-21');

select * from Employee;

delete from Employee where id = 103;

select * from Employee where age>=30;

create table Account(id int, accountNumber int8, accountBalance int);

ALTER TABLE Account
ADD constraint primary key(id,accountNumber);

ALTER TABLE Account
ADD constraint foreign key(id) references Employee(id);

INSERT into Account(id,accountNumber,accountBalance) values(102,16550,8000);

select * from Account;
select * from Employee;

select * from Employee where firstName like 'M%';

select * from Account where accountBalance > 10000;

select * from Account where accountBalance < 10000 and accountBalance > 5000;

SELECT *
FROM Employee
INNER JOIN Account
ON Employee.id = Account.id;

Create Table Transactions(id int,empId int, amountCredited int,amountDebited int);

insert into Transactions(id,empId,amountCredited,amountDebited) values (100,1,2000,0);

alter table Transactions
add constraint primary key(id);

alter table Transactions
add constraint foreign key(empId) references Employee(id)

