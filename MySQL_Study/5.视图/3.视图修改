#二、视图的修改

#方式一：
/*
create or replace view  视图名
as
查询语句;

*/
    SELECT * FROM myv3 ;

    CREATE OR REPLACE VIEW myv3
    AS
    SELECT AVG(salary),job_id
    FROM employees
    GROUP BY job_id;

#方式二：
/*
语法：
alter view 视图名
as
查询语句;

*/
    ALTER VIEW myv3
    AS
    SELECT * FROM employees;