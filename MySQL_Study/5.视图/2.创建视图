#一、创建视图
/*
    语法：
        create view 视图名
        as
        查询语句;

*/

    #1.查询姓名中包含a字符的员工名、部门名和工种信息
    use myemployees;

    # ①创建视图
    create view myv1 as
        select last_name,department_name,job_title
        from employees e
        inner join departments d  on e.department_id = d.department_id
        join jobs j on e.job_id = j.job_id;

    select * from myv1;

    # ②使用视图
    select * from myv1 where last_name like '%a%';


    #2.查询各部门的平均工资级别
    # ①创建视图查看每个部门的平均工资
    drop view if exists myv2;
    create view myv2 as
        select avg(salary) ag,job_id
        from employees
        group by job_id;

    select * from myv2;

    # ②使用视图
    select myv2.ag,j.grade_level
    from myv2
    inner join job_grades j
    on myv2.ag between j.lowest_sal and j.highest_sal;


    #3.查询平均工资最低的部门信息

    SELECT * FROM myv2 ORDER BY ag LIMIT 1;

    #4.查询平均工资最低的部门名和工资

    CREATE VIEW myv3
    AS
    SELECT * FROM myv2 ORDER BY ag LIMIT 1;



















