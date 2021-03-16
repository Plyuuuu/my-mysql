
/**
  查看IO Thread
 */
 show engine  innodb status;

/**
  InnoDB,"","
=====================================
2020-11-12 16:47:33 0x1720 INNODB MONITOR OUTPUT
=====================================
Per second averages calculated from the last 55 seconds
-----------------
BACKGROUND THREAD
-----------------
srv_master_thread loops: 2 srv_active, 0 srv_shutdown, 188710 srv_idle
srv_master_thread log flush and writes: 0
----------
SEMAPHORES
----------
OS WAIT ARRAY INFO: reservation count 11
OS WAIT ARRAY INFO: signal count 11
RW-shared spins 0, rounds 0, OS waits 0
RW-excl spins 0, rounds 0, OS waits 0
RW-sx spins 0, rounds 0, OS waits 0
Spin rounds per wait: 0.00 RW-shared, 0.00 RW-excl, 0.00 RW-sx
------------
TRANSACTIONS
------------
Trx id counter 49416
Purge done for trx's n:o < 49414 undo n:o < 0 state: running but idle
History list length 6
LIST OF TRANSACTIONS FOR EACH SESSION:
---TRANSACTION 283164952844856, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 283164952844016, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
--------
FILE I/O
--------
I/O thread 0 state: wait Windows aio (insert buffer thread)
I/O thread 1 state: wait Windows aio (log thread)
I/O thread 2 state: wait Windows aio (read thread)
I/O thread 3 state: wait Windows aio (read thread)
I/O thread 4 state: wait Windows aio (read thread)
I/O thread 5 state: wait Windows aio (read thread)
I/O thread 6 state: wait Windows aio (write thread)
I/O thread 7 state: wait Windows aio (write thread)
I/O thread 8 state: wait Windows aio (write thread)
I/O thread 9 state: wait Windows aio (write thread)
Pending normal aio reads: [0, 0, 0, 0] , aio writes: [0, 0, 0, 0] ,
 ibuf aio reads:, log i/o's:, sync i/o's:
Pending flushes (fsync) log: 0; buffer pool: 0
1123 OS file reads, 206 OS file writes, 34 OS fsyncs
0.05 reads/s, 16384 avg bytes/read, 0.00 writes/s, 0.00 fsyncs/s
-------------------------------------
INSERT BUFFER AND ADAPTIVE HASH INDEX
-------------------------------------
Ibuf: size 1, free list len 0, seg size 2, 0 merges
merged operations:
 insert 0, delete mark 0, delete 0
discarded operations:
 insert 0, delete mark 0, delete 0
Hash table size 34679, node heap has 0 buffer(s)
Hash table size 34679, node heap has 0 buffer(s)
Hash table size 34679, node heap has 0 buffer(s)
Hash table size 34679, node heap has 0 buffer(s)
Hash table size 34679, node heap has 0 buffer(s)
Hash table size 34679, node heap has 0 buffer(s)
Hash table size 34679, node heap has 1 buffer(s)
Hash table size 34679, node heap has 3 buffer(s)
0.04 hash searches/s, 0.35 non-hash searches/s
---
LOG
---
Log sequence number          28919212
Log buffer assigned up to    28919212
Log buffer completed up to   28919212
Log written up to            28919212
Log flushed up to            28919212
Added dirty pages up to      28919212
Pages flushed up to          28919212
Last checkpoint at           28919212
18 log i/o's done, 0.00 log i/o's/second
----------------------
BUFFER POOL AND MEMORY
----------------------
Total large memory allocated 137363456
Dictionary memory allocated 379205
Buffer pool size   8192
Free buffers       7030
Database pages     1158
Old database pages 447
Modified db pages  0
Pending reads      0
Pending writes: LRU 0, flush list 0, single page 0
Pages made young 0, not young 0
0.00 youngs/s, 0.00 non-youngs/s
Pages read 1017, created 141, written 155
0.00 reads/s, 0.00 creates/s, 0.00 writes/s
Buffer pool hit rate 944 / 1000, young-making rate 0 / 1000 not 0 / 1000
Pages read ahead 0.00/s, evicted without access 0.00/s, Random read ahead 0.00/s
LRU len: 1158, unzip_LRU len: 0
I/O sum[0]:cur[3], unzip sum[0]:cur[0]
--------------
ROW OPERATIONS
--------------
0 queries inside InnoDB, 0 queries in queue
0 read views open inside InnoDB
Process ID=6988, Main thread ID=00000000000022D0 , state=sleeping
Number of rows inserted 0, updated 315, deleted 0, read 4546
0.00 inserts/s, 0.00 updates/s, 0.00 deletes/s, 0.15 reads/s
----------------------------
END OF INNODB MONITOR OUTPUT
============================
"

 */
 /**
   查看日志文件
   I:\From Chrome\MySQL\mysql-8.0.17-winx64\Data\DESKTOP-472TN60.log
  */
 show variables like 'general_log_file';