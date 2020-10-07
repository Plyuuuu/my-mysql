#进阶6：连接查询
/*
含义：又称多表查询，当查询的字段来自于多个表时，就会用到连接查询

笛卡尔乘积现象：表1 有m行，表2有n行，结果=m*n行

发生原因：没有有效的连接条件
如何避免：添加有效的连接条件

分类：

	按年代分类：
	sql92标准:仅仅支持内连接
	sql99标准【推荐】：支持内连接+外连接（左外和右外）+交叉连接

	按功能分类：
		内连接：
			等值连接
			非等值连接
			自连接
		外连接：
			左外连接
			右外连接
			全外连接

		交叉连接


*/
use girls;
use myemployees;
#一、sql92标准
    #1、等值连接
        /*

        ① 多表等值连接的结果为多表的交集部分
        ② n表连接，至少需要n-1个连接条件
        ③ 多表的顺序没有要求
        ④ 一般需要为表起别名
        ⑤ 可以搭配前面介绍的所有子句使用，比如排序、分组、筛选


        */

            #案例1：查询女神名和对应的男神名

               /* select name,boyName
                from beauty,boys
                where beauty.boyfriend_id <=> boys.id;

                SELECT NAME,boyName
                FROM boys,beauty
                WHERE beauty.boyfriend_id = boys.id;*/


            #案例2：查询员工名和对应的部门名

                select first_name,department_name
                from employees,departments
                where employees.department_id = departments.department_id;

        #2、为表起别名
            /*
            ①提高语句的简洁度
            ②区分多个重名的字段

            注意：如果为表起了别名，则查询的字段就  不能使用原来的表名  去限定

            */
            #查询员工名、工种号、工种名

                select e.first_name,e.job_id,j.job_title
                from employees e ,jobs j
                where e.job_id = j.job_id
                order by e.salary;

        #3、两个表的顺序是否可以调换 ====》是

            #查询员工名、工种号、工种名

                SELECT e.first_name,e.job_id,j.job_title
                FROM jobs j,employees e
                WHERE e.`job_id`=j.`job_id`
                order by e.salary;


        #4、可以加筛选

            #案例：查询有奖金的员工名、部门名
                select first_name,department_name
                from employees e,departments d
                where e.department_id = d.department_id
                and e.commission_pct is not null;

            #案例2：查询城市名中第二个字符为o的部门名和城市名

                select department_name,city
                from departments d,locations l
                where d.location_id = l.location_id
                and  l.city like '_o%';

        #5、可以加分组

            #案例1：查询每个城市的部门个数
            select city,count(*)
            from locations l,departments d
            where d.location_id = l.location_id
            group by l.city;


            #案例2：查询有奖金的每个部门的部门名和部门的领导编号和该部门的最低工资
            SELECT department_name,d.`manager_id`,MIN(salary)
            FROM departments d,employees e
            WHERE d.`department_id`=e.`department_id`
            AND commission_pct IS NOT NULL
            GROUP BY department_name,d.`manager_id`;


        #6、可以加排序


            #案例：查询每个工种的工种名和员工的个数，并且按员工个数降序
                select job_title,count(*)
                from jobs j,employees e
                where e.job_id = j.job_id
                group by  j.job_id
                order by count(*);

                SELECT job_title,COUNT(*)
                FROM employees e,jobs j
                WHERE e.`job_id`=j.`job_id`
                GROUP BY job_title
                ORDER BY COUNT(*) DESC;


        #7、可以实现三表连接？

            #案例：查询员工名、部门名和所在的城市
                select first_name,department_name,city
                from employees e,departments d,locations l
                where e.department_id = d.department_id and d.location_id = l.location_id;


    #2、非等值连接


         #案例1：查询员工的工资和工资级别

            SELECT salary,grade_level
            FROM employees e,job_grades g
            WHERE salary BETWEEN g.`lowest_sal` AND g.`highest_sal`;
            #AND g.`grade_level`='A';

    #3、自连接



        #案例：查询 员工名和上级的名称

        select e.first_name,m.first_name
        from employees e ,employees m
        where e.manager_id = m.employee_id;

        SELECT e.employee_id,e.last_name,m.employee_id,m.last_name
        FROM employees e,employees m
        WHERE e.`manager_id`=m.`employee_id`;
