--1111111
create trigger trg_test on Item for insert
as 
begin
	print 'Data inserted in Item Table'
end

--22222222
create trigger trg_update_item on Transactions for insert
as
begin
	declare @item_id char(6),@tranamount int,@tran_type char(1)
	select @item_id = item_id ,@tranamount=tran_quantity,@tran_type=tran_type from inserted
	if (@tran_type='S')
		update Item set item_qoh = item_qoh - @tranamount where item_id = @item_id
	else 
		update Item set item_qoh = item_qoh + @tranamount where item_id = @item_id
	print 'Transactions successfully'
end



-- task 1
create trigger trg_update_customer on Transactions for insert
as
begin
	declare @cust_id char(6), @item_id char(6), @tran_type char(1),@tran_quantity int,@amount float(12)
	select @cust_id=cust_id,@item_id=item_id,@tran_type=tran_type,@tran_quantity=tran_quantity from inserted
	set @amount = (select item_price from Item where item_id = @item_id)*@tran_quantity
	if (@tran_type='S')
		update CustomerAndSuppliers set sales_amnt = sales_amnt + @amount where cust_id = @cust_id
	else 
		update CustomerAndSuppliers set proc_amnt = proc_amnt + @amount where cust_id = @cust_id
end

