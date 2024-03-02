------------Bank Details------------


create table Branch(
Branch_id varchar(10),
Branch_name varchar(15),
Bank_name varchar(15),
Assets int not NULL,
Primary key (Branch_id)
);

Insert into Branch values('&Branch_id', '&Branch_name', '&Bank_name', '&Assets');
Insert into Branch values();

Select *
From Branch;



SQL> Select * from Branch;

BRANCH_ID  BRANCH_NAME     BANK_NAME           ASSETS
---------- --------------- --------------- ----------
B1         Bejai           SBI                1000000
B2         Adyar           Canara              100000
B3         Mangaluru       SBI                3000000
B4         Statebank       HDFC               4000000





Delete from Branch;
Drop table Branch;


create table Customer(
Customer_id varchar(10),
Customer_name varchar(20),
Customer_age int,
Customer_address varchar(20),
Customer_phno int,
Primary key (Customer_id)
);


Insert into Customer values('&Customer_id', '&Customer_name', '&Customer_age', '&Customer_address', '&Customer_phno');


Select *
From Customer;


SQL> Select *
  2  From Customer;

CUSTOMER_I CUSTOMER_NAME        CUSTOMER_AGE CUSTOMER_ADDRESS     CUSTOMER_PHNO
---------- -------------------- ------------ -------------------- -------------
C1         Naizil                         20 Upinangadi              9374631274
C2         Chinmaya                       22 Bejai                   7865748329
C3         Megha                          23 Kadri                   9374562819





create table Account(
Accno varchar(10) ,
Branch_id varchar(10),
Account_type varchar(10),
Account_Balance int,
Customer_id varchar(10),
Primary key (Accno),
Foreign key (Branch_id) references Branch(Branch_id) on delete cascade,
Foreign key (Customer_id) references Customer(Customer_id) on delete cascade
);


Insert into Account values('A1','B2', 'Savings', '10000', 'C1');
Insert into Account values('&Accno','&Branch_id', '&Account_type', '&Account_Balance', '&Customer_id');





Select *
From Account;


ACCNO      BRANCH_ID  ACCOUNT_TY ACCOUNT_BALANCE CUSTOMER_I
---------- ---------- ---------- --------------- ----------
A1         B2         Savings              10000 C1
A2         B3         Current              20000 C3




create table Loan(
Loan_number varchar(10),
Branch_id varchar(10),
Amount int,
Customer_id varchar(10),
Primary key (Loan_number),
Foreign key (Branch_id) references Branch(Branch_id) on delete cascade,
Foreign key (Customer_id) references Customer(Customer_id) on delete cascade
);



Insert into Loan values('L1','B2', '520000', 'C1');
Insert into Loan values('&Loan_number','&Branch_id', '&Amount', '&Customer_id');

Select * From Loan;


LOAN_NUMBE BRANCH_ID      AMOUNT CUSTOMER_I
---------- ---------- ---------- ----------
L1         B2             520000 C1
l1         B2             800000 C2



----------------------------------------------------------

-- To solve the sub questions

-- a) Find all the customers who have atleast one account at the "Mangaluru" branch
SELECT C.CUSTOMER_ID, C.CUSTOMER_NAME
FROM CUSTOMER C, ACCOUNT A, BRANCH B
WHERE B.BRANCH_ID = A.BRANCH_ID AND A.CUSTOMER_ID = C.CUSTOMER_ID AND B.BRANCH_NAME = 'Mangaluru';

-- b) Find names of the depositors who have deposited highest amount among all the customers
SELECT C.CUSTOMER_ID, C.CUSTOMER_NAME, ACCOUNT_BALANCE
FROM CUSTOMER C, ACCOUNT A
WHERE C.CUSTOMER_ID = A.CUSTOMER_ID AND ACCOUNT_BALANCE = (SELECT MAX(ACCOUNT_BALANCE) FROM ACCOUNT);

-- c) Retrieve the customer name and loan amount of a customer who borrowed a loan of more than 5,00,000
SELECT CUSTOMER_NAME, AMOUNT
FROM CUSTOMER C, LOAN L
WHERE C.CUSTOMER_ID = L.CUSTOMER_ID AND L.AMOUNT > 500000;

-- d) Retrieve the bank details of bank branch with maximum assets and minimum assets
(SELECT BANK_NAME, BRANCH_NAME, ASSETS
FROM BRANCH
WHERE ASSETS = (SELECT MAX(ASSETS) FROM BRANCH))
UNION
(SELECT BANK_NAME, BRANCH_NAME, ASSETS
FROM BRANCH
WHERE ASSETS = (SELECT MIN(ASSETS) FROM BRANCH));

-- e) Demonstrate how you delete all account tuples at every branch located in a specific city
DELETE FROM BRANCH WHERE BRANCH_NAME = 'Delhi';

-- ! NOTE: Before deleting, display the contents to be deleted for confirmation