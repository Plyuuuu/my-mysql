/*
    查看MySQL提供的所有存储引擎

    comment:评论
    storage:存储
    MyISAM,YES,MyISAM storage engine
    InnoDB,DEFAULT,"Supports transactions, row-level locking, and foreign keys"

*/
show engines;

/*
    查看 MySQL 默认的存储引擎
 */
show variables like '%storage_engine%';

/*
   查看表的存储引擎
 */

use girls;

show table status like 'admin';

