

# 添加数据到应急预案

use zhaf1217_test;

insert into contingency_plan(CP_NO, ORG_NO, DEP_NO, CP_NAME, CP_TYPE, RELEASE_TIME, CP_LEVEL, CP_INFO, NOTE, ADJUNCT, INPUT_TIME, INPUT_ORG, INPUT_PEOPLE)
values ('10002','10002','10003','机房爆炸了啊','火','2021-03-24','高','机房着火','机房着火了，赶紧救出硬盘','附件','2021-03-25','研发机构','研发经理') ;

# 删除应急预案

delete from contingency_plan where CP_NO = '4b0f1c61-e963-40ab-b102-4005199eaa25';

# 查询所有应急预案
select CP_NO, ORG_NO, DEP_NO, CP_NAME, CP_TYPE, RELEASE_TIME, CP_LEVEL, CP_INFO, NOTE, ADJUNCT, INPUT_TIME, INPUT_ORG, INPUT_PEOPLE
from contingency_plan; # 100 ms # 60 ms # 77 ms

select * from contingency_plan; # 70 ms # 57 ms # 60 ms

## 分页查询
select * from contingency_plan limit 5;

# 修改
update contingency_plan set ORG_NO = '555',DEP_NO = '555',CP_NAME = '555',CP_TYPE = '555', RELEASE_TIME = '555', CP_LEVEL = '555', CP_INFO = '555', NOTE = '555', ADJUNCT = '555', INPUT_TIME = '555', INPUT_ORG = '555', INPUT_PEOPLE = '555'
where CP_NO = '04a23791-4ce1-4f39-a1f4-5f8c1e0740dc1616574283484';


# 添加数据到员工应急联络
insert into contingency_emp_lia(
                                ecl_no, org_no, dep_no,
                                emp_name, emp_phone, emp_address,
                                con_name, con_phone, con_relation,
                                ecl_note, input_time, input_org,
                                input_people)
VALUES ('1001','1001','1001',
        '1001','1001','1001',
        '1001','1001','1001',
        '1001','1001','1001',
        '1001');

# 修改员工应急联络
update contingency_emp_lia set ORG_NO = '111',DEP_NO = '111',
                               EMP_NAME = '111',EMP_PHONE = '111',EMP_ADDRESS = '111',
                               CON_NAME = '111',CON_PHONE = '111',CON_RELATION = '111',
                               ECL_NOTE = '111',INPUT_TIME = '111',INPUT_ORG = '111',
                               INPUT_PEOPLE = '111'
where ECL_NO = '1001';

# 查询员工应急联络
select ecl_no, org_no, dep_no,
       emp_name, emp_phone, emp_address,
       con_name, con_phone, con_relation,
       ecl_note, input_time, input_org,
       input_people
from contingency_emp_lia;

# 删除员工应急联络
delete from contingency_emp_lia where ECL_NO = '111';










