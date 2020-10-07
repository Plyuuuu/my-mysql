#进阶5：分组查询

/*
语法：

    select 查询列表
    from 表
    【where 筛选条件】
    group by 分组的字段
    【order by 排序的字段】;

特点：
    1、和分组函数一同查询的字段必须是group by后出现的字段
    2、筛选分为两类：分组前筛选和分组后筛选
                    针对的表		    	位置		    连接的关键字
        分组前筛选	原始表				group by前	where

        分组后筛选	group by后的结果集    group by后	having

        问题1：分组函数做筛选能不能放在where后面
        答：不能

        问题2：where——group by——having

        一般来讲，能用分组前筛选的，尽量使用分组前筛选，提高效率

    3、分组可以按单个字段也可以按多个字段
    4、可以搭配着排序使用




*/
use myemployees;
#引入：查询每个部门的员工个数
    select count(*) 员工个数 , department_id from employees group by department_id;

#1.简单的分组

    #案例1：查询每个工种的员工平均工资
        select avg(salary) 平均工资,job_id from employees group by job_id;

        SELECT AVG(salary),job_id
        FROM employees
        GROUP BY job_id;

    #案例2：查询每个位置的部门个数
        select count(*) 部门个数,location_id
        from departments
        group by location_id;

#2、可以实现分组前的筛选

    #案例1：查询邮箱中包含a字符的 每个部门的最高工资

        select max(salary) 最高工资,department_id
        from employees
        where email like '%a%'
        group by department_id;

    #案例2：查询有奖金的每个领导手下员工的平均工资

        select avg(salary),manager_id
        from employees
        where commission_pct is not null
        group by manager_id;

#3、分组后筛选

    #案例1：查询哪个部门的员工个数>5
        # 1、查询每个部门的员工个数
        select count(*),department_id
        from employees
        group by department_id;
        # 2、再求出员工数>5的部门
        select count(*),department_id
        from employees
        group by department_id
        having count(*)>5;

    #案例2：每个工种有奖金的员工 的 最高工资>12000 的工种编号和最高工资

        select job_id,max(salary)
        from employees
        where commission_pct is not null
        group by job_id
        having max(salary)>12000;

    #案例3：领导编号>102的每个领导手下的最低工资大于5000的领导编号和最低工资

        #manager_id>102

        SELECT manager_id,MIN(salary)
        FROM employees
        GROUP BY manager_id
        HAVING MIN(salary)>5000;


#4.添加排序

    #案例：每个工种有奖金的员工的最高工资>6000的工种编号和最高工资,按最高工资升序

    SELECT job_id,MAX(salary) m
    FROM employees
    WHERE commission_pct IS NOT NULL
    GROUP BY job_id
    HAVING m>6000
    ORDER BY m ;




#5.按多个字段分组

    #案例：查询每个工种每个部门的最低工资,并按最低工资降序

    SELECT MIN(salary),job_id,department_id
    FROM employees
    GROUP BY department_id,job_id
    ORDER BY MIN(salary) DESC;












