#流程控制结构
/*
顺序、分支、循环

*/

#一、分支结构
    #1.if函数
    /*
    语法：if(条件,值1，值2)
    功能：实现双分支
    应用在begin end中或外面

    */

    #2.case结构
    /*
    语法：
    情况1：类似于switch
    case 变量或表达式
    when 值1 then 语句1;
    when 值2 then 语句2;
    ...
    else 语句n;
    end

    情况2：
    case
    when 条件1 then 语句1;
    when 条件2 then 语句2;
    ...
    else 语句n;
    end

    应用在begin end 中或外面


    */

    #3.if结构

    /*
    语法：
    if 条件1 then 语句1;
    elseif 条件2 then 语句2;
    ....
    else 语句n;
    end if;
    功能：类似于多重if

    只能应用在begin end 中

*/

    #案例1：创建函数，实现传入成绩，如果成绩>90,返回A，如果成绩>80,返回B，如果成绩>60,返回C，否则返回D
    use myemployees;
    delimiter $
    CREATE FUNCTION test_if(score FLOAT) RETURNS CHAR
    BEGIN
        DECLARE ch CHAR DEFAULT 'A';
        IF score>90 THEN SET ch='A';
        ELSEIF score>80 THEN SET ch='B';
        ELSEIF score>60 THEN SET ch='C';
        ELSE SET ch='D';
        END IF;
        RETURN ch;


    END $

    SELECT test_if(87)$

    #案例2：创建存储过程，如果工资<2000,则删除，如果5000>工资>2000,则涨工资1000，否则涨工资500


    CREATE PROCEDURE test_if_pro(IN sal DOUBLE)
    BEGIN
        IF sal<2000 THEN DELETE FROM employees WHERE employees.salary=sal;
        ELSEIF sal>=2000 AND sal<5000 THEN UPDATE employees SET salary=salary+1000 WHERE employees.`salary`=sal;
        ELSE UPDATE employees SET salary=salary+500 WHERE employees.`salary`=sal;
        END IF;

    END $

    CALL test_if_pro(2100)$

    #案例1：创建函数，实现传入成绩，如果成绩>90,返回A，如果成绩>80,返回B，如果成绩>60,返回C，否则返回D

    CREATE FUNCTION test_case(score FLOAT) RETURNS CHAR
    BEGIN
        DECLARE ch CHAR DEFAULT 'A';

        CASE
        WHEN score>90 THEN SET ch='A';
        WHEN score>80 THEN SET ch='B';
        WHEN score>60 THEN SET ch='C';
        ELSE SET ch='D';
        END CASE;

        RETURN ch;
    END $

    SELECT test_case(56)$
























