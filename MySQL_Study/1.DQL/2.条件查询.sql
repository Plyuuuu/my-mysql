#进阶2：条件查询
/*

语法：
	select
		查询列表
	from
		表名
	where
		筛选条件;

分类：
	一、按条件表达式筛选

	简单条件运算符：> < = != <>(不等于) >= <=

	二、按逻辑表达式筛选
	逻辑运算符：
	作用：用于连接条件表达式
		&& || !
		and or not

	&&和and：两个条件都为true，结果为true，反之为false
	||或or： 只要有一个条件为true，结果为true，反之为false
	!或not： 如果连接的条件本身为false，结果为true，反之为false

	三、模糊查询
		like
		between and
		in
		is null

*/
#一、按条件表达式筛选

    #案例1：查询工资>12000的员工信息
    use myemployees;

    select *
    from employees
    where salary>12000;

    #案例2：查询部门编号不等于90号的员工名和部门编号
    select first_name,department_id
    from employees
    where department_id != 90;

#二、按逻辑表达式筛选

    #案例1：查询工资z在10000到20000之间的员工名、工资以及奖金

        select first_name,salary,commission_pct
        from employees
        where salary>=10000 and salary <= 20000;

    #案例2：查询部门编号不是在90到110之间，或者工资高于15000的员工信息
        SELECT
            *
        FROM
            employees
        WHERE
            NOT(department_id>=90 AND  department_id<=110) OR salary>15000;


#三、模糊查询
/*
    like

    between and
    in
    is null|is not null

*/

#1.like
    /*
    特点：
    ①一般和通配符搭配使用
        通配符：
        % 任意多个字符,包含0个字符
        _ 任意单个字符
    */

    #案例1：查询员工名中包含字符a的员工信息
        select *
        from employees
        where first_name like '%a%';

    #案例2：查询员工名中第三个字符为e，第五个字符为l的员工名和工资

        select first_name,salary
        from employees
        where first_name like '__e_l%';

    #案例3：查询员工名中第二个字符为_的员工名

        select last_name
        from employees
        where last_name like '_$_%' escape '$'; # escape

#2.between and
    /*
    ①使用between and 可以提高语句的简洁度
    ②包含临界值
    ③两个临界值不要调换顺序

    */
    #案例1：查询员工编号在100到120之间的员工信息

        select *
        from employees
        where employee_id between 100 and 120;

        select *
        from employees
        where employee_id between 120 and 100;  # 错误，要前面的值比后面的小

#3.in
/*
含义：判断某字段的值是否属于in列表中的某一项
特点：
	①使用in提高语句简洁度
	②in列表的值类型必须一致或兼容
	③in列表中不支持通配符


*/
    #案例：查询员工的工种编号是 IT_PROG、AD_VP、AD_PRES中的一个员工名和工种编号

    select first_name,job_id
    from employees
    where job_id in ('IT_PROG','AD_VO','AD_PRES');

#4、is null
    /*
    =或<>不能用于判断null值
    is null或is not null 可以判断null值

    */


    #案例1：查询没有奖金的员工名和奖金率
        select first_name,commission_pct
        from employees
        where commission_pct is null ;

    #案例2：查询有奖金的员工名和奖金率
        select first_name,commission_pct
        from employees
        where commission_pct is not null ;


#安全等于  <=>


    #案例1：查询没有奖金的员工名和奖金率

        select first_name,commission_pct
        from employees
        where commission_pct <=> null;

    #案例2：查询工资为12000的员工信息

        select *
        from employees
        where salary <=> 12000;

#is null pk <=>
/*
    IS NULL:仅仅可以判断NULL值，可读性较高，建议使用
    <=>    :既可以判断NULL值，又可以判断普通的数值，可读性较低
*/