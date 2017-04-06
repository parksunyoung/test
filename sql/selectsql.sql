select count(*) from IS_MASTER;

insert into IS_MASTER VALUES(seq_master_no.nextval, 'name', 'eng_name', 'han_name', 'jumin_no', '1', 'last_school', 'major', 'gradu_date', 'lag', 'licence1', 'licence2', 'licence3', 'tech_lev', 'address', 'work_date', '1', 'image', '1', 'phone', 'email');

select * from (select rownum as rn, Kor_name as korName,jumin_no , sex, major, tech_lev, state, no from IS_MASTER order by no desc) 
where rn<=2*3 and rn>(2-1)*3;
			
			
			
select * 
from ( select rownum as rn, Kor_name as korName,jumin_no as juminNo , sex, major, tech_lev as techLev, state, no 
 from IS_MASTER order by no desc)
where  techLev like '%tech%' and rn<=2*4 and rn>(2-1)*4;
			
			
commit;