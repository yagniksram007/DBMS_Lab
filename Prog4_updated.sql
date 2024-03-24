==========================================================================================================
TABLE 1
===========================================================================================================
CREATE TABLE DEPARTMENT
(
	DNO INT,
	DNAME VARCHAR(30),
	MGR_SSN VARCHAR(10),
	MGR_START_DATE DATE,
	PRIMARY KEY(DNO)
);
----------------------------------------------------------------------------------------------------------
INSERT INTO DEPARTMENT VALUES(&DNO, '&DNAME','&MGR_SSN','&MGR_START_DATE');

----------------------------------------------------------------------------------------------------------
SELECT * FROM DEPARTMENT;

       DNO DNAME                          MGR_SSN    MGR_START
---------- ------------------------------ ---------- ---------
         1 research                                  12-JAN-20
         2 ACCOUNTS                                  10-APR-06
         3 TESTING                                   20-OCT-14
         4 HR                                        01-JAN-23
         5 DEVELOPERS                                15-FEB-18

----------------------------------------------------------------------------------------------------------
==========================================================================================================
TABLE 2
===========================================================================================================
CREATE TABLE EMPLOYEE(
	SSN VARCHAR(10),
	ENAME VARCHAR(15),
	EADDRESS VARCHAR(20),
	GENDER CHAR(3),
	SALARY DECIMAL(10,3),
	SUPER_SSN VARCHAR(10),
	DNO INT,
	PRIMARY KEY(SSN),
	FOREIGN KEY(DNO) REFERENCES DEPARTMENT(DNO) ON DELETE CASCADE,
	FOREIGN KEY(SUPER_SSN) REFERENCES EMPLOYEE(SSN) ON DELETE CASCADE
);

----------------------------------------------------------------------------------------------------------
INSERT INTO EMPLOYEE VALUES('&SSN','&ENAME','&ADDRESS','&GENDER',&SALARY,'&SUPER_SSN',&DNO);

----------------------------------------------------------------------------------------------------------
SQL> SELECT * FROM EMPLOYEE;

SSN        ENAME           EADDRESS             GEN     SALARY SUPER_SSN         DNO
---------- --------------- -------------------- --- ---------- ---------- ----------
S1         SHETTY          MANGALURU            M        70000                     5
S2         RAHUL           KANNUR               M        75000 S1                  5
S3         ADHYA           PUTTUR               F        45000 S2                  3
S4         ARJUN           DELHI                M        38715 S2                  1
S5         ANZIL           BANTWAL              M       100500 S3                  4
S6         JULIANA         MANGALURU            F        60000 S5                  2
S7         RAMESH          MUMBAI               M        40300 S3                  2
S8         SIMRAN          VITLA                F        50120 S6                  4
S9         JASON           KUWAIT               M        12000 S6                  3
S10        ELIZA           TEXAS                F        68990 S5                  1
S11        SANIYA          UDUPI                F        68250 S8                  4
S12        RAJESH          DELHI                M        65000 S8                  5
S13        PRIYA           MUMBAI               F        62000 S12                 5
S14        KARTHIK         CHENNAI              M        68000 S12                 5
----------------------------------------------------------------------------------------------------------
SQL> UPDATE EMPLOYEE SET SUPER_SSN='S8' WHERE SSN='S1';

1 row updated.

----------------------------------------------------------------------------------------------------------
SELECT * FROM EMPLOYEE;

SSN        ENAME           EADDRESS             GEN     SALARY SUPER_SSN         DNO
---------- --------------- -------------------- --- ---------- ---------- ----------
S1         SHETTY          MANGALURU            M        70000 S8                  5
S2         RAHUL           KANNUR               M        75000 S1                  5
S3         ADHYA           PUTTUR               F        45000 S2                  3
S4         ARJUN           DELHI                M        38715 S2                  1
S5         ANZIL           BANTWAL              M       100500 S3                  4
S6         JULIANA         MANGALURU            F        60000 S5                  2
S7         RAMESH          MUMBAI               M        40300 S3                  2
S8         SIMRAN          VITLA                F        50120 S6                  4
S9         JASON           KUWAIT               M        12000 S6                  3
S10        ELIZA           TEXAS                F        68990 S5                  1
S11        SANIYA          UDUPI                F        68250 S8                  4
S12        RAJESH          DELHI                M        65000 S8                  5
S13        PRIYA           MUMBAI               F        62000 S12                 5
S14        KARTHIK         CHENNAI              M        68000 S12                 5
----------------------------------------------------------------------------------------------------------

UPDATE DEPARTMENT SET MGR_SSN='S1'WHERE DNO=5;
UPDATE DEPARTMENT SET MGR_SSN='S3'WHERE DNO=3;
UPDATE DEPARTMENT SET MGR_SSN='S4'WHERE DNO=1;
UPDATE DEPARTMENT SET MGR_SSN='S7'WHERE DNO=2;
UPDATE DEPARTMENT SET MGR_SSN='S5'WHERE DNO=4;
----------------------------------------------------------------------------------------------------------
SELECT * FROM DEPARTMENT;

       DNO DNAME                          MGR_SSN    MGR_START
---------- ------------------------------ ---------- ---------
         1 research                       S4         12-JAN-20
         2 ACCOUNTS                       S7         10-APR-06
         3 TESTING                        S3         20-OCT-14
         4 HR                             S5         01-JAN-23
         5 DEVELOPERS                     S2         15-FEB-18

----------------------------------------------------------------------------------------------------------
==========================================================================================================
TABLE 3
===========================================================================================================
CREATE TABLE DLOCATION(
	DNO INT,
	DLOC VARCHAR(20),
	PRIMARY KEY(DNO,DLOC),
	FOREIGN KEY(DNO) REFERENCES DEPARTMENT(DNO) ON DELETE CASCADE
);
----------------------------------------------------------------------------------------------------------
INSERT INTO DLOCATION VALUES(&DNO,'&DLOC');

----------------------------------------------------------------------------------------------------------
SQL> SELECT * FROM DLOCATION;

       DNO DLOC
---------- --------------------
         1 PUTTUR
         2 BANTWAL
         2 MANGALURU
         3 KASAGRGOD
         4 BAJPE
         4 SULYA
         5 MUMBAI
----------------------------------------------------------------------------------------------------------
==========================================================================================================
TABLE 4
===========================================================================================================
CREATE TABLE PROJECT(
	PNO INT,
	PNAME VARCHAR(20),
	PLOC VARCHAR(20),
	DNO INT,
	PRIMARY KEY(PNO),
	FOREIGN KEY(DNO) REFERENCES DEPARTMENT(DNO) ON DELETE CASCADE
);
----------------------------------------------------------------------------------------------------------
INSERT INTO PROJECT VALUES(&PNO,'&PNAME','&PLOCATION',&DNO);

----------------------------------------------------------------------------------------------------------
 SELECT * FROM PROJECT;

       PNO PNAME                PLOC                        DNO
---------- -------------------- -------------------- ----------
       100 DBMS                 DELHI                         3
       101 IOT                  PUTTUR                        4
       102 ML                   MANGALURU                     5
       103 SURVEY               MUMBAI                        2
       104 ANALYTICS            UDUPI                         1
       105 AI                   PUTTUR                        5

----------------------------------------------------------------------------------------------------------
==========================================================================================================
TABLE 5
===========================================================================================================

CREATE TABLE WORKS_ON
(
	SSN VARCHAR(10),
	PNO INT,
	HOURS INT,
	PRIMARY KEY(SSN,PNO),
	FOREIGN KEY(PNO) REFERENCES PROJECT(PNO) ON DELETE CASCADE,
	FOREIGN KEY(SSN) REFERENCES EMPLOYEE(SSN) ON DELETE CASCADE
);

----------------------------------------------------------------------------------------------------------
INSERT INTO WORKS_ON VALUES('&SSN', &PNO, &HOURS);

----------------------------------------------------------------------------------------------------------
SQL> SELECT * FROM WORKS_ON;

SSN               PNO      HOURS
---------- ---------- ----------
S1                101         12
S2                101         16
S3                103         15
S8                102         50
S6                105        100
S2                103         18
S11               100         25
S12               100         15
S13               101         20
S14               102         25
S12               102          0
S13               102          0
S12               105          0
S13               105          0
S14               105          0

----------------------------------------------------------------------------------------------------------
==========================================================================================================
TABLE 6
===========================================================================================================
CREATE TABLE DEPENDENT(
	SSN VARCHAR(10),
	DEP_NAME VARCHAR(20),
	GENDER CHAR(3),
	BDATE DATE,
	RELATIONSHIP CHAR(10),
	PRIMARY KEY(SSN, DEP_NAME),
	FOREIGN KEY(SSN) REFERENCES EMPLOYEE(SSN) ON DELETE CASCADE
);

----------------------------------------------------------------------------------------------------------
INSERT INTO DEPENDENT VALUES('&SSN', '&DEP_NAME', '&GENDER', '&BDATE', '&RELATIONSHIP');

----------------------------------------------------------------------------------------------------------
SSN        DEP_NAME             GEN BDATE     RELATIONSH
---------- -------------------- --- --------- ----------
S1         SHWETHA              F   01-JAN-71 MOTHER
S5         USMAN                M   12-APR-64 GRANDPA
S6         ALICE                F   22-SEP-53 SISTER
S10        ROBERT               M   17-AUG-50 FATHER

----------------------------------------------------------------------------------------------------------
ALTER TABLE DEPARTMENT ADD CONSTRAINT C_MSSN
FOREIGN KEY(MGR_SSN) REFERENCES EMPLOYEE ON DELETE CASCADE;

========================================================================
DESCRIPTION
========================================================================

SQL> DESC EMPLOYEE
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SSN                                       NOT NULL VARCHAR2(10)
 ENAME                                              VARCHAR2(15)
 EADDRESS                                           VARCHAR2(20)
 GENDER                                             CHAR(3)
 SALARY                                             NUMBER(10,3)
 SUPER_SSN                                          VARCHAR2(10)
 DNO                                                NUMBER(38)

SQL> DESC DEPARTMENT;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DNO                                       NOT NULL NUMBER(38)
 DNAME                                              VARCHAR2(30)
 MGR_SSN                                            VARCHAR2(10)
 MGR_START_DATE                                     DATE

SQL> DESC DLOCATION;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DNO                                       NOT NULL NUMBER(38)
 DLOC                                      NOT NULL VARCHAR2(20)

SQL> DESC PROJECT
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PNO                                       NOT NULL NUMBER(38)
 PNAME                                              VARCHAR2(20)
 PLOC                                               VARCHAR2(20)
 DNO                                                NUMBER(38)

SQL> DESC WORKS_ON;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SSN                                       NOT NULL VARCHAR2(10)
 PNO                                       NOT NULL NUMBER(38)
 HOURS                                              NUMBER(38)

SQL> DESC DEPENDENT;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SSN                                       NOT NULL VARCHAR2(10)
 DEP_NAME                                  NOT NULL VARCHAR2(20)
 GENDER                                             CHAR(3)
 BDATE                                              DATE
 RELATIONSHIP                                       CHAR(10)

===================================================================================
QUERIES
===================================================================================

-- 1. MAKE A LIST OF ALL THE PROJECT NUMBERS FOR PROJECTS THAT INVOLVE AN EMPLOYEE WHOSE NAME IS RAHUL EITHER AS A WORKER OR AS A MANAGER OF THE DEPARTMENT THAT CONTROLS THE PROJECT.

(
SELECT DISTINCT P.PNO 
FROM PROJECT P, EMPLOYEE E, DEPARTMENT D
WHERE E.SSN=D.MGR_SSN AND D.DNO=P.DNO AND E.ENAME='RAHUL'
)
UNION 
(
SELECT DISTINCT P.PNO 
FROM PROJECT P, EMPLOYEE E, WORKS_ON W
WHERE E.SSN=W.SSN AND P.PNO=W.PNO AND E.ENAME='RAHUL'
);

       PNO
----------
       101
       103
---------------------------------------------------------------------------------------------


-- 2. SHOW THE RESULTING SALARIES IF EVERY EMPLOYEE WORKING ON THE IOT PROJECT IS GIVEN A 10% RISE.

SELECT E.ENAME, 1.1*SALARY AS INCREASED_SALARY
FROM PROJECT P, EMPLOYEE E, WORKS_ON W
WHERE E.SSN=W.SSN AND W.PNO=P.PNO AND P.PNAME='IOT';


ENAME           INCREASED_SALARY
--------------- ----------------
SHETTY                     77000
RAHUL                      82500
PRIYA                      68200

---------------------------------------------------------------------------------------------


-- 3. FIND SUM OF SALARIES OF ALL EMPLOYTEES OF "ACCOUNTS" DEPARTMENT AS WELL AS MAX SALARY, MIUN SALARY, AVG SALARY OF THE SAME DEPARTMENT	

SELECT SUM(SALARY), MIN(SALARY), MAX(SALARY), AVG(SALARY)
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO=D.DNO AND D.DNAME='ACCOUNTS';


SUM(SALARY) MIN(SALARY) MAX(SALARY) AVG(SALARY)
----------- ----------- ----------- -----------
     100300       40300       60000       50150

---------------------------------------------------------------------------------------------

-- 4. RETRIEVE TYHE NAME ODF EACH EMPLOYEE WHO WORKS ON ALL THE PROJECTS CONTROLLED BY DEPARTNO 4 (USE NOT EXISTS OPERATOR)

SELECT E.ENAME
FROM EMPLOYEE E
WHERE NOT EXISTS
(( 
	SELECT P.PNO 
	FROM PROJECT P
	WHERE P.DNO=5
 )
 MINUS 
 (
 SELECT W.PNO 
 FROM WORKS_ON W 
 WHERE E.SSN=W.SSN
 )
);

ENAME
---------------
RAJESH
PRIYA
KARTHIK
---------------------------------------------------------------------------------------------

-- 5. CREATE A VIEW DEPART_IFO THAT GIVES DETAILS OF DEPT NAME, NO OF EMPLOYEES AND TOTAL SALARY OF EACH DEPARTMENT.

SQL> CREATE VIEW DEPART_INFO AS
  2  SELECT D.DNAME AS DEPARTMENT_NAME,
  3         COUNT(E.SSN) AS NUMBER_OF_EMPLOYEES,
  4         SUM(E.SALARY) AS TOTAL_SALARY
  5  FROM DEPARTMENT D, EMPLOYEE E
  6  WHERE D.DNO = E.DNO
  7  GROUP BY D.DNAME;

View created.

SQL> SELECT * FROM DEPART_INFO;

DEPARTMENT_NAME                NUMBER_OF_EMPLOYEES TOTAL_SALARY
------------------------------ ------------------- ------------
DEVELOPERS                                       5       340000
TESTING                                          2        57000
ACCOUNTS                                         2       100300
HR                                               3       218870
research                                         2       107705
