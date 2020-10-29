#五、视图的更新
use myemployees;

    CREATE OR REPLACE VIEW myv1
    AS
    SELECT last_name,email,salary*12*(1+IFNULL(commission_pct,0)) "annual salary"
    FROM employees;

    CREATE OR REPLACE VIEW myv1
    AS
    SELECT last_name,email
    FROM employees;


    SELECT * FROM myv1;
    SELECT last_name 'e.last_name',email 'e.email'FROM employees;
    select * from employees;

    #1.插入   ======>会改变原表数据

    INSERT INTO myv1 VALUES('张飞','zf@qq.com');

    #2.修改
    UPDATE myv1 SET last_name = '张无忌' WHERE last_name='张飞';

    #3.删除
    DELETE FROM myv1 WHERE last_name = '张无忌';


    #具备以下特点的视图不允许更新


    #①包含以下关键字的sql语句：分组函数、distinct、group  by、having、union或者union all

    CREATE OR REPLACE VIEW myv1
    AS
    SELECT MAX(salary) m,department_id
    FROM employees
    GROUP BY department_id;

    SELECT * FROM myv1;

    #更新 ====>报错
    UPDATE myv1 SET m=9000 WHERE department_id=10;


    #②常量视图
    CREATE OR REPLACE VIEW myv2
    AS

    SELECT 'john' NAME;

    SELECT * FROM myv2;

    #更新
    UPDATE myv2 SET NAME='lucy';

    #③Select中包含子查询

    CREATE OR REPLACE VIEW myv3
    AS

    SELECT department_id,(SELECT MAX(salary) FROM employees) 最高工资
    FROM departments;

    #更新
    SELECT * FROM myv3;
    UPDATE myv3 SET 最高工资=100000;


    #④join
    CREATE OR REPLACE VIEW myv4
    AS

    SELECT last_name,department_name
    FROM employees e
    JOIN departments d
    ON e.department_id  = d.department_id;

    #更新

    SELECT * FROM myv4;
    UPDATE myv4 SET last_name  = '张飞' WHERE last_name='Whalen';
    INSERT INTO myv4 VALUES('陈真','xxxx');



    #⑤from一个不能更新的视图
    CREATE OR REPLACE VIEW myv5
    AS

    SELECT * FROM myv3;

    #更新

    SELECT * FROM myv5;

    UPDATE myv5 SET 最高工资=10000 WHERE department_id=60;



    #⑥where子句的子查询引用了from子句中的表

    CREATE OR REPLACE VIEW myv6
    AS

    SELECT last_name,email,salary
    FROM employees
    WHERE employee_id IN(
        SELECT  manager_id
        FROM employees
        WHERE manager_id IS NOT NULL
    );

    #更新
    SELECT * FROM myv6;
    UPDATE myv6 SET salary=10000 WHERE last_name = 'k_ing';
