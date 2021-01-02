drop table dept cascade constraint;
drop table emp cascade constraint;
drop view empolyees_view cascade constraint;

create table Dept (id number(7),name varchar(25));

insert into dept
select department_id,name from department; 

select * from dept;

create table emp as select * from employee;
select * from emp;

select  table_name from user_tables;

create view empolyees_view as select employee_id,first_name||' '|| last_name
as employee_names,department_id from employee; 

create  or replace view empolyees_view as select employee_id,first_name||' '|| last_name
as employee,department_id from employee; 