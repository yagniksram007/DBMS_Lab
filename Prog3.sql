CREATE TABLE STUDENTS(
	USN VARCHAR(20), 
	SNAME CHAR(15), 
	ADDRESS VARCHAR(20), 
	PHONE NUMBER(10), 
	GENDER CHAR(6),
	PRIMARY KEY(USN)
);

INSERT INTO STUDENTS VALUES('&USN','&SNAME','&ADDRESS','&PHONE','&GENDER');

SQL> INSERT INTO STUDENTS VALUES('&USN','&SNAME','&ADDRESS','&PHONE','&GENDER');
Enter value for usn: 4SF21CI057
Enter value for sname: JOHN
Enter value for address: LONDON
Enter value for phone: 9876543219
Enter value for gender: MALE
old   1: INSERT INTO STUDENTS VALUES('&USN','&SNAME','&ADDRESS','&PHONE','&GENDER')
new   1: INSERT INTO STUDENTS VALUES('4SF21CI057','JOHN','LONDON','9876543219','MALE')

1 row created.

SQL> INSERT INTO STUDENTS VALUES('&USN','&SNAME','&ADDRESS','&PHONE','&GENDER');
Enter value for usn: 4SF20CD001
Enter value for sname: ANNA
Enter value for address: USA
Enter value for phone: 4567890321
Enter value for gender: FEMALE
old   1: INSERT INTO STUDENTS VALUES('&USN','&SNAME','&ADDRESS','&PHONE','&GENDER')
new   1: INSERT INTO STUDENTS VALUES('4SF20CD001','ANNA','USA','4567890321','FEMALE')

1 row created.

SQL> INSERT INTO STUDENTS VALUES('&USN','&SNAME','&ADDRESS','&PHONE','&GENDER');
Enter value for usn: 4SF21CS007
Enter value for sname: JAMES
Enter value for address: CANADA
Enter value for phone: 7654321098
Enter value for gender: MALE
old   1: INSERT INTO STUDENTS VALUES('&USN','&SNAME','&ADDRESS','&PHONE','&GENDER')
new   1: INSERT INTO STUDENTS VALUES('4SF21CS007','JAMES','CANADA','7654321098','MALE')

1 row created.

SQL> INSERT INTO STUDENTS VALUES('&USN','&SNAME','&ADDRESS','&PHONE','&GENDER');
Enter value for usn: 4SF20IS025
Enter value for sname: RACHAEL
Enter value for address: DENMARK
Enter value for phone: 8765432109
Enter value for gender: FEMALE
old   1: INSERT INTO STUDENTS VALUES('&USN','&SNAME','&ADDRESS','&PHONE','&GENDER')
new   1: INSERT INTO STUDENTS VALUES('4SF20IS025','RACHAEL','DENMARK','8765432109','FEMALE')

1 row created.

SELECT * FROM STUDENTS;

SQL> SELECT * FROM STUDENTS;

USN                  SNAME           ADDRESS                   PHONE GENDER
-------------------- --------------- -------------------- ---------- ------
4SF21CI057           JOHN            LONDON               9876543219 MALE
4SF20CD001           ANNA            USA                  4567890321 FEMALE
4SF21CS007           JAMES           CANADA               7654321098 MALE
4SF20IS025           RACHAEL         DENMARK              8765432109 FEMALE




CREATE TABLE SEMSEC(
	SSID VARCHAR(20),
	SEM NUMBER(3),
	SEC CHAR(3),
	PRIMARY KEY(SSID)
);


INSERT INTO SEMSEC VALUES('&SSID','&SEM','&SEC');


SQL> INSERT INTO SEMSEC VALUES('&SSID','&SEM','&SEC');
Enter value for ssid: S1
Enter value for sem: 4
Enter value for sec: C
old   1: INSERT INTO SEMSEC VALUES('&SSID','&SEM','&SEC')
new   1: INSERT INTO SEMSEC VALUES('S1','4','C')

1 row created.

SQL> INSERT INTO SEMSEC VALUES('&SSID','&SEM','&SEC');
Enter value for ssid: S2
Enter value for sem: 5
Enter value for sec: A
old   1: INSERT INTO SEMSEC VALUES('&SSID','&SEM','&SEC')
new   1: INSERT INTO SEMSEC VALUES('S2','5','A')

1 row created.

SQL> INSERT INTO SEMSEC VALUES('&SSID','&SEM','&SEC');
Enter value for ssid: S3
Enter value for sem: 4
Enter value for sec: B
old   1: INSERT INTO SEMSEC VALUES('&SSID','&SEM','&SEC')
new   1: INSERT INTO SEMSEC VALUES('S3','4','B')

1 row created.

SELECT * FROM SEMSEC;

SQL> SELECT * FROM SEMSEC;

SSID                        SEM SEC
-------------------- ---------- ---
S1                            4 C
S2                            5 A
S3                            4 B





CREATE TABLE CLASS(
	USN VARCHAR(20),
	SSID VARCHAR(20),
	PRIMARY KEY(USN,SSID),
	FOREIGN KEY(USN) REFERENCES STUDENTS(USN) ON DELETE CASCADE,
	FOREIGN KEY(SSID) REFERENCES SEMSEC(SSID) ON DELETE CASCADE
);


INSERT INTO CLASS VALUES('&USN','&SSID');


SQL> INSERT INTO CLASS VALUES('&USN','&SSID');
Enter value for usn: 4SF20CD001
Enter value for ssid: S2
old   1: INSERT INTO CLASS VALUES('&USN','&SSID')
new   1: INSERT INTO CLASS VALUES('4SF20CD001','S2')

1 row created.

SQL> INSERT INTO CLASS VALUES('&USN','&SSID');
Enter value for usn: 4SF21CI057
Enter value for ssid: S1
old   1: INSERT INTO CLASS VALUES('&USN','&SSID')
new   1: INSERT INTO CLASS VALUES('4SF21CI057','S1')

1 row created.





SELECT * FROM CLASS;

SQL> SELECT * FROM CLASS;

USN                  SSID
-------------------- --------------------
4SF20CD001           S2
4SF21CI057           S1



CREATE TABLE COURSE(
	SUBCODE VARCHAR(15),
	TITLE CHAR(20),
	SEM NUMBER(3),
	CREDITS INT,
	PRIMARY KEY(SUBCODE)
 );

INSERT INTO COURSE VALUES('&SUBCODE','&TITLE','&SEM','&CREDIT');


SQL> INSERT INTO COURSE VALUES('&SUBCODE','&TITLE','&SEM','&CREDIT');
Enter value for subcode: C1
Enter value for title: DAA
Enter value for sem: 4
Enter value for credit: 4
old   1: INSERT INTO COURSE VALUES('&SUBCODE','&TITLE','&SEM','&CREDIT')
new   1: INSERT INTO COURSE VALUES('C1','DAA','4','4')

1 row created.

SQL> INSERT INTO COURSE VALUES('&SUBCODE','&TITLE','&SEM','&CREDIT');
Enter value for subcode: C2
Enter value for title: MATHS
Enter value for sem: 5
Enter value for credit: 4
old   1: INSERT INTO COURSE VALUES('&SUBCODE','&TITLE','&SEM','&CREDIT')
new   1: INSERT INTO COURSE VALUES('C2','MATHS','5','4')

1 row created.

SQL> INSERT INTO COURSE VALUES('&SUBCODE','&TITLE','&SEM','&CREDIT');
Enter value for subcode: C3
Enter value for title: DBMS
Enter value for sem: 5
Enter value for credit: 5
old   1: INSERT INTO COURSE VALUES('&SUBCODE','&TITLE','&SEM','&CREDIT')
new   1: INSERT INTO COURSE VALUES('C3','DBMS','5','5')

1 row created.


SELECT * FROM COURSE;


SUBCODE         TITLE                       SEM    CREDITS
--------------- -------------------- ---------- ----------
C1              DAA                           4          4
C2              MATHS                         5          4
C3              DBMS                          5          5


CREATE TABLE IAMARKS(
	USN VARCHAR(20),
	SUBCODE VARCHAR(15),
	SSID VARCHAR(20),	
	TEST1 NUMBER(2),
	TEST2 NUMBER(2),
	TEST3 NUMBER(2),
	FINALIA NUMBER(2),
	PRIMARY KEY(USN,SUBCODE,SSID),
	FOREIGN KEY(USN) REFERENCES STUDENTS(USN) ON DELETE CASCADE,
	FOREIGN KEY(SUBCODE) REFERENCES COURSE(SUBCODE) ON DELETE CASCADE,
	FOREIGN KEY(SSID) REFERENCES SEMSEC(SSID) ON DELETE CASCADE
);


INSERT INTO IAMARKS VALUES('&USN','&SUBCODE','&SSID','&TEST1','&TEST2','&TEST3','&FINALIA');

SQL> INSERT INTO IAMARKS VALUES('&USN','&SUBCODE','&SSID','&TEST1','&TEST2','&TEST3','&FINALIA');
Enter value for usn: 4SF20CD001
Enter value for subcode: C2
Enter value for ssid: S1
Enter value for test1: 25
Enter value for test2: 27
Enter value for test3: 28
Enter value for finalia: 26.66
old   1: INSERT INTO IAMARKS VALUES('&USN','&SUBCODE','&SSID','&TEST1','&TEST2','&TEST3','&FINALIA')
new   1: INSERT INTO IAMARKS VALUES('4SF20CD001','C2','S1','25','27','28','26.66')

1 row created.

SQL> INSERT INTO IAMARKS VALUES('&USN','&SUBCODE','&SSID','&TEST1','&TEST2','&TEST3','&FINALIA');
Enter value for usn: 4SF21CI057
Enter value for subcode: C3
Enter value for ssid: S1
Enter value for test1: 28
Enter value for test2: 29
Enter value for test3: 30
Enter value for finalia: 29
old   1: INSERT INTO IAMARKS VALUES('&USN','&SUBCODE','&SSID','&TEST1','&TEST2','&TEST3','&FINALIA')
new   1: INSERT INTO IAMARKS VALUES('4SF21CI057','C3','S1','28','29','30','29')

1 row created.

SQL> INSERT INTO IAMARKS VALUES('&USN','&SUBCODE','&SSID','&TEST1','&TEST2','&TEST3','&FINALIA');
Enter value for usn: 4SF20IS025
Enter value for subcode: C1
Enter value for ssid: S1
Enter value for test1: 24
Enter value for test2: 25
Enter value for test3: 26
Enter value for finalia: 25
old   1: INSERT INTO IAMARKS VALUES('&USN','&SUBCODE','&SSID','&TEST1','&TEST2','&TEST3','&FINALIA')
new   1: INSERT INTO IAMARKS VALUES('4SF20IS025','C1','S1','24','25','26','25')

1 row created.



SELECT * FROM IAMARKS;

SQL> SELECT * FROM IAMARKS;

USN                  SUBCODE         SSID                      TEST1      TEST2
-------------------- --------------- -------------------- ---------- ----------
     TEST3    FINALIA
---------- ----------
4SF20CD001           C2              S1                           25         27
        28         27

4SF21CI057           C3              S1                           28         29
        30         29

4SF20IS025           C1              S1                           24         25
        26         25



=============================================================

QUERY 1:

SELECT A.*, B.SEM, B.SEC
FROM STUDENTS A, SEMSEC B, CLASS C
WHERE A.USN=C.USN AND B.SSID=C.SSID AND B.SEM=4 AND B.SEC='C';

USN                  SNAME           ADDRESS                   PHONE GENDER
-------------------- --------------- -------------------- ---------- ------
       SEM SEC
---------- ---
4SF21CI057           JOHN            LONDON               9876543219 MALE
         4 C


QUERY 2:

SELECT B.SEM, B.SEC, COUNT (CASE WHEN A.GENDER = 'MALE' THEN B.SSID END) AS MALECOUNT,
COUNT(CASE WHEN A.GENDER='FEMALE' THEN B.SSID END) AS FEMALECOUNT
FROM STUDENTS A, SEMSEC B, CLASS C
WHERE A.USN=C.USN AND B.SSID=C.SSID
GROUP BY B.SEM, B.SEC;


      SEM SEC  MALECOUNT FEMALECOUNT
--------- --- ---------- -----------
        5 A            0           1
        4 C            1           0


QUERY 3:

CREATE VIEW TEST1_MARKS AS
SELECT SUBCODE, TEST1 FROM IAMARKS
WHERE USN='4SF20CD001';
SELECT * FROM TEST1_MARKS;

SQL> CREATE VIEW TEST1_MARKS AS
  2  SELECT SUBCODE, TEST1 FROM IAMARKS
  3  WHERE USN='4SF20CD001';

View created.

SQL> SELECT * FROM TEST1_MARKS;

SUBCODE              TEST1
--------------- ----------
C2                      25


QUERY 4:

UPDATE IAMARKS SET FINALIA=(TEST1+TEST2+TEST3)/3;
SELECT * FROM IAMARKS;

SQL> UPDATE IAMARKS SET FINALIA=(TEST1+TEST2+TEST3)/3;

3 rows updated.

SQL> SELECT * FROM IAMARKS;

USN                  SUBCODE         SSID                      TEST1      TEST2
-------------------- --------------- -------------------- ---------- ----------
     TEST3    FINALIA
---------- ----------
4SF20CD001           C2              S1                           25         27
        28         27

4SF21CI057           C3              S1                           28         29
        30         29

4SF20IS025           C1              S1                           24         25
        26         25


QUERY 5:

SELECT S.*,IA.FINALIA,
(CASE
WHEN IA.FINALIA BETWEEN 45 AND 50 THEN 'OUTSTANDING'
WHEN IA.FINALIA BETWEEN 40 AND 44 THEN 'GOOD'
WHEN IA.FINALIA BETWEEN 30 AND 39 THEN 'AVERAGE'
ELSE 'WEAK' END) AS CAT FROM STUDENTS S, SEMSEC SS, IAMARKS IA
WHERE S.USN=IA.USN AND SS.SSID=IA.SSID AND SS.SEM=4;






SQL> SELECT S.*,IA.FINALIA,
  2  (CASE
  3  WHEN IA.FINALIA BETWEEN 45 AND 50 THEN 'OUTSTANDING'
  4  WHEN IA.FINALIA BETWEEN 40 AND 44 THEN 'GOOD'
  5  WHEN IA.FINALIA BETWEEN 30 AND 39 THEN 'AVERAGE'
  6  ELSE 'WEAK' END) AS CAT FROM STUDENTS S, SEMSEC SS, IAMARKS IA
  7  WHERE S.USN=IA.USN AND SS.SSID=IA.SSID AND SS.SEM=4;

USN                  SNAME           ADDRESS                   PHONE GENDER
-------------------- --------------- -------------------- ---------- ------
   FINALIA CAT
---------- -----------
4SF20CD001           ANNA            USA                  4567890321 FEMALE
        46 OUTSTANDING

4SF21CI057           JOHN            LONDON               9876543219 MALE
        49 OUTSTANDING

4SF20IS025           RACHAEL         DENMARK              8765432109 FEMALE
        43 GOOD





------------------------------

UPDATE IAMARKS
SET FINALIA= '43'
WHERE SUBCODE = 'C1';

SELECT * FROM IAMARKS;





SQL> UPDATE IAMARKS
  2  SET FINALIA= '46'
  3  WHERE SUBCODE = 'C2';

1 row updated.

SQL> UPDATE IAMARKS
  2  SET FINALIA= '49'
  3  WHERE SUBCODE = 'C3';

1 row updated.

SQL> UPDATE IAMARKS
  2  SET FINALIA= '43'
  3  WHERE SUBCODE = 'C1';

1 row updated.