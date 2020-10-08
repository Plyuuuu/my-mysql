#视图
/*
含义：虚拟表，和普通表一样使用
mysql5.1版本出现的新特性，是通过表动态生成的数据

比如：舞蹈班和普通班级的对比
	创建语法的关键字	是否实际占用物理空间	使用

视图	create view		只是保存了sql逻辑	增删改查，只是一般不能增删改

表	create table		保存了数据		增删改查


*/
/*
    #案例：查询姓张的学生名和专业名
    SELECT stuname,majorname
    FROM stuinfo s
    INNER JOIN major m ON s.`majorid`= m.`id`
    WHERE s.`stuname` LIKE '张%';

    CREATE VIEW v1
    AS
    SELECT stuname,majorname
    FROM stuinfo s
    INNER JOIN major m ON s.`majorid`= m.`id`;

    SELECT * FROM v1 WHERE stuname LIKE '张%';

*/



