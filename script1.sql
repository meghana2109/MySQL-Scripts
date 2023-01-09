create table Person(id int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)) ;
    
INSERT INTO Employee (PersonId,LastName, FirstName,Address,City) values (002,'Pawan','K','Hisar cantt','hisar');

select * from Employee;

Drop Table Employee;

select * from Employee where PersonId = 002