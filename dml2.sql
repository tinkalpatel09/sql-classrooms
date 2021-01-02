drop view salary_view;
drop sequence dept_id_seq;


create view salary_view as select last_name as employeename,salary,commission from employee;

create sequence dept_id_seq 
increment by 10
start with 200
maxvalue 1000;

select * from user_sequences;

insert into dept(id,name) values (dept_id_seq.nextval,'education');
insert into dept(id,name) values (dept_id_seq.nextval,'administration');
select * from dept;