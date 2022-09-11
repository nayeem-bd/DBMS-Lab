--select * from authors
--select au_lname,title_id from authors join titleauthor on authors.au_id=titleauthor.au_id
--Task 1
--select title,au_fname from titles join titleauthor on titles.title_id=titleauthor.title_id join authors on titleauthor.au_id = authors.au_id
--Task 2
/*
select title,au_fname,pub_name from titles 
join titleauthor on titles.title_id=titleauthor.title_id
 join authors on titleauthor.au_id = authors.au_id 
 join publishers on titles.pub_id = publishers.pub_id
 */
 --questin2
 -- select au_fname,authors.city,pub_name,publishers.city from authors,publishers where authors.city = publishers.city

 --question3
 --select * from titles where royalty = (select avg(royalty) from titles)
 --select au_fname,royalty from authors,titles where royalty in (select max(royalty) from titles)

 create table CustomerAndSuppliers
 (
	cust_id char(6) primary key check(cust_id like '[CS][0-9][0-9][0-9][0-9][0-9]'),
	cust_fname char(15) not null,
	cust_lname varchar(15),
	cust_address text,
	cust_telno char(12) check(cust_telno like '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	cust_city char(12) default 'Rajshahi' ,
	sales_amnt money check(sales_amnt>=0),
	proc_amnt money check(proc_amnt >=0)
 )

 insert CustomerAndSuppliers (cust_id,cust_fname,cust_lname,cust_address,cust_telno,cust_city,sales_amnt,proc_amnt) 
 values ('C07001','Iqbal','Hossain','221/B Dhanmondi','017-00000000','Dhaka',0,0)
  insert CustomerAndSuppliers (cust_id,cust_fname,cust_lname,cust_address,cust_telno,cust_city,sales_amnt,proc_amnt) 
 values ('S00001','hossain','alex','221/B Dhanmondi','017-00000000','Dhaka',0,0) 
 insert CustomerAndSuppliers (cust_id,cust_fname,cust_lname,cust_address,cust_telno,cust_city,sales_amnt,proc_amnt) 
 values ('C07005','john','alex','221/B Dhanmondi','017-00000000','Dhaka',0,0)


 select * from CustomerAndSuppliers

 create table Item(
	item_id char(6) primary key check(item_id like '[P][0-9][0-9][0-9][0-9][0-9]'),
	item_name char(12),
	item_category char(10) check (item_category in ('Electrical','Mechanical','Software','Books')),
	item_price float(12) check(item_price>=0),
	item_qoh int check(item_qoh>=0),
	item_last_sold date default getdate()
 )
 select * from Item

 insert Item (item_id,item_name,item_category,item_price,item_qoh) values ('P12345','testing','Software',100.0,30)
 insert Item (item_id,item_name,item_category,item_price,item_qoh) values ('P00001','Hdd','Electrical',15.0,20)
 insert Item (item_id,item_name,item_category,item_price,item_qoh) values ('P00002','SSD','Electrical',50.0,10)
 insert Item (item_id,item_name,item_category,item_price,item_qoh) values ('P00003','CPU','Electrical',20.0,15)
 insert Item (item_id,item_name,item_category,item_price,item_qoh) values ('P12315','Google','Software',500.0,30)

 select title,au_fname from titles join titleauthor on titles.title_id=titleauthor.title_id join authors on titleauthor.au_id = authors.au_id
 select * from titles
select * from authors
 select * from titleauthor
 select * from CustomerAndSuppliers

 create table Transactions(
	tran_id char(10) primary key check(tran_id like '[T][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	item_id char(6)  foreign key references Item(item_id),
	cust_id char(6) foreign key references CustomerAndSuppliers(cust_id),
	tran_type char(1) check(tran_type like '[SO]'),
	tran_quantity int check (tran_quantity>=0),
	tran_date datetime default getdate()
 )
 select * from Transactions
 insert Transactions (tran_id,item_id,cust_id,tran_type,tran_quantity) values ('T000000001','P12345','C07001','O',50)


 select * from Item
 insert Transactions (tran_id,item_id,cust_id,tran_type,tran_quantity) values ('T000000008','P00002','S00001','O',2)