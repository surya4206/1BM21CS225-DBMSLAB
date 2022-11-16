select * from car order by year asc;
select count(c.reg_num)
from car c,participated p
where c.reg_num=p.reg_num and c.model='Lancer';

delete from participated
where damage_amount < (select t.damage_amount from( select avg(damage_amount) as damage_amount from participated ) t);
select * from participated;

insert into accident values(17,'01-FEB-21','Rajajinagar');
select count(*) from accident
where accident_date like '%21';
