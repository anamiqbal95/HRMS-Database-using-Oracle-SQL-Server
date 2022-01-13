Query 1:
SQL> SELECT a.Emp_num
  2         || '- '
  3         || Initcap(a.Fname)
  4         || ' '
  5         || Initcap(a.Lname)                                     AS "Employee",
  6         Nvl(c.NAME, 'NA')                                       AS
  7         "Acquired Skill",
  8         Count(b.Code)                                           AS
  9         "Times of Training",
 10         Max(b.Date_acquired)                                    AS
 11         "Earliest Date",
 12         Trunc(Months_between(Sysdate, Max(b.Date_acquired)), 0) AS "Months Past"
 13  FROM   employee a
 14         LEFT OUTER JOIN training b
 15                      ON a.Emp_num = b.Emp_num
 16         LEFT OUTER JOIN skill c
 17                      ON b.Code = c.Code
 18  GROUP  BY a.Emp_num
 19            || '- '
 20            || Initcap(a.Fname)
 21            || ' '
 22            || Initcap(a.Lname),
 23            c.NAME
 24  ORDER  BY a.Emp_num
 25            || '- '
 26            || Initcap(a.Fname)
 27            || ' '
 28            || Initcap(a.Lname) ASC;

Employee                 Acquired Skill       Times of Training Earliest  Months Past
------------------------ -------------------- ----------------- --------- -----------
1001- Niket Parekh       Economics                            1 02-JAN-21          10
1001- Niket Parekh       Java                                 1 14-JAN-21          10
1002- Anam Iqbal         Java                                 2 10-JAN-21          10
1002- Anam Iqbal         Python                               1 14-JAN-21          10
1003- Parth Choksi       Java                                 1 02-JAN-21          10
1004- Swapnil Kadakia    Economics                            1 17-JAN-21          10
1004- Swapnil Kadakia    Java                                 1 03-JAN-21          10
1005- Ruhi Patel         Python                               1 01-JAN-21          11
1006- Aashta Joshi       Python                               1 02-OCT-21           1
1007- Jas Haria          Accounting                           1 14-JAN-21          10
1007- Jas Haria          Python                               1 03-JAN-21          10
1008- Urvish Thakkar     Economics                            1 01-JAN-21          11
1009- Seemal Muzaffar    Economics                            1 02-JAN-21          10
1010- Suyash Chavan      Economics                            2 13-JAN-21          10
1010- Suyash Chavan      Python                               1 10-JAN-21          10

15 rows selected.

Query 2:
SQL> SELECT level,
  2         lpad(' ', 3*(level - 1))
  3                || a.emp_num
  4                || ' '
  5                || initcap(a.fname)
  6                || ' '
  7                || initcap(a.lname) AS "Employee",
  8         a.dept_code                AS "Department Code" ,
  9         d.NAME                     AS "Name"
 10  FROM   employee a
 11  JOIN   department d
 12  ON     a.dept_code = d.dept_code start WITH emp_num = 1001
 13  connect BY prior emp_num = super_id;

     LEVEL Employee                    Department Code Name
---------- --------------------------- --------------- --------------------
         1 1001 Niket Parekh                         1 Administrative
         2    1002 Anam Iqbal                        1 Administrative
         3       1003 Parth Choksi                   1 Administrative
         2    1004 Swapnil Kadakia                   2 Technology
         3       1005 Ruhi Patel                     2 Technology
         3       1006 Aashta Joshi                   2 Technology
         2    1007 Jas Haria                         3 Marketing
         3       1008 Urvish Thakkar                 3 Marketing
         2    1009 Seemal Muzaffar                   4 Research
         3       1010 Suyash Chavan                  4 Research

10 rows selected.

Query 3:
SQL> SELECT a.NAME                                         AS "Project Name",
  2         a.Start_date                                   AS "Start Date",
  3         Nvl(To_char(b.Date_assigned, 'yyyy-mm'), '--') AS "Month",
  4         Count(b.Emp_num)                               AS "No. of Employees",
  5         Sum(b.Hours_used)                              AS "Total Hours"
  6  FROM   project a
  7         LEFT OUTER JOIN assignment b
  8                      ON a.Proj_number = b.Proj_number
  9  WHERE  a.Total_cost IS NULL
 10  GROUP  BY a.NAME,
 11            a.Start_date,
 12            rollup( To_char(b.Date_assigned, 'yyyy-mm') )
 13  ORDER  BY 1,
 14            2,
 15            To_char(b.Date_assigned, 'yyyy-mm');

Project Name Start Date      Month   No. of Employees Total Hours
------------ --------------- ------- ---------------- -----------
Project 5    05-JAN-21       2021-01                1         288
Project 5    05-JAN-21       2021-02                1         288
Project 5    05-JAN-21       2021-03                1         288
Project 5    05-JAN-21       2021-04                1         288
Project 5    05-JAN-21       2021-05                1          60
Project 5    05-JAN-21       2021-06                1         240
Project 5    05-JAN-21       --                     6        1452
Project 6    01-MAR-21       2021-03                1         288
Project 6    01-MAR-21       2021-04                1         288
Project 6    01-MAR-21       2021-05                1         288
Project 6    01-MAR-21       2021-06                1         288
Project 6    01-MAR-21       2021-07                1           0
Project 6    01-MAR-21       2021-08                1         100
Project 6    01-MAR-21       2021-09                1         188
Project 6    01-MAR-21       2021-10                1          70
Project 6    01-MAR-21       2021-11                1           0
Project 6    01-MAR-21       --                     9        1510

17 rows selected.


Query 4:
SQL> ALTER TABLE employee
  2    ADD Bonus_amt NUMBER DEFAULT 0;

Table altered.

SQL> UPDATE employee
  2  SET    Bonus_amt = 200
  3  WHERE  Emp_num IN (SELECT Emp_num
  4                     FROM   assignment a
  5                            JOIN project p using (Proj_number)
  6                     WHERE  ( p.Start_date BETWEEN Trunc(Sysdate, 'YEAR') AND
  7                                                   Add_months(Trunc(Sysdate,
  8                                                                      'YEAR'
  9                                                                      ), 3) )
 10                            AND a.Hours_used > 150);

3 rows updated.

SQL> SELECT * FROM Employee;

   EMP_NUM LNAME      FNAME      DOB       HIRE_DATE   SUPER_ID  DEPT_CODE  BONUS_AMT
---------- ---------- ---------- --------- --------- ---------- ---------- ----------
      1001 Parekh     Niket      20-NOV-98 10-NOV-17                     1          0
      1002 Iqbal      Anam       20-OCT-98 11-NOV-18       1001          1          0
      1003 Choksi     Parth      20-DEC-98 11-DEC-16       1002          1          0
      1004 Kadakia    Swapnil    16-SEP-98 11-JUL-18       1001          2          0
      1005 Patel      Ruhi       16-FEB-99 09-JUL-18       1004          2          0
      1006 Joshi      Aashta     16-OCT-97 06-JUN-21       1004          2          0
      1007 Haria      Jas        03-MAR-97 10-JUN-17       1001          3          0
      1008 Thakkar    Urvish     10-MAR-00 06-JUN-18       1007          3        200
      1009 Muzaffar   Seemal     10-DEC-00 02-DEC-18       1001          4        200
      1010 Chavan     Suyash     06-SEP-98 12-NOV-21       1009          4        200

10 rows selected.
 

Query 5:
SQL> SELECT a.emp_num
  2         || '- '
  3         || Initcap(a.fname)
  4         || ' '
  5         || Initcap(a.lname)           AS "Employee",
  6         a.hire_date                   AS "Hired Date",
  7         Nvl(b.NAME, 'N/A')            AS "Training Name",
  8         b.date_acquired               AS "Training Date",
  9         b.date_acquired - a.hire_date AS "Days Past",
 10         Count(DISTINCT c.proj_number) AS "No. of Projects"
 11  FROM   employee a
 12         LEFT OUTER JOIN training b
 13                      ON a.emp_num = b.emp_num
 14         LEFT OUTER JOIN assignment c
 15                      ON a.emp_num = c.emp_num
 16  WHERE  a.hire_date BETWEEN '01-APR-2021' AND '30-JUN-2021'
 17  GROUP  BY a.emp_num
 18            || '- '
 19            || Initcap(a.fname)
 20            || ' '
 21            || Initcap(a.lname),
 22            a.hire_date,
 23            b.NAME,
 24            b.date_acquired,
 25            b.date_acquired - a.hire_date
 26  ORDER  BY 1;

Employee             Hired Date       Training Name        Training   Days Past No. of Projects
-------------------- ---------------- -------------------- --------- ---------- ---------------
1006- Aashta Joshi   06-JUN-21        Workshop             02-OCT-21        118               1

Query 6:
SQL> SELECT DISTINCT NAME         AS "Name",
  2                  p.Start_date AS "Start Date",
  3                  ( CASE
  4                      WHEN Total_cost IS NOT NULL THEN 'Completed'
  5                      ELSE 'On-going'
  6                    END )      AS "Status"
  7  FROM   project p
  8         JOIN assignment a using (Proj_number)
  9  WHERE  ( Proj_number IN (SELECT Proj_number
 10                           FROM   assignment a
 11                                  JOIN project p using (Proj_number)
 12                           WHERE  Hours_used = 0) )
 13         AND ( Date_ended IN (SELECT Max(Date_ended)
 14                              FROM   assignment a
 15                                     JOIN project p using (Proj_number)
 16                              GROUP  BY Proj_number) );

Name         Start Date      Status
------------ --------------- ---------
Project 2    03-FEB-20       Completed
Project 6    01-MAR-21       On-going


Query 7:
SQL> SELECT 'First Quarter'                                                        AS
  2         "Quarter",
  3         Count(DISTINCT a.Proj_number)                                          AS
  4         "No of Projects",
  5         Count(DISTINCT b.Emp_num)                                              AS
  6         "No of Employees",
  7         Nvl(To_char(Sum(b.Hours_used) / Count(DISTINCT a.Proj_number)), 'N/A') AS
  8         "Avg. Hours per Project"
  9  FROM   project a
 10         LEFT OUTER JOIN assignment b
 11                      ON a.Proj_number = b.Proj_number
 12  WHERE  a.Start_date BETWEEN '01-JAN-2021' AND '31-MAR-2021'
 13  UNION ALL
 14  SELECT 'Second Quarter'                                                       AS
 15         "Quarter",
 16         Count(DISTINCT a.Proj_number)                                          AS
 17         "No of Projects",
 18         Count(DISTINCT b.Emp_num)                                              AS
 19         "No of Employees",
 20         Nvl(To_char(Sum(b.Hours_used) / Count(DISTINCT a.Proj_number)), 'N/A') AS
 21         "Avg. Hours per Project"
 22  FROM   project a
 23         LEFT OUTER JOIN assignment b
 24                      ON a.Proj_number = b.Proj_number
 25  WHERE  a.Start_date BETWEEN '01-APR-2021' AND '30-JUN-2021'
 26  UNION ALL
 27  SELECT 'Third Quarter'                                                        AS
 28         "Quarter",
 29         Count(DISTINCT a.Proj_number)                                          AS
 30         "No of Projects",
 31         Count(DISTINCT b.Emp_num)                                              AS
 32         "No of Employees",
 33         Nvl(To_char(Sum(b.Hours_used) / Count(DISTINCT a.Proj_number)), 'N/A') AS
 34         "Avg. Hours per Project"
 35  FROM   project a
 36         LEFT OUTER JOIN assignment b
 37                      ON a.Proj_number = b.Proj_number
 38  WHERE  a.Start_date BETWEEN '01-JUL-2021' AND '30-SEP-2021'
 39  UNION ALL
 40  SELECT 'Fourth Quarter'                                                       AS
 41         "Quarter",
 42         Count(DISTINCT a.Proj_number)                                          AS
 43         "No of Projects",
 44         Count(DISTINCT b.Emp_num)                                              AS
 45         "No of Employees",
 46         Nvl(To_char(Sum(b.Hours_used) / Count(DISTINCT a.Proj_number)), 'N/A') AS
 47         "Avg. Hours per Project"
 48  FROM   project a
 49         LEFT OUTER JOIN assignment b
 50                      ON a.Proj_number = b.Proj_number
 51  WHERE  a.Start_date BETWEEN '01-OCT-2021' AND '31-DEC-2021';

Quarter        No of Projects No of Employees Avg. Hours per Project
-------------- -------------- --------------- ----------------------------------------
First Quarter               2               4 1481
Second Quarter              0               0 N/A
Third Quarter               0               0 N/A
Fourth Quarter              0               0 N/A




Query 8:
SQL> SELECT To_char(E.Emp_num)                AS "ID",
  2         To_char(E.Fname
  3                 || ' '
  4                 || E.Lname)               AS "Employee Name",
  5         Sum(Decode(S.Code, 1, 1,
  6                            0))            "Java",
  7         Nvl(To_char(Max(Decode(S.Code, 1, T.Date_acquired))), '------')
  8                                           "Latest Date Acquired",
  9         Sum(Decode(S.Code, 2, 1,
 10                            0))            "Python",
 11         Nvl(To_char(Max(Decode(S.Code, 2, T.Date_acquired))), '------')
 12                                           "Latest Date Acquired",
 13         Sum(Decode(S.Code, 3, 1,
 14                            0))            "Economics",
 15         Nvl(To_char(Max(Decode(S.Code, 3, T.Date_acquired))), '------')
 16                                           "Latest Date Acquired",
 17         Sum(Decode(S.Code, 4, 1,
 18                            0))            "Accounting",
 19         Nvl(To_char(Max(Decode(S.Code, 4, T.Date_acquired))), '------')
 20                                           "Latest Date Acquired",
 21         Nvl(To_char(Count(E.Emp_num)), 0) "Number of skills:"
 22  FROM   employee E
 23         JOIN training T
 24           ON E.Emp_num = T.Emp_num
 25         JOIN skill S
 26           ON T.Code = S.Code
 27  GROUP  BY E.Emp_num,
 28            E.Fname
 29            || ' '
 30            || E.Lname
 31  UNION ALL
 32  SELECT '---',
 33         'Number of Trainings:',
 34         Sum(X.A),
 35         '------',
 36         Sum(X.B),
 37         '------',
 38         Sum(X.C),
 39         '------',
 40         Sum(X.D),
 41         '------',
 42         '------'
 43  FROM  (SELECT E.Emp_num                AS "ID",
 44                E.Fname
 45                || ' '
 46                || E.Lname               AS "EMPLOYEE_NAME",
 47                Sum(Decode(S.Code, 1, 1,
 48                                   0))   A,
 49                Nvl(To_char(Max(Decode(S.Code, 1, T.Date_acquired))), '------')
 50                                         "LATEST DATE ACQUIRED",
 51                Sum(Decode(S.Code, 2, 1,
 52                                   0))   B,
 53                Nvl(To_char(Max(Decode(S.Code, 2, T.Date_acquired))), '------')
 54                                         "LATEST DATE ACQUIRED",
 55                Sum(Decode(S.Code, 3, 1,
 56                                   0))   C,
 57                Nvl(To_char(Max(Decode(S.Code, 3, T.Date_acquired))), '------')
 58                                         "LATEST DATE ACQUIRED",
 59                Sum(Decode(S.Code, 4, 1,
 60                                   0))   D,
 61                Nvl(To_char(Max(Decode(S.Code, 4, T.Date_acquired))), '------')
 62                                         "LATEST DATE ACQUIRED",
 63                Nvl(Count(E.Emp_num), 0) "NUMBER OF SKILLS:"
 64         FROM   employee E
 65                JOIN training T
 66                  ON E.Emp_num = T.Emp_num
 67                JOIN skill S
 68                  ON T.Code = S.Code
 69         GROUP  BY E.Emp_num,
 70                   E.Fname
 71                   || ' '
 72                   || E.Lname
 73         ORDER  BY E.Emp_num) X;

ID       Employee Name               Java Latest Date Acquired     Python Latest Date Acquired  Economics Latest Date Acquired Accounting Latest Date Acquired Number of skills:
-------- --------------------- ---------- -------------------- ---------- -------------------- ---------- -------------------- ---------- -------------------- ----------------------------------------
1009     Seemal Muzaffar                0 ------                        0 ------                        1 02-JAN-21                     0 ------               1
1001     Niket Parekh                   1 14-JAN-21                     0 ------                        1 02-JAN-21                     0 ------               2
1002     Anam Iqbal                     2 10-JAN-21                     1 14-JAN-21                     0 ------                        0 ------               3
1003     Parth Choksi                   1 02-JAN-21                     0 ------                        0 ------                        0 ------               1
1005     Ruhi Patel                     0 ------                        1 01-JAN-21                     0 ------                        0 ------               1
1007     Jas Haria                      0 ------                        1 03-JAN-21                     0 ------                        1 14-JAN-21            2
1006     Aashta Joshi                   0 ------                        1 02-OCT-21                     0 ------                        0 ------               1
1010     Suyash Chavan                  0 ------                        1 10-JAN-21                     2 13-JAN-21                     0 ------               3
1004     Swapnil Kadakia                1 03-JAN-21                     0 ------                        1 17-JAN-21                     0 ------               2
1008     Urvish Thakkar                 0 ------                        0 ------                        1 01-JAN-21                     0 ------               1
---      Number of Trainings:           5 ------                        5 ------                        6 ------                        1 ------               ------

11 rows selected. 

Query 9:
SQL> SELECT Rank()
  2           OVER (
  3             partition BY d.NAME
  4             ORDER BY Count(t.Train_num) DESC) AS Rank,
  5         d.NAME                                AS "Department",
  6         S.NAME                                AS "Skill",
  7         Count(t.Train_num)                    AS "# of Trainings Taken"
  8  FROM   department d
  9         CROSS JOIN skill s
 10         LEFT OUTER JOIN (department d1
 11                          JOIN employee e
 12                            ON d1.Dept_code = e.Dept_code
 13                          JOIN training t
 14                            ON e.Emp_num = t.Emp_num
 15                          JOIN skill s2
 16                            ON t.Code = s2.Code)
 17                      ON d.Dept_code = d1.Dept_code
 18                         AND s.Code = s2.Code
 19  GROUP  BY d.NAME,
 20            s.NAME
 21  ORDER  BY 2,
 22            1;

      RANK Department           Skill      # of Trainings Taken
---------- -------------------- ---------- --------------------
         1 Administrative       Java                          4
         2 Administrative       Economics                     1
         2 Administrative       Python                        1
         4 Administrative       Accounting                    0
         1 Marketing            Economics                     1
         1 Marketing            Accounting                    1
         1 Marketing            Python                        1
         4 Marketing            Java                          0
         1 Research             Economics                     3
         2 Research             Python                        1
         3 Research             Java                          0
         3 Research             Accounting                    0
         1 Technology           Python                        2
         2 Technology           Economics                     1
         2 Technology           Java                          1
         4 Technology           Accounting                    0

16 rows selected.

Query 10:
SQL> SELECT proj_number
  2         || ' - '
  3         || NAME                                             AS "Project",
  4         Sum(assign .Date_ended - assign.Date_assigned + 1) AS
  5         "Total Days Worked"
  6  FROM   assignment assign
  7         JOIN (SELECT proj_number,
  8                      NAME,
  9                      Sum(Days)
 10               FROM   (SELECT proj_number,
 11                              proj.NAME,
 12                              ( A.Date_ended - A.Date_assigned + 1 )
 13                              AS
 14                              Days,
 15                              Rank()
 16                                OVER (
 17                                  partition BY proj_number
 18                                  ORDER BY (A.Date_ended - A.Date_assigned + 1)
 19                                DESC) AS
 20                              Rank
 21                       FROM   project proj
 22                              JOIN assignment A using (proj_number)
 23                       WHERE  (proj_number, proj.NAME ) IN
 24                              (SELECT Proj_number,
 25                                      p.NAME
 26                               FROM   project p
 27                              JOIN assignment a using (proj_number)
 28                                                             GROUP  BY proj_number
 29                              ,
 30  NAME
 31  HAVING Count(*) >= 5))
 32  WHERE  Rank <= 3
 33  GROUP  BY proj_number,
 34  NAME
 35  HAVING Sum(Days) >= 60) USING (proj_number)
 36  GROUP  BY proj_number,
 37            NAME;

Project                                                 Total Days Worked
------------------------------------------------------- -----------------
2005 - Project 5                                                      164
2004 - Project 4                                                       99
2006 - Project 6                                                      243

Query 11:
SQL> SELECT *
  2  FROM   (
  3                         SELECT          a.emp_num
  4                                                         || '- '
  5                                                         || a.lname AS "Employee",
  6                                         a.hire_date                AS "Hire Date",
  7                                         nvl(b.NAME,’n/a’)      AS "Department Managed",
  8                                         count(c.super_id)          AS "No of Employees Managed"
  9                         FROM            employee a
 10                         LEFT OUTER JOIN department b
 11                         ON              a.dept_code=b.dept_code
 12                         AND             a.emp_num=b.manager_id
 13                         LEFT OUTER JOIN employee c
 14                         ON              a.emp_num = c.super_id
 15                         GROUP BY        a.emp_num,
 16                                         a.lname,
 17                                         a.hire_date,
 18                                         b.NAME
 19                         ORDER BY        a.hire_date )
 20  WHERE  rownum<=4;

Employee                    Hire Date Department Managed   No of Employees Managed
--------------------------- --------- -------------------- -----------------------
1003- Choksi                11-DEC-16 N/A                                        0
1007- Haria                 10-JUN-17 Marketing                                  1
1001- Parekh                10-NOV-17 N/A                                        4
1008- Thakkar               06-JUN-18 N/A                                        0

Query 12:
SQL> SELECT     Count(client_id)   AS "No.of Clients" ,
  2             count(proj_number) AS "No. of Projects", (
  3             CASE
  4                        WHEN web_address LIKE '%edu' THEN 'edu'
  5                        WHEN web_address LIKE '%gov' THEN 'gov'
  6                        WHEN web_address LIKE '%org' THEN 'org'
  7                        WHEN web_address LIKE '%com' THEN 'com'
  8                        WHEN web_address IS NULL THEN 'Not Available'
  9                        ELSE 'Other'
 10             END) AS "Type"
 11  FROM       project p
 12  RIGHT JOIN client c
 13  using     (client_id)
 14  GROUP BY   (
 15             CASE
 16                        WHEN web_address LIKE '%edu' THEN 'edu'
 17                        WHEN web_address LIKE '%gov' THEN 'gov'
 18                        WHEN web_address LIKE '%org' THEN 'org'
 19                        WHEN web_address LIKE '%com' THEN 'com'
 20                        WHEN web_address IS NULL THEN 'Not Available'
 21                        ELSE 'Other'
 22             END);

No.of Clients No. of Projects Type
------------- --------------- -------------
            2               0 org
            1               1 Not Available
            2               2 edu
            3               2 com
            2               1 gov
            1               0 Other

6 rows selected.


Query 13:
SQL> SELECT b.Emp_num
  2         || '-'
  3         || Initcap(b.Lname)
  4         || ' '
  5         || Initcap(b.Fname) AS "Name",
  6         c.Name              AS "Department",
  7         p.Name              AS "Project"
  8  FROM   assignment a
  9         INNER JOIN employee b
 10                 ON a.Emp_num = b.Emp_num
 11         INNER JOIN department c
 12                 ON b.Dept_code = c.Dept_code
 13         INNER JOIN project p
 14                 ON p.Proj_number = a.Proj_number
 15  GROUP  BY b.Emp_num
 16            || '-'
 17            || Initcap(b.Lname)
 18            || ' '
 19            || Initcap(b.Fname),
 20            c.Name,
 21            p.Name
 22  HAVING Max(Date_assigned) <= ’01-jul-2021’
 23  ORDER  BY 2,
 24            1;

Name                                                           Department           Project
-------------------------------------------------------------- -------------------- ------------
1001-Parekh Niket                                              Administrative       Project 1
1002-Iqbal Anam                                                Administrative       Project 2
1003-Choksi Parth                                              Administrative       Project 2
1007-Haria Jas                                                 Marketing            Project 4
1008-Thakkar Urvish                                            Marketing            Project 5
1009-Muzaffar Seemal                                           Research             Project 5
1004-Kadakia Swapnil                                           Technology           Project 3
1005-Patel Ruhi                                                Technology           Project 4

8 rows selected.

Query 14:
SQL> SELECT Decode(s.Category, NULL, 'Grand Total: ',
  2                            s.Category) AS "Skill Category",
  3         Count(DISTINCT t.Train_num)    AS "Number of Trainings",
  4         Count(DISTINCT p.Proj_number)  AS "Number of Projects"
  5  FROM   skill s
  6         LEFT JOIN training t
  7                ON t.Code = s.Code
  8         LEFT JOIN project p
  9                ON t.Code = p.Code
 10  GROUP  BY grouping sets ( s.Category, ( ) );

Skill Category Number of Trainings Number of Projects
-------------- ------------------- ------------------
Business                         7                  3
Technology                      10                  3
Grand Total:                    17                  6
