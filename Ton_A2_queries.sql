SET SQL_SAFE_UPDATES = 0;

-- Question 1 --
drop table if exists order_items_copy;
create table order_items_copy as
select * from order_items;

drop table if exists products_copy;
create table products_copy as
select * from products;

-- Question 2 --
use my_guitar_shop;

insert into products(category_id, product_code, product_name, description, list_price, discount_percent, date_added)
values(4, 'P45B', 'Yamaha P45B', 'The P45 is an 88-note weighted-keyboard digital piano.', '519.99', '10.00', '2019-06-26');

select * from products;

-- Question 3 --
insert into order_items(order_id, product_id, item_price, discount_amount, quantity)
values(9, 11, '519.99','51.99', 2);

select * from order_items;

-- Question 4 --
update products
set list_price = '598.00', discount_percent = '15.00'
where product_id = 11;

select * from products;

-- Question 5 --
update order_items
set item_price = '349.50'
where product_id = 5;

select * from order_items;

-- Question 6 --
delete from order_items
where item_price  = '519.99';

delete from products
where product_code = 'P45B';

select * from order_items;

select * from products;