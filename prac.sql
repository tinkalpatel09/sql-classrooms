drop table book CASCADE CONSTRAINTS;

create table Book
(
  ISBN number,
  Title varchar(40),
  Publisher_ID number,
  Publication_Date date
); 