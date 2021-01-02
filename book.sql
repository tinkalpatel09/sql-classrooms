PROMPT  Question 1: DROP TABLES
DROP TABLE WRITEN_BY CASCADE CONSTRAINTS;
DROP TABLE BOOK CASCADE CONSTRAINTS;
DROP TABLE PUBLISHER CASCADE CONSTRAINTS;
DROP TABLE AUTHOR CASCADE CONSTRAINTS;

PROMPT  Question 2: CREATE TABLES
CREATE TABLE AUTHOR (Author_ID CHAR(8),
					First_Name VARCHAR2(20),
					Last_Name VARCHAR2(20));

CREATE TABLE PUBLISHER (Publisher_ID NUMBER,
						Publisher_Name VARCHAR2(20),
						Publisher_Address VARCHAR2(50));
				

CREATE TABLE BOOK (ISBN NUMBER,
					Title VARCHAR2(40),
					Publisher_ID NUMBER,
					Publication_Date DATE);
				
CREATE TABLE WRITEN_BY (ISBN NUMBER,
						Author_ID CHAR(8));
				
PROMPT  Question 3: Add Primary Keys
ALTER TABLE PUBLISHER  ADD CONSTRAINTS PUBLISHER_PubliID_PK PRIMARY KEY (Publisher_ID);				
ALTER TABLE AUTHOR ADD CONSTRAINTS AUTHOR_AuthorID_PK PRIMARY KEY (Author_ID);		
ALTER TABLE BOOK ADD CONSTRAINTS BOOK_ISBM_PK PRIMARY KEY (ISBN);
ALTER TABLE WRITEN_BY ADD CONSTRAINTS WRITENBY_ISBN_PK PRIMARY KEY (ISBN);

PROMPT  Question 4: Add FOREIGN Keys 
ALTER TABLE BOOK ADD CONSTRAINTS BOOK_PublisID_FK FOREIGN KEY (Publisher_ID) REFERENCES PUBLISHER (Publisher_ID);
ALTER TABLE WRITEN_BY ADD CONSTRAINTS WRITENBY_ISBN_FK FOREIGN KEY (ISBN) REFERENCES BOOK (ISBN);
ALTER TABLE WRITEN_BY ADD CONSTRAINTS WRITENBY_AuthorID_FK FOREIGN KEY (Author_ID) REFERENCES AUTHOR (Author_ID);			

PROMPT  Question 5: Add Column
ALTER TABLE BOOK ADD (Book_Category VARCHAR2(30));

PROMPT  Question 6: Modify Column
ALTER TABLE PUBLISHER MODIFY (Publisher_Name VARCHAR2(30));

PROMPT  Question 7: Add Check constraint
ALTER TABLE BOOK ADD CONSTRAINTS BOOK_BookCategory_CK CHECK (Book_Category IN('Computers','Math','Science'));





DELETE FROM book cascade;
DELETE FROM Author cascade;
DELETE FROM Writen_By cascade;
DELETE FROM Publisher cascade;

-- 4-- TABLE PUBLISHER
DROP SEQUENCE SEQ_Publisher_ID;
CREATE SEQUENCE SEQ_Publisher_ID INCREMENT BY 5 START WITH 100;


INSERT INTO Publisher (Publisher_ID, Publisher_Name, Publisher_Address) VALUES 
(SEQ_Publisher_ID.NEXTVAL, 'Business Plus',' 7th Avenue Suite 1200 New York, NY');
INSERT INTO Publisher (Publisher_ID, Publisher_Name, Publisher_Address) VALUES 
(SEQ_Publisher_ID.NEXTVAL, 'Feiwel and Friends', '50 Bedford Square, London, UK');
INSERT INTO Publisher (Publisher_ID, Publisher_Name, Publisher_Address) VALUES 
(SEQ_Publisher_ID.NEXTVAL, 'The Crown Group' , '57th Street. New_York, NY');

-- 1-- INSERT DATA TABLE BOOK
ALTER TABLE book MODIFY (Title VARCHAR2(50) );
INSERT INTO book (ISBN,Title, Publisher_ID, Publication_Date, Book_Category) VALUES 
(1111111111, 'Get Rich Really Fast',100, TO_DATE('Apr 30, 2008', 'Mon DD, YYYY'), 'Science');
INSERT INTO book (ISBN,Title, Publisher_ID, Publication_Date, Book_Category) VALUES 
(2222222222, 'Introduction to C++',110,null, 'Computers');
INSERT INTO book (ISBN,Title, Publisher_ID, Publication_Date, Book_Category) VALUES 
(3333333333, 'Bedtime Math: A Fun Excuse to Stay Up Late',105,TO_DATE('Jun 25, 2013', 'Mon DD, YYYY'), 'Math');
INSERT INTO book (ISBN,Title, Publisher_ID, Publication_Date, Book_Category) VALUES 
(4444444444, '30 More Math Mysteries Kids',100,TO_DATE('Jan 1, 2018', 'Mon DD, YYYY'), 'Math');
INSERT INTO book (ISBN,Title, Publisher_ID, Publication_Date, Book_Category) VALUES  
(5555555555, 'Milloionaire by Thirty',100,TO_DATE('January 3, 2015', 'Mon DD, YYYY'), 'Science'); 

-- 2-- TABLE AUTHOR

INSERT INTO Author (Author_ID,Last_Name, First_Name) VALUES 
('SC123456', 'Scammer', 'Emma');
INSERT INTO Author (Author_ID,Last_Name, First_Name) VALUES 
('OV123456', 'Overdeck', 'Laura');
INSERT INTO Author (Author_ID,Last_Name, First_Name) VALUES 
('BL123456', 'Blissford', 'Moon-Light');
 
-- 3-- TABLE Written_By
INSERT INTO Writen_By (ISBN, Author_ID) VALUES (1111111111, 'SC123456');
INSERT INTO Writen_By (ISBN, Author_ID) VALUES (2222222222, 'BL123456');
INSERT INTO Writen_By (ISBN, Author_ID) VALUES (3333333333, 'OV123456');
INSERT INTO Writen_By (ISBN, Author_ID) VALUES (4444444444, 'OV123456');
INSERT INTO Writen_By (ISBN, Author_ID) VALUES (5555555555, 'SC123456');

					