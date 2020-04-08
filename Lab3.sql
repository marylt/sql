
-- Question 3 --
use om;
create table orders_copy as
    select *
    from orders;
create table items_copy as
	select *
    from items;

-- Question 4 --
use om;
set sql_safe_updates = 0;
delete from orders_copy
where shipped_date is null;

-- Question 5 --
use om;
update items_copy
set unit_price = (unit_price + (unit_price*.20))
where artist = 'Umami';

-- Question 6 --
insert items_copy (item_id, title, artist, unit_price)
values (17,'A Love So Far Away','Weathermens',25.00);

-- Test Copy Tables --
select * from orders_copy;
select * from items_copy;