#二、循环结构
/*
分类：
    while、loop、repeat

    循环控制：

        iterate类似于 continue，继续，结束本次循环，继续下一次
        leave 类似于  break，跳出，结束当前所在的循环

*/

    #1.while
        /*

        语法：

        【标签:】while 循环条件 do
            循环体;
        end while【 标签】;

        联想：

        while(循环条件){

            循环体;
        }

        */

    #2.loop
        /*

        语法：
        【标签:】loop
            循环体;
        end loop 【标签】;

        可以用来模拟简单的死循环



        */

    #3.repeat
        /*
        语法：
        【标签：】repeat
            循环体;
        until 结束循环的条件
        end repeat 【标签】;


*/
    use girls;
    delimiter $
    #1.没有添加循环控制语句
    #案例：批量插入，根据次数插入到admin表中多条记录
    DROP PROCEDURE pro_while1$
    CREATE PROCEDURE pro_while1(IN insertCount INT)
    BEGIN
        DECLARE i INT DEFAULT 1;
        WHILE i<=insertCount DO
            INSERT INTO admin(username,`password`) VALUES(CONCAT('Rose',i),'666');
            SET i=i+1;
        END WHILE;

    END $

    CALL pro_while1(100)$


    /*

    int i=1;
    while(i<=insertcount){

        //插入

        i++;

    }

    */


    #2.添加leave语句

    #案例：批量插入，根据次数插入到admin表中多条记录，如果次数>20则停止
    TRUNCATE TABLE admin$
    DROP PROCEDURE test_while1$
    CREATE PROCEDURE test_while1(IN insertCount INT)
    BEGIN
        DECLARE i INT DEFAULT 1;
        a:WHILE i<=insertCount DO
            INSERT INTO admin(username,`password`) VALUES(CONCAT('xiaohua',i),'0000');
            IF i>=20 THEN LEAVE a;
            END IF;
            SET i=i+1;
        END WHILE a;
    END $


    CALL test_while1(100)$


    #3.添加iterate语句

    #案例：批量插入，根据次数插入到admin表中多条记录，只插入偶数次
    TRUNCATE TABLE admin$
    DROP PROCEDURE test_while1$
    CREATE PROCEDURE test_while1(IN insertCount INT)
    BEGIN
        DECLARE i INT DEFAULT 0;
        a:WHILE i<=insertCount DO
            SET i=i+1;
            IF MOD(i,2)!=0 THEN ITERATE a;
            END IF;

            INSERT INTO admin(username,`password`) VALUES(CONCAT('xiaohua',i),'0000');

        END WHILE a;
    END $


    CALL test_while1(100)$

    /*

    int i=0;
    while(i<=insertCount){
        i++;
        if(i%2==0){
            continue;
        }
        插入

    }

    */
