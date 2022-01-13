
INSERT INTO skill
VALUES      (001,
             ’java’,
             ’technology’);
1 row created.

INSERT INTO skill
VALUES      (002,
             ’python’,
             ’technology’);
1 row created.

INSERT INTO skill
VALUES      (003,
             ’economics’,
             ’business’);
1 row created.

INSERT INTO skill
VALUES      (004,
             ’accounting’,
             ’business’);
1 row created.

INSERT INTO employee
VALUES     (1001,
            'Parekh',
            'Niket',
            '20-Nov-98',
            '10-Nov-17',
            NULL,
            NULL);
1 row created.

INSERT INTO employee
VALUES     (1002,
            'Iqbal',
            'Anam',
            '20-Oct-98',
            '11-Nov-18',
            1001,
            NULL);
1 row created.

INSERT INTO employee
VALUES     (1003,
            'Choksi',
            'Parth',
            '20-Dec-98',
            '11-Dec-16',
            1002,
            NULL);
1 row created.

INSERT INTO employee
VALUES     (1004,
            'Kadakia',
            'Swapnil',
            '16-Sep-98',
            '11-Jul-18',
            1001,
            NULL);
1 row created.

INSERT INTO employee
VALUES     (1005,
            'Patel',
            'Ruhi',
            '16-Feb-99',
            '9-Jul-18',
            1004,
            NULL);
1 row created.

INSERT INTO employee
VALUES     (1006,
            'Joshi',
            'Aashta',
            '16-Oct-97',
            '6-Jun-21',
            1004,
            NULL);
1 row created.

INSERT INTO employee
VALUES     (1007,
            'Haria',
            'Jas',
            '3-Mar-97',
            '10-Jun-17',
            1001,
            NULL);
1 row created.

INSERT INTO employee
VALUES     (1008,
            'Thakkar',
            'Urvish',
            '10-Mar-00',
            '6-Jun-18',
            1007,
            NULL);
1 row created.

INSERT INTO employee
VALUES     (1009,
            'Muzaffar',
            'Seemal',
            '10-Dec-00',
            '2-Dec-18',
            1001,
            NULL);
1 row created.

INSERT INTO employee
VALUES     (1010,
            'Chavan',
            'Suyash',
            '6-Sep-98',
            '12-Nov-21',
            1009,
            NULL);
1 row created.

INSERT INTO department
VALUES     (01,
            'Administrative',
            'NYC',
            1234567809,
            1002);
1 row created.

INSERT INTO department
VALUES     (02,
            'Technology',
            'Chicago',
            1234567801,
            1004);

INSERT INTO department
VALUES     (03,
            'Marketing',
            'LA',
            1234567802,
            1007);
1 row created.

INSERT INTO department
VALUES     (04,
            'Research',
            'SFO',
            1234567803,
            1009);
1 row created.

INSERT INTO training
VALUES     (301,
            001,
            1002,
            'Course at College',
            '1-Jan-21',
            'Great work' );
1 row created.

INSERT INTO training
VALUES     (302,
            001,
            1003,
            'Workshop',
            '02-Jan-21',
            'Great work' );
1 row created.

INSERT INTO training
VALUES     (303,
            001,
            1004,
            'Technical Training',
            '03-Jan-21',
            'Nice work' );
1 row created.

INSERT INTO training
VALUES     (304,
            002,
            1005,
            'Course at College',
            '01-Jan-21',
            'Great work' );
1 row created.

INSERT INTO training
VALUES     (305,
            002,
            1006,
            'Workshop',
            '02-Oct-21',
            'Great work' );
1 row created.

INSERT INTO training
VALUES     (306,
            002,
            1007,
            'Technical Training ',
            '03-Jan-21',
            'Nice work' );
1 row created.

INSERT INTO training
VALUES     (307,
            003,
            1008,
            'Course at College',
            '01-Jan-21',
            'Great work' );
1 row created.

INSERT INTO training
VALUES     (308,
            003,
            1009,
            'Workshop',
            '02-Jan-21',
            'Great work' );
1 row created.

INSERT INTO training
VALUES     (309,
            003,
            1010,
            'Technical Training ',
            '03-Jan-21',
            'Nice work' );
1 row created.

INSERT INTO training
VALUES     (310,
            001,
            1002,
            'Course at College',
            '10-Jan-21',
            'Great work' );
1 row created.

INSERT INTO training
VALUES     (311,
            003,
            1001,
            'Workshop',
            '02-Jan-21',
            'Great work' );
1 row created.

INSERT INTO training
VALUES     (312,
            003,
            1010,
            'Technical Training ',
            '13-Jan-21',
            'Nice work' );
1 row created.

INSERT INTO training
VALUES     (313,
            001,
            1001,
            'Technical Training ',
            '14-Jan-21',
            'Nice work' );
1 row created.

INSERT INTO training
VALUES     (314,
            002,
            1002,
            'Technical Training ',
            '14-Jan-21',
            'Nice work' );
1 row created.

INSERT INTO training
VALUES     (315,
            003,
            1004,
            'Technical Training ',
            '17-Jan-21',
            'Great work' );
1 row created.

INSERT INTO training
VALUES     (316,
            004,
            1007,
            'Technical Training ',
            '14-Jan-21',
            'Nice work' );
1 row created.

INSERT INTO training
VALUES     (317,
            002,
            1010,
            'Technical Training ',
            '10-Jan-21',
            'Great work' );
1 row created.

INSERT INTO client
VALUES      (201,
             'Apple',
             'Street 201',
             'Fremont',
             'CA',
             '15201',
             'Tech',
             NULL,
             987654321,
             'Cook',
             'Tim');
1 row created.

INSERT INTO client
VALUES      (202,
             'Microsoft',
             'Street 202',
             'SFO',
             'CA',
             '15202',
             'Tech',
             'https://www.microsoft.com',
             987654322,
             'Nadella',
             'Satya');
1 row created.

INSERT INTO client
VALUES      (203,
             'Google',
             'Street 203',
             'Palo Alto',
             'CA',
             '15203',
             'Tech',
             'https://www.google.com',
             987654323,
             'Pichai',
             'Sundar');
1 row created.

INSERT INTO client
VALUES      (204,
             'Amazon',
             'Street 204',
             'Seattle',
             'WA',
             '15204',
             'Tech',
             'https://www.amazon.edu',
             987654324,
             'Bezos',
             'Jeff');
1 row created.

INSERT INTO client
VALUES      (205,
             'Facebook',
             'Street 205',
             'San Jose',
             'CA',
             '15205',
             'Tech',
             'https://www.facebook.edu',
             987654325,
             'Zuck',
             'Mark');
1 row created.

INSERT INTO client
VALUES      (206,
             'Tesla',
             'Street 206',
             'NYC',
             'NY',
             '15206',
             'Automotive',
             'https://www.tesla.gov',
             987654326,
             'Daniels',
             'Jeff');
1 row created.

INSERT INTO client
VALUES      (207,
             'Walgreens',
             'Street 209',
             'Chicago',
             'IL',
             '15207',
             'Consulting',
             'https://www.wg.gov',
             987654327,
             'Musk',
             'Elon');
1 row created.

INSERT INTO client
VALUES      (208,
             'EY',
             'Street 208',
             'Chicago',
             'IL',
             '15208',
             'Consulting',
             'https://www.ey.org',
             987654328,
             'Jordan',
             'Michael');
1 row created.

INSERT INTO client
VALUES      (209,
             'Deloitte',
             'Street 209',
             'Dallas',
             'TX',
             '15209',
             'Consulting',
             'https://www.deloitte.org',
             987654329,
             'Curry',
             'Steph');
1 row created.

INSERT INTO client
VALUES      (210,
             'PWC',
             'Street 210',
             'Chicago',
             'IL',
             '15210',
             'Consulting',
             'https://www.pwc.inc',
             987654310,
             'Kohli',
             'Virat');
1 row created.

INSERT INTO client
VALUES      (211,
             'Exxon',
             'Street 210',
             'Pittsburgh',
             'PA',
             '15211',
             'Energy',
             'https://www.exxon.com',
             987654311,
             'Spacey',
             'Kevin');
1 row created.

INSERT INTO project
VALUES      (2001,
             'Project 1',
             '09-Jan-19',
             50000,
             01,
             201,
             001);
1 row created.

INSERT INTO project
VALUES      (2002,
             'Project 2',
             '03-Feb-20',
             65000,
             02,
             202,
             002);
1 row created.

INSERT INTO project
VALUES      (2003,
             'Project 3',
             '02-Mar-16',
             40000,
             03,
             203,
             003);
1 row created.

INSERT INTO project
VALUES      (2004,
             'Project 4',
             '07-Apr-18',
             45000,
             04,
             204,
             004);
1 row created.

INSERT INTO project
VALUES      (2005,
             'Project 5',
             '05-Jan-21',
             NULL,
             03,
             205,
             003);
1 row created.

INSERT INTO project
VALUES      (2006,
             'Project 6',
             '01-March-21',
             NULL,
             04,
             206,
             002);
1 row created.

INSERT INTO assignment
VALUES      (701,
             2001,
             1001,
             '09-Jan-19',
             '31-Jan-19',
             70);
1 row created.

INSERT INTO assignment
VALUES      (702,
             2001,
             1001,
             '01-Feb-19',
             '28-Feb-19',
             80);
1 row created.

INSERT INTO assignment
VALUES      (703,
             2002,
             1002,
             '03-Feb-20',
             '28-Feb-20',
             60);
1 row created.

INSERT INTO assignment
VALUES      (704,
             2002,
             1002,
             '01-Mar-20',
             '31-Mar-20',
             0);
1 row created.

INSERT INTO assignment
VALUES      (705,
             2002,
             1003,
             '01-Mar-20',
             '31-Mar-20',
             60);
1 row created.

INSERT INTO assignment
VALUES      (706,
             2003,
             1004,
             '02-Mar-16',
             '31-Mar-16',
             50);
1 row created.

INSERT INTO assignment
VALUES      (707,
             2003,
             1004,
             '03-Apr-16',
             '30-Apr-16',
             50);
1 row created.

INSERT INTO assignment
VALUES      (708,
             2004,
             1005,
             '07-Apr-18',
             '25-Apr-18',
             288);

INSERT INTO assignment
VALUES      (709,
             2004,
             1007,
             '08-May-18',
             '25-May-18',
             288);
1 row created.

INSERT INTO assignment
VALUES      (710,
             2004,
             1005,
             '01-Jun-18',
             '25-Jun-18',
             288);
1 row created.

INSERT INTO assignment
VALUES      (711,
             2004,
             1007,
             '08-Jul-18',
             '25-Jul-18',
             288);
1 row created.

INSERT INTO assignment
VALUES      (712,
             2004,
             1005,
             '07-Aug-18',
             '25-Aug-18',
             288);
1 row created.

INSERT INTO assignment
VALUES      (713,
             2005,
             1008,
             '05-Jan-21',
             '31-Jan-21',
             288);
1 row created.

INSERT INTO assignment
VALUES      (714,
             2005,
             1009,
             '01-Feb-21',
             '28-Feb-21',
             288);
1 row created.

INSERT INTO assignment
VALUES      (715,
             2005,
             1008,
             '05-Mar-21',
             '30-Mar-21',
             288);
1 row created.

INSERT INTO assignment
VALUES      (716,
             2005,
             1009,
             '01-Apr-21',
             '28-Apr-21',
             288);
1 row created.

INSERT INTO assignment
VALUES      (717,
             2005,
             1008,
             '05-May-21',
             '31-May-21',
             60);
1 row created.

INSERT INTO assignment
VALUES      (718,
             2005,
             1009,
             '01-Jun-21',
             '28-Jun-21',
             240);
1 row created.

INSERT INTO assignment
VALUES      (719,
             2006,
             1010,
             '01-Mar-21',
             '31-Mar-21',
             288);
1 row created.

INSERT INTO assignment
VALUES      (720,
             2006,
             1010,
             '01-Apr-21',
             '30-Apr-21',
             288);
1 row created.

INSERT INTO assignment
VALUES      (721,
             2006,
             1010,
             '01-May-21',
             '31-May-21',
             288);
1 row created.

INSERT INTO assignment
VALUES      (722,
             2006,
             1010,
             '01-Jun-21',
             '30-Jun-21',
             288);
1 row created.

INSERT INTO assignment
VALUES      (723,
             2006,
             1010,
             '01-Jul-21',
             '31-Jul-21',
             0);
1 row created.

INSERT INTO assignment
VALUES      (724,
             2006,
             1010,
             '01-Aug-21',
             '30-Aug-21',
             100);
1 row created.

INSERT INTO assignment
VALUES      (725,
             2006,
             1010,
             '01-Sep-21',
             '30-Sep-21',
             188);
1 row created.

INSERT INTO assignment
VALUES      (726,
             2006,
             1010,
             '01-Oct-21',
             '30-Oct-21',
             70);
1 row created.

INSERT INTO assignment
VALUES      (727,
             2006,
             1006,
             '06-Nov-21',
             NULL,
             NULL);
1 row created.

UPDATE employee
SET    dept_code = 01
WHERE  emp_num = 1001;
1 row updated.

UPDATE employee
SET    dept_code = 01
WHERE  emp_num = 1002;
1 row updated.

UPDATE employee
SET    dept_code = 01
WHERE  emp_num = 1003;
1 row updated.

UPDATE employee
SET    dept_code = 02
WHERE  emp_num = 1004;
1 row updated.

UPDATE employee
SET    dept_code = 02
WHERE  emp_num = 1005;
1 row updated.

UPDATE employee
SET    dept_code = 02
WHERE  emp_num = 1006;
1 row updated.

UPDATE employee
SET    dept_code = 03
WHERE  emp_num = 1007;
1 row updated.

UPDATE employee
SET    dept_code = 03
WHERE  emp_num = 1008;
1 row updated.

UPDATE employee
SET    dept_code = 04
WHERE  emp_num = 1009;
1 row updated.

UPDATE employee
SET    dept_code = 04
WHERE  emp_num = 1010; 
1 row updated.








SQL> SELECT * FROM SKILL;
      CODE NAME       CATEGORY
---------- ---------- ----------
         1 Java       Technology
         2 Python     Technology
         3 Economics  Business
         4 Accounting Business
SQL> SELECT * FROM TRAINING;
TRAIN_NUM        CODE    EMP_NUM NAME                 DATE_ACQUIRED  COMMENTS
---------- ---------- ---------- -------------------- -------------- -----------
       301          1       1002 Course at College    01-JAN-21      Great work
       302          1       1003 Workshop             02-JAN-21      Great work
       303          1       1004 Technical Training   03-JAN-21      Nice work
       304          2       1005 Course at College    01-JAN-21      Great work
       305          2       1006 Workshop             02-OCT-21      Great work
       306          2       1007 Technical Training   03-JAN-21      Nice work
       307          3       1008 Course at College    01-JAN-21      Great work
       308          3       1009 Workshop             02-JAN-21      Great work
       309          3       1010 Technical Training   03-JAN-21      Nice work
       310          1       1002 Course at College    10-JAN-21      Great work
       311          3       1001 Workshop             02-JAN-21      Great work
       312          3       1010 Technical Training   13-JAN-21      Nice work
       313          1       1001 Technical Training   14-JAN-21      Nice work
       314          2       1002 Technical Training   14-JAN-21      Nice work
       315          3       1004 Technical Training   17-JAN-21      Great work
       316          4       1007 Technical Training   14-JAN-21      Nice work
       317          2       1010 Technical Training   10-JAN-21      Great work

17 rows selected.

SQL> SELECT * FROM   DEPARTMENT;
DEPT_CODE  NAME                 LOCATION                  PHONE MANAGER_ID
---------- -------------------- -------------------- ---------- ----------
         1 Administrative       NYC                  1234567809       1002
         2 Technology           Chicago              1234567801       1004
         3 Marketing            LA                   1234567802       1007
         4 Research             SFO                  1234567803       1009

SQL> SELECT * FROM   EMPLOYEE;
   EMP_NUM LNAME      FNAME      DOB       HIRE_DATE   SUPER_ID  DEPT_CODE
---------- ---------- ---------- --------- --------- ---------- ----------
      1001 Parekh     Niket      20-NOV-98 10-NOV-17                     1
      1002 Iqbal      Anam       20-OCT-98 11-NOV-18       1001          1
      1003 Choksi     Parth      20-DEC-98 11-DEC-16       1002          1
      1004 Kadakia    Swapnil    16-SEP-98 11-JUL-18       1001          2
      1005 Patel      Ruhi       16-FEB-99 09-JUL-18       1004          2
      1006 Joshi      Aashta     16-OCT-97 06-JUN-21       1004          2
      1007 Haria      Jas        03-MAR-97 10-JUN-17       1001          3
      1008 Thakkar    Urvish     10-MAR-00 06-JUN-18       1007          3
      1009 Muzaffar   Seemal     10-DEC-00 02-DEC-18       1001          4
      1010 Chavan     Suyash     06-SEP-98 12-NOV-21       1009          4

10 rows selected.

SQL> SELECT * FROM   CLIENT;
CLIENT_ID  NAME         STREET     CITY       STATE  ZIP_CODE INDUSTRY     WEB_ADDRESS               PHONE        CONTACT_LNAME  CONTACT_FNAME
---------- ------------ ---------- ---------- ------ -------- ------------ ------------------------- ------------ -------------- --------------
       201 Apple        Street 201 Fremont    CA     15201    Tech                                   987654321    Cook           Tim
       202 Microsoft    Street 202 SFO        CA     15202    Tech         https://www.microsoft.com 987654322    Nadella        Satya
       203 Google       Street 203 Palo Alto  CA     15203    Tech         https://www.google.com    987654323    Pichai         Sundar
       204 Amazon       Street 204 Seattle    WA     15204    Tech         https://www.amazon.edu    987654324    Bezos          Jeff
       205 Facebook     Street 205 San Jose   CA     15205    Tech         https://www.facebook.edu  987654325    Zuck           Mark
       206 Tesla        Street 206 NYC        NY     15206    Automotive   https://www.tesla.gov     987654326    Daniels        Jeff
       207 Walgreens    Street 209 Chicago    IL     15207    Consulting   https://www.wg.gov        987654327    Musk           Elon
       208 EY           Street 208 Chicago    IL     15208    Consulting   https://www.ey.org        987654328    Jordan         Michael
       209 Deloitte     Street 209 Dallas     TX     15209    Consulting   https://www.deloitte.org  987654329    Curry          Steph
       210 PWC          Street 210 Chicago    IL     15210    Consulting   https://www.pwc.inc       987654310    Kohli          Virat
       211 Exxon        Street 210 Pittsburgh PA     15211    Energy       https://www.exxon.com     987654311    Spacey         Kevin

11 rows selected.

SQL> SELECT * FROM   PROJECT;
PROJ_NUMBER NAME         START_DATE   TOTAL_COST  DEPT_CODE  CLIENT_ID       CODE
----------- ------------ ------------ ---------- ---------- ---------- ----------
       2001 Project 1    09-JAN-19         50000          1        201          1
       2002 Project 2    03-FEB-20         65000          2        202          2
       2003 Project 3    02-MAR-16         40000          3        203          3
       2004 Project 4    07-APR-18         45000          4        204          4
       2005 Project 5    05-JAN-21                        3        205          3
       2006 Project 6    01-MAR-21                        4        206          2

6 rows selected.

SQL> SELECT * FROM   ASSIGNMENT;
ASSIGN_NUM PROJ_NUMBER    EMP_NUM DATE_ASSIGNED  DATE_ENDED   HOURS_USED
---------- ----------- ---------- -------------- ------------ ----------
       701        2001       1001 09-JAN-19      31-JAN-19            70
       702        2001       1001 01-FEB-19      28-FEB-19            80
       703        2002       1002 03-FEB-20      28-FEB-20            60
       704        2002       1002 01-MAR-20      31-MAR-20             0
       705        2002       1003 01-MAR-20      31-MAR-20            60
       706        2003       1004 02-MAR-16      31-MAR-16            50
       707        2003       1004 03-APR-16      30-APR-16            50
       708        2004       1005 07-APR-18      25-APR-18           288
       709        2004       1007 08-MAY-18      25-MAY-18           288
       710        2004       1005 01-JUN-18      25-JUN-18           288
       711        2004       1007 08-JUL-18      25-JUL-18           288
       712        2004       1005 07-AUG-18      25-AUG-18           288
       713        2005       1008 05-JAN-21      31-JAN-21           288
       714        2005       1009 01-FEB-21      28-FEB-21           288
       715        2005       1008 05-MAR-21      30-MAR-21           288
       716        2005       1009 01-APR-21      28-APR-21           288
       717        2005       1008 05-MAY-21      31-MAY-21            60
       718        2005       1009 01-JUN-21      28-JUN-21           240
       719        2006       1010 01-MAR-21      31-MAR-21           288
       720        2006       1010 01-APR-21      30-APR-21           288
       721        2006       1010 01-MAY-21      31-MAY-21           288
       722        2006       1010 01-JUN-21      30-JUN-21           288
       723        2006       1010 01-JUL-21      31-JUL-21             0
       724        2006       1010 01-AUG-21      30-AUG-21           100
       725        2006       1010 01-SEP-21      30-SEP-21           188
       726        2006       1010 01-OCT-21      30-OCT-21            70
       727        2006       1006 06-NOV-21

27 rows selected.
