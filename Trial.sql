create table Student
(
	Name varchar(20),
	USN varchar(10),
	Age int 
);

Insert into Student values('Yagnik', '4SF21CI057', '20');
Insert into Student values('Vaishnav', '4SF21CI050', '20');
Insert into Student values('Chinmaya', '4SF21CI001', '22');
Insert into Student values('Nikith', '4SF21CI026', '20');
Insert into Student values('Naizil', '4SF21CI025', '20');
Insert into Student values('Aditiya', '4SF21CI005', '20');

Insert into Student values('&Name', '&USN', '&Age');

Select Name, USN, Age
From Student;

Select *
From Student;

----------------------------------------------------------------------------------

#BANK
create table Bank
(
	Bank_ID varchar(10),
	Bank_Name varchar(20),
	Address varchar(30)
);

Insert into Bank values('&Bank_ID', '&Bank_Name', '&Address');

Select *
From Bank;

Select Bank_Name
From Bank;

Select DISTINCT Bank_Name
From Bank;

Update Bank
Set Address = 'Adyar'
where Bank_ID = '002';

Alter table Bank
add Pincode int;

DESC Bank

Update Bank
Set Pincode = '575004'
where Bank_ID = '001';

Delete from Bank
where Bank_ID = '003';

Update Bank
Set Pincode = '575007'
where Bank_ID = '002';

Delete from Bank;

Drop table Bank;

---------------------------------------------------------------------------

#CUSTOMER

create table Customer
(
	ACCNO varchar(10),
	CNAME varchar(20),
	CADD varchar(20),
	CBAL int NOT NULL
);


Insert into Customer values('&ACCNO', '&CNAME', '&CADD', '&CBAL');


Select *
From Customer;

---------------------------------------------------------------------------
#Queries

RETRIVE THE NAME OF THE CUTOMER HAVING ACCOUNT BALANCE 10000

Select CNAME
From Customer
where CBAL = '10000';

Select CNAME
From Customer
where CBAL = '1000';

Select CNAME
From Customer
where CBAL BETWEEN 1000 AND 40000;


RETRIEVE THE ADDRESS AND ACCOUT BALANCE OF 'RAMESH'

Select CADD, CBAL
From Customer
where CNAME = 'RAMESH';

Select CNAME, CADD
From Customer
where CBAL > 1000;



