-- Question 1 --
select product_name, 
count(*) as 'num_orders', 
sum(quantity) as 'num_products', 
concat('$', format(avg(discount_amount), 2)) as 'avg_discount'
from products p
join order_items oi
using (product_id)
join orders o
on o.order_id = OI.order_id
group by product_id

union

select null as 'product_name',
count(*) as 'num_orders',
sum(quantity) as 'num_products',
concat('$', format(avg(discount_amount), 2)) as 'avg_discount'
from products p 
join order_items oi 
using (product_id)
join orders o
on o.order_id = OI.order_id
order by product_name is null, product_name;

-- Question 2 --
select concat('$', products.list_price) as 'Product List Price',
products.product_name as 'Product',
products.description as 'Description'
from products
where products.list_price <= (select AVG(products.list_price) from categories
join products using (category_id) where category_id = 1)
order by products.list_price, products.product_name;

-- Question 3 --
select concat(last_name, ',' , first_name) as 'Customer Name',
count(distinct o.order_id) as num_orders,
count(oi.item_id) as num_items,
concat('$', round(sum(quantity*(item_price-discount_amount)), 2)) as order_total
from customers c, 
orders o,
order_items oi
where c.customer_id = o.customer_id
and o.order_id = oi.order_id
and o.ship_date is not null
group by c.customer_id
order by num_items desc, sum(quantity*(item_price - discount_amount)) desc;

-- Question 4 --
-- see attached PDF file on assignment submission --
