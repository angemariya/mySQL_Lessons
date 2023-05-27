select str_to_date("17/05/2023 11:53:30", "%d,%m,%Y %H:%i:%s") as dttm;

use shop;

-- ---->

select * from orders where 
	odate between str_to_date("01/03/2022", "%d/%m/%Y") 
    and str_to_date("31/03/2022", "%d/%m/%Y");
    -- "March 01 2022", "%M %d %Y" - другой формат записи
    
-- ---->

-- дает выборку один месяц до и после указанной даты 
select * from orders where odate between 
	date_add( str_to_date("10/05/2022", "%d/%m/%Y"), interval -1 month) and
	date_add( str_to_date("10/05/2022", "%d/%m/%Y"), interval 1 month);

select extract(week from str_to_date("10/05/2022", "%d/%m/%Y")); -- выдает номер недели в году на указанную дату
select week(str_to_date("10/05/2022", "%d/%m/%Y")); -- короткая запись

-- ---->

-- получить статистику по каждому отдельному месяцу, где слева будет дата 
-- в формате "год-месяц", а справа - число покупок в этом месяце
SELECT 
	concat (year(odate), "-", month(odate)) as "Date",
    count(ORDER_ID)
from orders
group by concat(year(odate), "-", month(odate));

-- ---->

-- найти месяц и год, в котором было сделано больше всего покупок
-- 1 вариант
SELECT month_year, COUNT(*) AS purchase_count
FROM (
    SELECT CONCAT(YEAR(odate), "-", MONTH(odate)) AS month_year
    FROM orders
) AS subquery
GROUP BY month_year
LIMIT 1;

-- 2 вариант 
create view tmp as select
	concat(year(odate), "-", month(odate)) as m,
			count(order_id) as cnt
	from orders
	group by concat(year(odate), "-", month(odate));
select * from tmp where cnt = (select max(cnt) from tmp);
drop view tmp;

-- ---->

-- Определить какие из покупок были совершены в марте
SELECT 
	*
from orders
where month(odate) = "3";

-- найти все покупки, которые были сделаны весной 2022 года
-- 1
select *
from orders
where odate between 
	 str_to_date("01/03/2022", "%d/%m/%Y") and
	 str_to_date("31/05/2022", "%d/%m/%Y");
-- 2
select *
from orders
WHERE YEAR(odate) = 2022 AND MONTH(odate) BETWEEN 3 AND 5;

-- ---->
-- определить, сколько покупок было сделано в июне

select count(order_id) from orders
where YEAR(odate) = 2022 AND MONTH(odate) = 6;

-- ---->
-- определить среднюю стоимость покупок за первое полугодие

select avg(AMT) as "average cost"
from orders
where YEAR(odate) = 2022 AND QUARTER(odate) BETWEEN 1 AND 2;

-- ---->
-- найти все покупки, которые сделали в выходные

select * from orders where 
	weekday(odate) BETWEEN 5 and 6;
    -- weekday(odate) in (5, 6);
    

