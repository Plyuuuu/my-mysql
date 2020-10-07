#二、sql99语法
/*
    语法：
        select 查询列表
        from 表1 别名 【连接类型】
        join 表2 别名
        on 连接条件
        【where 筛选条件】
        【group by 分组】
        【having 筛选条件】
        【order by 排序列表】


    分类：
    内连接（★）：inner
    外连接
        左外(★):left 【outer】
        右外(★)：right 【outer】
        全外：full【outer】           MySQL不支持
    交叉连接：cross                   笛卡尔积

*/

#一）内连接
    /*
    语法：

        select 查询列表
        from 表1 别名
        inner join 表2 别名
        on 连接条件;

    分类：
        等值
        非等值
        自连接

    特点：
        ①添加排序、分组、筛选
        ②inner可以省略
        ③ 筛选条件放在where后面，连接条件放在on后面，提高分离性，便于阅读
        ④inner join连接和sql92语法中的等值连接效果是一样的，都是查询多表的交集



*/
use  myemployees;
    #1、等值连接
        #案例1.查询员工名、部门名

        select last_name,department_name
        from employees e
        inner join departments d
        on e.department_id = d.department_id;

        #案例2.查询名字中包含e的员工名和工种名（添加筛选）

        select last_name,job_title
        from employees e
        join jobs j
        on e.job_id = j.job_id
        where last_name like '%e%';

        #3. 查询部门个数>3 的城市名 和部门个数，（添加分组+筛选）

        select city,count(*)
        from locations l
        join departments d
        on l.location_id = d.location_id
        group by city
        having count(*)>3;

        #案例4.查询哪个部门的员工个数>3的部门名和员工个数，并按个数降序（添加排序）

        #①查询每个部门的员工个数
        SELECT COUNT(*),department_name
        FROM employees e
        INNER JOIN departments d
        ON e.`department_id`=d.`department_id`
        GROUP BY department_name;

        #② 在①结果上筛选员工个数>3的记录，并排序

        SELECT COUNT(*) 个数,department_name
        FROM employees e
        INNER JOIN departments d
        ON e.`department_id`=d.`department_id`
        GROUP BY department_name
        HAVING COUNT(*)>3
        ORDER BY COUNT(*) DESC;


        #5.查询员工名、部门名、工种名，并按部门名降序（添加三表连接）

        SELECT last_name,department_name,job_title
        FROM employees e
        INNER JOIN departments d ON e.`department_id`=d.`department_id`
        INNER JOIN jobs j ON e.`job_id` = j.`job_id`

        ORDER BY department_name DESC;

    #二）非等值连接

        #查询员工的工资级别
        select last_name,grade_level
        from employees e
        inner join job_grades j
        on e.salary between j.lowest_sal and j.highest_sal;

        #查询工资级别的个数>20的个数，并且按工资级别降序

        select count(*),grade_level
        from employees e
        inner join job_grades j
        on e.salary between j.lowest_sal and highest_sal
        group by grade_level
        having count(*)>20
        order by grade_level desc ;

     #三）自连接

        #查询员工的名字、上级的名字

        select e.last_name,m.last_name
        from employees e
        inner join employees m
        on e.manager_id = m.employee_id;

        #查询姓名中包含字符k的员工的名字、上级的名字
         SELECT e.last_name,m.last_name
         FROM employees e
         JOIN employees m
         ON e.`manager_id`= m.`employee_id`
         WHERE e.`last_name` LIKE '%k%';


#二、外连接

     /*
     应用场景：用于查询一个表中有，另一个表没有的记录

     特点：
         1、外连接的查询结果为主表中的所有记录
            如果从表中有和它匹配的，则显示匹配的值
            如果从表中没有和它匹配的，则显示null
            外连接查询结果=内连接结果+主表中有而从表没有的记录
         2、左外连接，left join左边的是主表
            右外连接，right join右边的是主表
         3、左外和右外交换两个表的顺序，可以实现同样的效果
         4、全外连接=内连接的结果+表1中有但表2没有的+表2中有但表1没有的
     */

use girls;
        #引入：查询男朋友 不在男神表的的女神名
            select * from boys;
        #左外连接
            select b.*,be.*
            from boys b
            left outer join beauty be
            on b.id = be.boyfriend_id;

            select be.* , b.*
            from beauty be
            left join boys b
            on be.boyfriend_id = b.id
            where b.id is null ;

        #案例1：查询哪个部门没有员工
use myemployees;
        #左外
            select d.*,e.*
            from departments d
            left join employees e
            on d.department_id = e.department_id
            where e.department_id is null ;

             SELECT d.*,e.employee_id
             FROM departments d
             LEFT OUTER JOIN employees e
             ON d.`department_id` = e.`department_id`
             WHERE e.`employee_id` IS NULL;

        #右外
        select d.*,e.department_id
        from employees e
        right outer join departments d
        on e.department_id = d.department_id
        where e.employee_id is null ;


         SELECT d.*,e.employee_id
         FROM employees e
         RIGHT OUTER JOIN departments d
         ON d.`department_id` = e.`department_id`
         WHERE e.`employee_id` IS NULL;


        #全外 MySQL不支持
        use girls;

         /*SELECT b.*,bo.*
         FROM beauty b
         FULL OUTER JOIN boys bo
         ON b.`boyfriend_id` = bo.id;*/


         #交叉连接

         SELECT b.*,bo.*
         FROM beauty b
         CROSS JOIN boys bo;













