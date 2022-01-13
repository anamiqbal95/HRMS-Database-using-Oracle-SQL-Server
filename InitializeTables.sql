
DROP TABLE assignment CASCADE CONSTRAINTS;
Table dropped.

DROP TABLE project CASCADE CONSTRAINTS;
Table dropped.

DROP TABLE training CASCADE CONSTRAINTS;
Table dropped.

DROP TABLE skill CASCADE CONSTRAINTS;
Table dropped.

DROP TABLE client CASCADE CONSTRAINTS;
Table dropped.

DROP TABLE employee CASCADE CONSTRAINTS;
Table dropped.

DROP TABLE department CASCADE CONSTRAINTS;
Table dropped.



CREATE TABLE skill
  (
     code     NUMBER PRIMARY KEY,
     name     VARCHAR2(10) CONSTRAINT skill_name_nn NOT NULL,
     category VARCHAR2(10)
  );
Table created.

CREATE TABLE employee
  (
     emp_num   NUMBER CONSTRAINT employee_emp_num_pk PRIMARY KEY,
     lname     VARCHAR2(10) CONSTRAINT employee_lname_nn NOT NULL,
     fname     VARCHAR2(10) CONSTRAINT employee_fname_nn NOT NULL,
     dob       DATE,
     hire_date DATE DEFAULT SYSDATE,
     super_id  NUMBER,
     dept_code NUMBER,
     CONSTRAINT employee_super_id_fk FOREIGN KEY (super_id) REFERENCES employee
     (emp_num),
     CONSTRAINT employee_dob_ck CHECK (dob<hire_date)
  );
Table created.

CREATE TABLE department
  (
     dept_code  NUMBER CONSTRAINT department_code_pk PRIMARY KEY,
     name       VARCHAR2(20) CONSTRAINT department_name_nn NOT NULL,
     location   VARCHAR2(20),
     phone      NUMBER UNIQUE,
     manager_id NUMBER,
     CONSTRAINT dept_manager_id_fk FOREIGN KEY (manager_id) REFERENC    ES employee (emp_num),
     CONSTRAINT Phone_Unique UNIQUE (Phone)
  );
Table created.

CREATE TABLE training
  (
     train_num     NUMBER CONSTRAINT training_num_pk PRIMARY KEY,
     code          NUMBER,
     emp_num       NUMBER,
     name          VARCHAR2(20) CONSTRAINT training_name_nn NOT NULL,
     date_acquired DATE,
     comments      VARCHAR2(100),
     CONSTRAINT training_code_fk FOREIGN KEY (code) REFERENCES skill (code),
     CONSTRAINT training_emp_num_fk FOREIGN KEY (emp_num) REFERENCES employee (
     emp_num)
  );
Table created.

CREATE TABLE client
  (
     client_id     NUMBER CONSTRAINT client_id_pk PRIMARY KEY,
     name          VARCHAR2(12) CONSTRAINT client_name_nn NOT NULL,
     street        VARCHAR2(20),
     city          VARCHAR2(12),
     state         VARCHAR2(2),
     zip_code      VARCHAR2(5),
     industry      VARCHAR2(12),
     web_address   VARCHAR(30),
     phone         VARCHAR2(12),
     contact_lname VARCHAR(12),
     contact_fname VARCHAR(12),
     CONSTRAINT check_web_address CHECK(web_address LIKE '%.%')
  );
Table created.

CREATE TABLE project
  (
     proj_number NUMBER CONSTRAINT project_number_pk PRIMARY KEY,
     name        VARCHAR2(12) CONSTRAINT proj_name_nn NOT NULL,
     start_date  DATE DEFAULT SYSDATE,
     total_cost  NUMBER,
     dept_code   NUMBER,
     client_id   NUMBER,
     code        NUMBER,
     CONSTRAINT proj_code_fk FOREIGN KEY (code) REFERENCES skill (code),
     CONSTRAINT proj_client_id_fk FOREIGN KEY (client_id) REFERENCES client (
     client_id),
     CONSTRAINT proj_dept_code_fk FOREIGN KEY (dept_code) REFERENCES department
     (dept_code)
  );
Table created.

CREATE TABLE assignment
  (
     assign_num    NUMBER CONSTRAINT assign_number_pk PRIMARY KEY,
     proj_number   NUMBER,
     emp_num       NUMBER,
     date_assigned DATE DEFAULT SYSDATE,
     date_ended    DATE,
     hours_used    NUMBER,
     CONSTRAINT ass_proj_num_fk FOREIGN KEY (proj_number) REFERENCES project (
     proj_number),
     CONSTRAINT ass_emp_num_fk FOREIGN KEY (emp_num) REFERENCES employee (
     emp_num),
     CONSTRAINT date_check CHECK (date_assigned<date_ended)
  );
Table created.

ALTER TABLE employee
  ADD CONSTRAINT emp_dept_code_fk FOREIGN KEY (dept_code) REFERENCES department
  (dept_code); 
Table altered.
