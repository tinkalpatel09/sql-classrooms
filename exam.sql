--CONNECT / AS SYSDBA
--CREATE USER c##exam IDENTIFIED BY exam
--DEFAULT TABLESPACE USERS;
--GRANT CONNECT, RESOURCE TO c##exam;
--GRANT ALL PRIVILEGES TO c##exam;
--CONNECT c##exam/exam

--Question 1:

DROP TABLE Student CASCADE CONSTRAINTS;
DROP TABLE Exam CASCADE CONSTRAINTS;
DROP TABLE Evaluation CASCADE CONSTRAINTS;
DROP SEQUENCE Student_ID_SEQ;

--Question 2:
CREATE TABLE Student (Student_ID number,
					last_Name VARCHAR2(25),
					first_Name VARCHAR2(25));
					
CREATE TABLE Exam (exam_ID number,
					Name VARCHAR2(25));					
	
CREATE TABLE Evaluation (student_ID number,
					exam_ID number,
					grade number);						
			
--Question 3:
			
ALTER TABLE Student ADD CONSTRAINTS STUDENT_STUDENTID_PK PRIMARY KEY(Student_ID);
ALTER TABLE Exam	ADD CONSTRAINTS EXAM_EXAMID_PK PRIMARY KEY(exam_ID); 				
					
--Question 3:

ALTER TABLE Evaluation ADD CONSTRAINTS EVALUATION_STUDENTID_FK FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID);
ALTER TABLE Evaluation ADD CONSTRAINTS EVALUATION_examID_FK FOREIGN KEY (exam_ID) REFERENCES Exam(exam_ID);

--Question 4:
ALTER TABLE Exam ADD CONSTRAINTS EXAM_NAME_CK CHECK (Name IN('Midterm','FinalExam','Project'));
ALTER TABLE Evaluation ADD CONSTRAINTS Evaluation_grade_ck CHECK (grade>=0 AND grade<100 );
			
--Question 5:					

ALTER TABLE Student ADD (Status VARCHAR2(15));					
--Question 6:
create sequence Student_ID_SEQ
 start with 1011
 increment by 10;

--Exercise 02:
 
INSERT INTO Student (Student_ID,last_Name ,first_Name,Status )VALUES (Student_ID_SEQ.NEXTVAL,'Tony','Smith',null);
INSERT INTO Student (Student_ID,last_Name ,first_Name,Status )VALUES (Student_ID_SEQ.NEXTVAL,'Helen','Roy',null);

insert into Exam (exam_ID ,Name) values (01,'Midterm');
insert into Exam (exam_ID ,Name) values (02,'Project');
insert into Exam (exam_ID ,Name) values (03,'FinalExam');

insert into Evaluation (student_ID ,exam_ID,grade) values (1011,01,75);
insert into Evaluation (student_ID ,exam_ID,grade) values (1021,01,90);
insert into Evaluation (student_ID ,exam_ID,grade) values (1011,02,87);
insert into Evaluation (student_ID ,exam_ID,grade) values (1021,02,85);
					
					
