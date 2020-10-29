#DDL
    /*

        数据定义语言

        库和表的管理

        一、库的管理
             创建、修改、删除
        二、表的管理
             创建、修改、删除

        创建： create
        修改： alter
        删除： drop

    */

#一、库的管理
    #1、库的创建
        /*
        语法：
        create database  [if not exists]库名;
        */


        #案例：创建库Books

        CREATE DATABASE IF NOT EXISTS books ;

        create database if not exists books;

    #2、库的修改
        /*
         RENAME DATABASE books TO 新库名;
         这个语法在mysql 5.1.7中被添加进来，到了5.1.23又去掉了。
         据说有可能丢失数据。还是不要用的好。
         */

        use books;


        #更改库的字符集

        ALTER DATABASE books CHARACTER SET gbk;


    #3、库的删除

        DROP DATABASE IF EXISTS books;

        drop database if exists books;


#二、表的管理
    #1.表的创建 ★

        /*
        语法：
        create table 表名(
            列名 列的类型【(长度) 约束】,
            列名 列的类型【(长度) 约束】,
            列名 列的类型【(长度) 约束】,
            ...
            列名 列的类型【(长度) 约束】


        )

     */

        #案例：创建表Book

            use girls;

            create table book(
              id int,
              bName  varchar(10),
              price double,
              author_id int,
              publishDate datetime
            );

            desc book;#显示表

        #案例：创建表author

            create table if not exists author(
                id int,
                au_name varchar(20),
                nation varchar(20)
            );

            desc author;



    #2.表的修改

        /*
        语法
        alter table 表名 add|drop|modify|change column 列名 【列类型 约束】;

        */

        #①修改列名

        alter table book change column publishDate pubDate datetime;

        ALTER TABLE book CHANGE COLUMN publishdate pubDate DATETIME;


        #②修改列的类型或约束
        ALTER TABLE book MODIFY COLUMN pubdate TIMESTAMP;

        alter table admin add unique(id);
        #或                   constraint(约束)
        alter table admin add constraint  unique (password,username);



        #③添加新列
        ALTER TABLE author ADD COLUMN annual DOUBLE;

        #④删除列

        ALTER TABLE book_author DROP COLUMN  annual;
        #⑤修改表名

        ALTER TABLE author RENAME TO book_author;

        DESC book;

    #3.表的删除

        DROP TABLE IF EXISTS book_author;

        SHOW TABLES;


        #通用的写法：

        DROP DATABASE IF EXISTS 旧库名;
        CREATE DATABASE 新库名;


        DROP TABLE IF EXISTS 旧表名;
        CREATE TABLE  表名(id int);

        drop table if exists author;

    #4.表的复制

        INSERT INTO author VALUES
        (1,'村上春树','日本'),
        (2,'莫言','中国'),
        (3,'冯唐','中国'),
        (4,'金庸','中国');

        SELECT * FROM Author;
        SELECT * FROM copy2;
        #1.仅仅复制表的结构

        CREATE TABLE copy LIKE author;

        #2.复制表的结构+数据
        CREATE TABLE copy2
        SELECT * FROM author;

        #只复制部分数据
        CREATE TABLE copy3
        SELECT id,au_name
        FROM author
        WHERE nation='中国';


        #仅仅复制某些字段

        CREATE TABLE copy4
        SELECT id,au_name
        FROM author
        WHERE 0;
















