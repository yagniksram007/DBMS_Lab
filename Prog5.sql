CREATE TABLE AIRCRAFT (
AID INT,
ANAME VARCHAR(15),
CRUISINGRANGE INT,
PRIMARY KEY (AID));

CREATE TABLE FLIGHTS (
FLIGHT_NUM INT,
SOURCE VARCHAR(15),
DESTINATION VARCHAR(15),
DISTANCE INT,
DEPARTS VARCHAR(05),
ARRIVES VARCHAR(05),
PRICES INT,
PRIMARY KEY(FLIGHT_NUM),
FOREIGN KEY (FLIGHT_NUM) REFERENCES AIRCRAFT(AID) ON DELETE
CASCADE);

CREATE TABLE EMPLOYEES(
EMP_ID VARCHAR(10),
ENAME VARCHAR(15),
SALARY INT,
PRIMARY KEY (EMP_ID));

CREATE TABLE CERTIFIED(
EMP_ID VARCHAR(10),
AID INT,
PRIMARY KEY(EMP_ID,AID),
FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEES(EMP_ID) ON DELETE
CASCADE,
FOREIGN KEY (AID) REFERENCES AIRCRAFT(AID) ON DELETE CASCADE);

INSERT INTO AIRCRAFT VALUES(&AID,'&ANAME',&CRUISINGRANGE);

INSERT INTO FLIGHTS VALUES(&FLIGHT_NUM,'&SOURCE','&DESTINATION',&DISTANCE,'&DEPARTS','&ARRIVES',&PRICE)

INSERT INTO EMPLOYEES VALUES('&EID','&ENAME',&SALARY);

INSERT INTO CERTIFIED VALUES('&EMP_ID',&AID);



       AID ANAME           CRUISINGRANGE
---------- --------------- -------------
         1 AIR INDIA                5000
         2 JET AIRWAYS              4800
         3 EMIRATES FLY             3500
         4 INDIGO                   1800
         5 SPICE JET                2800


FLIGHT_NUM SOURCE          DESTINATION       DISTANCE DEPAR ARRIV     PRICES
---------- --------------- --------------- ---------- ----- ----- ----------
         1 MANGALURU       LONDON                4600 12:00 8:00      150000
         2 BENGALURU       MUMBAI                1000 1:00  5:30       45000
         5 NEW DELHI       MUMBAI                1500 11:30 19:00      48000
         3 BENGALURU       NEW DELHI              900 10:00 12:00      15400
         4 KOCHI           PANAJI                 500 6:30  8:25       10000


EMP_ID     ENAME               SALARY
---------- --------------- ----------
E1         ANZIL               170000
E2         SRUJAN RAI          135000
E3         RAHIL                18000
E4         SHETTY               58000
E5         RAKSHITH             68000
E6         NIKITH               98000

EMP_ID            AID
---------- ----------
E1                  1
E1                  2
E2                  2
E3                  1
E3                  3
E4                  1
E4                  2
E4                  3
E5                  1
E5                  4
E3                  4

=====================================================

-- Query 1: Find the names of aircraft such that all pilots certified to operate them have salaries more than Rs.80, 000.
SELECT ANAME
FROM AIRCRAFT A, CERTIFIED C, EMPLOYEES E
WHERE A.AID=C.AID AND C. EMP_ID =E. EMP_ID AND E.SALARY >80000;

ANAME
-------------
AIR INDIA
JET AIRWAYS
JET AIRWAYS

-- Query 2:  For each pilot who is certified for more than three aircrafts, find the emp_id and the maximum cruising range of the aircraft for which she or he is certified.
SELECT C. EMP_ID, MAX(A.CRUISINGRANGE)
FROM AIRCRAFT A, CERTIFIED C
WHERE A.AID=C.AID
GROUP BY EMP_ID HAVING COUNT(A.AID)>3;

EMP_ID     MAX(A.CRUISINGRANGE)
---------- --------------------
E4                         5000


-- Query 3:  Find the names of pilots whose salary is less than the price of the cheapest route from Bengaluru to Mumbai.
SELECT DISTINCT ENAME 
FROM EMPLOYEES E, CERTIFIED C, AIRCRAFT A,FLIGHTS F
WHERE E.EMP_ID =C.EMP_ID AND C.AID=A.AID AND A.AID=F. FLIGHT_NUM
AND E.SALARY < ( SELECT MIN(PRICES)
FROM FLIGHTS
WHERE SOURCE='BENGALURU' AND DESTINATION=
'MUMBAI');

ENAME
---------------
RAHIL


--Query 4: Find the aids of all aircraft that can be used on routes from Bengaluru to New Delhi

SELECT A. AID
FROM AIRCRAFT A , FLIGHTS F
WHERE A.AID=F.FLIGHT_NUM AND F.SOURCE='BENGALURU' AND
F.DESTINATION= 'NEW DELHI';

EMP_ID     MAX(A.CRUISINGRANGE)
---------- --------------------
E4                         5000



--Query 5: Find the employee name and salary earning second highest salary.

SELECT ENAME, SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY)
               FROM EMPLOYEES
               WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES));

ENAME               SALARY
--------------- ----------
SRUJAN RAI          135000

