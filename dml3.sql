drop index emp_dept_id_index;

create index emp_dept_id_index on emp(department_id);

select index_name from user_indexes;