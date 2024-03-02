CREATE TABLE DEPARTMENT(
	DNO INT,
	DNAME VARCHAR(30),
	MGR_SSN VARCHAR(10),
	MGR_START_DATE DATE,
	PRIMARY KEY(DNO)
);

INSERT INTO DEPARTMENT VALUES('&DNO','&DNAME','&MGR_SSN','&MGR_START_DATE');


SQL> INSERT INTO DEPARTMENT VALUES('&DNO','&DNAME','&MGR_SSN','&MGR_START_DATE');
Enter value for dno: 1
Enter value for dname: RESEARCH
Enter value for mgr_ssn: M2
Enter value for mgr_start_date: 25-JAN-2023
old   1: INSERT INTO DEPARTMENT VALUES('&DNO','&DNAME','&MGR_SSN','&MGR_START_DATE')
new   1: INSERT INTO DEPARTMENT VALUES('1','RESEARCH','M2','25-JAN-2023')

1 row created.

SQL> INSERT INTO DEPARTMENT VALUES('&DNO','&DNAME','&MGR_SSN','&MGR_START_DATE');
Enter value for dno: 2
Enter value for dname: AIML
Enter value for mgr_ssn: M1
Enter value for mgr_start_date: 17-JUN-2023
old   1: INSERT INTO DEPARTMENT VALUES('&DNO','&DNAME','&MGR_SSN','&MGR_START_DATE')
new   1: INSERT INTO DEPARTMENT VALUES('2','AIML','M1','17-JUN-2023')

1 row created.

SQL> INSERT INTO DEPARTMENT VALUES('&DNO','&DNAME','&MGR_SSN','&MGR_START_DATE');
Enter value for dno: 3
Enter value for dname: DESIGN
Enter value for mgr_ssn: M1
Enter value for mgr_start_date: 27-JUN-2023
old   1: INSERT INTO DEPARTMENT VALUES('&DNO','&DNAME','&MGR_SSN','&MGR_START_DATE')
new   1: INSERT INTO DEPARTMENT VALUES('3','DESIGN','M1','27-JUN-2023')

1 row created.


SQL> INSERT INTO DEPARTMENT VALUES('&DNO','&DNAME','&MGR_SSN','&MGR_START_DATE');
Enter value for dno: 4
Enter value for dname: ACCOUNTS
Enter value for mgr_ssn: 
Enter value for mgr_start_date: 25-MAR-2018
old   1: INSERT INTO DEPARTMENT VALUES('&DNO','&DNAME','&MGR_SSN','&MGR_START_DATE')
new   1: INSERT INTO DEPARTMENT VALUES('4','ACCOUNTS','','25-MAR-2018')

1 row created.



SELECT * FROM DEPARTMENT;



SQL> SELECT * FROM DEPARTMENT;

       DNO DNAME                          MGR_SSN    MGR_START
---------- ------------------------------ ---------- ---------
         1 RESEARCH                       M2         25-JAN-23
         2 AIML                           M1         17-JUN-23
         3 DESIGN                         M1         27-JUN-23
         4 ACCOUNTS                                  25-MAR-18




CREATE TABLE EMPLOYEE(
	SSN VARCHAR(10),
	NAME VARCHAR(20),
	ADDRESS VARCHAR(20),
	GENDER CHAR(6),
	SALARY DECIMAL(10,3),
	SUPER_SSN VARCHAR(10),
	DNO INT,
	PRIMARY KEY(SSN),
	FOREIGN KEY (SUPER_SSN) REFERENCES EMPLOYEE(SSN) ON DELETE CASCADE,
	FOREIGN KEY (DNO) REFERENCES DEPARTMENT(DNO) ON DELETE CASCADE
);


INSERT INTO EMPLOYEE VALUES('&SSN','&NAME','&ADDRESS','&GENDER','&SALARY','&SUPER_SSN','&DNO');


SQL> INSERT INTO EMPLOYEE VALUES('&SSN','&NAME','&ADDRESS','&GENDER','&SALARY','&SUPER_SSN','&DNO');

Enter value for ssn: E1
Enter value for name: SCOTT
Enter value for address: SAN FRANCISCO
Enter value for gender: M
Enter value for salary: 700000
Enter value for super_ssn: 
Enter value for dno: 1
old   1: INSERT INTO EMPLOYEE VALUES('&SSN','&NAME','&ADDRESS','&GENDER','&SALARY','&SUPER_SSN','&DN
new   1: INSERT INTO EMPLOYEE VALUES('E1','SCOTT','SAN FRANCISCO','M','700000','','1')

1 row created.

SQL> INSERT INTO EMPLOYEE VALUES('&SSN','&NAME','&ADDRESS','&GENDER','&SALARY','&SUPER_SSN','&DNO');

Enter value for ssn: E2
Enter value for name: LUCY
Enter value for address: NEW YORK
Enter value for gender: F
Enter value for salary: 400000
Enter value for super_ssn: 
Enter value for dno: 3
old   1: INSERT INTO EMPLOYEE VALUES('&SSN','&NAME','&ADDRESS','&GENDER','&SALARY','&SUPER_SSN','&DN
new   1: INSERT INTO EMPLOYEE VALUES('E2','LUCY','NEW YORK','F','400000','','3')

1 row created.

SQL> INSERT INTO EMPLOYEE VALUES('&SSN','&NAME','&ADDRESS','&GENDER','&SALARY','&SUPER_SSN','&DNO');

Enter value for ssn: E3
Enter value for name: JAMES
Enter value for address: AUSTRALIA
Enter value for gender: M
Enter value for salary: 1000000
Enter value for super_ssn: 
Enter value for dno: 2
old   1: INSERT INTO EMPLOYEE VALUES('&SSN','&NAME','&ADDRESS','&GENDER','&SALARY','&SUPER_SSN','&DN
new   1: INSERT INTO EMPLOYEE VALUES('E3','JAMES','AUSTRALIA','M','1000000','','2')

1 row created.

SQL> INSERT INTO EMPLOYEE VALUES('&SSN','&NAME','&ADDRESS','&GENDER','&SALARY','&SUPER_SSN','&DNO');

Enter value for ssn: E4
Enter value for name: SARA
Enter value for address: DELHI
Enter value for gender: 800000
Enter value for salary: 800000
Enter value for super_ssn: 
Enter value for dno: 4
old   1: INSERT INTO EMPLOYEE VALUES('&SSN','&NAME','&ADDRESS','&GENDER','&SALARY','&SUPER_SSN','&DN
new   1: INSERT INTO EMPLOYEE VALUES('E4','SARA','DELHI','800000','800000','','4')

1 row created.

SQL> UPDATE EMPLOYEE
  2  SET GENDER = 'F'
  3  WHERE SSN = 'E4' ; 

1 row updated.


SELECT * FROM EMPLOYEE;

SQL> SELECT * FROM EMPLOYEE;

SSN        NAME                 ADDRESS              GENDER     SALARY
---------- -------------------- -------------------- ------ ----------
SUPER_SSN         DNO
---------- ----------
E1         SCOTT                SAN FRANCISCO        M          700000
                    1

E2         LUCY                 NEW YORK             F          400000
                    3

E3         JAMES                AUSTRALIA            M         1000000
                    2


SSN        NAME                 ADDRESS              GENDER     SALARY
---------- -------------------- -------------------- ------ ----------
SUPER_SSN         DNO
---------- ----------
E4         SARA                 DELHI                F          800000
                    4



CREATE TABLE DLOCATION(
	DNO INT,
	DLOC VARCHAR(20),
	PRIMARY KEY(DNO,DLOC),
	FOREIGN KEY (DNO) REFERENCES DEPARTMENT(DNO) ON DELETE CASCADE
);

CREATE TABLE PROJECT(
	PNO INT,
	PNAME VARCHAR(20),
	PLOCATION VARCHAR(20),
	DNO INT,
	PRIMARY KEY(PNO),
	FOREIGN KEY (DNO) REFERENCES DEPARTMENT(DNO) ON DELETE CASCADE
);

CREATE TABLE WORKS_ON(
	SSN VARCHAR(20),
	PNO INT,
	HOURS INT,
	PRIMARY KEY(SSN,PNO),
	FOREIGN KEY (SSN) REFERENCES EMPLOYEE(SSN) ON DELETE CASCADE,
	FOREIGN KEY (PNO) REFERENCES PROJECT(PNO) ON DELETE CASCADE
);

CREATE TABLE DEPENDENT(
	SSN VARCHAR(20),
	DEP_NAME VARCHR(20),
	GENDER CHAR(6),
	BDATE DATE,
	RELATIONSHIP CHAR(10),
	PRIMARY KEY(SSN,DEP_NAME),
	FOREIGN KEY (SSN) REFERENCES EMPLOYEE(SSN) ON DELETE CASCADE,
);

ALTER TABLE DEPARTMENT
ADD CONTSRAINT C_MSSN
FOREIGN KEY(MGR_SSN) REFERENCES EMPLOYEE ON DELETE CASCADE;

UPDATE DEPARTMENT
SET MGR_SSN = 'M2' 
WHERE DNO = 5; 

UPDATE EMPLOYEE
SET GENDER = 'F'
WHERE SSN = 'E4' ; 




SQL> SELECT * FROM DEPARTMENT;

       DNO DNAME                          MGR_SSN    MGR_START
---------- ------------------------------ ---------- ---------
         1 RESEARCH                       M2         25-JAN-23
         2 AIML                           M1         17-JUN-23
         3 DESIGN                         M1         27-JUN-23
         4 ACCOUNTS                                  25-MAR-18

SQL> UPDATE DEPARTMENT
  2  SET MGR_SSN = 'M3' 
  3  WHERE DNO = 4; 

1 row updated.

SQL>  SELECT * FROM DEPARTMENT;

       DNO DNAME                          MGR_SSN    MGR_START
---------- ------------------------------ ---------- ---------
         1 RESEARCH                       M2         25-JAN-23
         2 AIML                           M1         17-JUN-23
         3 DESIGN                         M1         27-JUN-23
         4 ACCOUNTS                       M3         25-MAR-18



SQL> INSERT INTO DEPARTMENT VALUES('&DNO','&DNAME','&MGR_SSN','&MGR_START_DATE');
Enter value for dno: 5
Enter value for dname: DEVELOPER
Enter value for mgr_ssn: 
Enter value for mgr_start_date: 25-JUL-2017
old   1: INSERT INTO DEPARTMENT VALUES('&DNO','&DNAME','&MGR_SSN','&MGR_START_DATE')
new   1: INSERT INTO DEPARTMENT VALUES('5','DEVELOPER','','25-JUL-2017')

1 row created.

SQL>  SELECT * FROM DEPARTMENT;

       DNO DNAME                          MGR_SSN    MGR_START
---------- ------------------------------ ---------- ---------
         1 RESEARCH                       M2         25-JAN-23
         2 AIML                           M1         17-JUN-23
         3 DESIGN                         M1         27-JUN-23
         4 ACCOUNTS                       M3         25-MAR-18
         5 DEVELOPER                                 25-JUL-17

SQL> UPDATE DEPARTMENT
  2  SET MGR_SSN = 'M2' 
  3  WHERE DNO = 5; 

1 row updated.

SQL> SELECT * FROM DEPARTMENT;

       DNO DNAME                          MGR_SSN    MGR_START
---------- ------------------------------ ---------- ---------
         1 RESEARCH                       M2         25-JAN-23
         2 AIML                           M1         17-JUN-23
         3 DESIGN                         M1         27-JUN-23
         4 ACCOUNTS                       M3         25-MAR-18
         5 DEVELOPER                      M2         25-JUL-17






-----------------------------------------------------------------------------------

Query 1:


Query 2:


Query 3:


Query 4:


Query 5:

heroo
