select*
from "ACCOUNTS_DATA";

select*
from "region";

select*
from sales_reps;

select *
from "web_events";


--Question 1-- :What is the day that had the highest orders and who was the primary POC

select *
from 
(select "primary_POC", to_char("Highest_sales_week",'day'),"Highest_sales_week", sum("amount") as "sum_total"
 from
(select distinct a.primary_poc "primary_POC", a.id, o.account_id, o.standard_qty "amount", occurred_at "Highest_sales_week"
from "ACCOUNTS_DATA" A
join "orders" o
on a.id = o.account_id) as "table_one"
group by "primary_POC", "Highest_sales_week"
order by "sum_total" asc) as "table_two";







Question 3 
select*
from
(select distinct ("name"),"week_day"), to_char "week_day", 'month') "months, to_char"
from
(select s.name, o.occurred_at "week_day", o.total  "total_sales"
from "sales_reps" s
join "orders" o
on s.region_id=o.id) as "table_one"
group by "name", "week_day"
order by "sales_total" dec);