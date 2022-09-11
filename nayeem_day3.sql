--11111111
 create proc sp_showTitleAndAuthor
 as
 begin
	select "Authors Last Name"=au_lname from authors where au_id in (select au_id from titleauthor where title_id = 'BU1032')
 end

 exec sp_showTitleAndAuthor

 --2222222
alter proc sp_showTitleAndAuthor @titleid char(15)
as
begin
	select "Authors Last Name"=au_lname from authors where au_id in (select au_id from titleauthor where title_id = @titleid )
end

exec sp_showTitleAndAuthor 'BU1032'

--33333
create proc sp_updatePrice @titleid char(15)
as
begin
	declare @price money
	select @price=price from titles where title_id = @titleid
	set @price = @price+0.1*@price
	if @price <=20
		update titles set price = @price where title_id = @titleid
end

exec sp_updatePrice 'BU7832'

--task 1
create proc show_item
as
begin
	select "Category" = item_category , "Total number of Items" = sum(item_qoh),"Average Price" = avg(item_price) from Item group by item_category
end

exec show_item

--task 2

create proc cheaper_item @category_name char(10),@price float(12)
as
begin
	select * from Item where item_category = @category_name and item_price<@price
end

exec cheaper_item 'Electrical',50.0

--task 3

alter proc increase_price @category_name char(10), @price float(12)
as
begin
	while (select avg(item_price) from Item where item_category = @category_name) <= @price
	begin
		update Item set item_price = item_price + 0.1*item_price where item_category = @category_name
	end
end

exec increase_price 'Electrical', 60.0

select avg(item_price) from Item where item_category = 'Electrical'
