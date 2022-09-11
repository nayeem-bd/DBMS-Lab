-- select * from titles where royalty >= 12 and royalty<=24
-- select * from titles order by price desc
-- select max(price) from titles
-- select avg(price) from titles
--select type ,avg(price) from titles group by type 
--having avg(price) > 15
--select * from titles
--select "Name" = SUBSTRING(au_fname,1,1)+'. '+au_lname,phone from authors
--task 3
select type,avg(price) as 'average price',sum(ytd_sales) as 'yearly sales' from titles group by type