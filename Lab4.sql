-- Question 2--
select vendor_name,
concat('$', format(sum(invoice_total), 2)) as invoice_total_sum
from vendors inner join invoices using(vendor_id)
group by vendor_id
order by vendor_name;

-- Question 3--
select vendor_name,
count(invoice_total) as invoice_count,
concat('$', format(sum(invoice_total), 2)) as invoice_total_sum,
concat('$', format(avg(invoice_total), 2)) as invoice_average
from vendors inner join invoices using(vendor_id)
group by vendor_name
order by invoice_count desc;

-- Question 4--
select vendor_name, count(distinct account_number) as number_of_accounts
from vendors
inner join invoices using(vendor_id)
inner join invoice_line_items using(invoice_id)
group by vendor_id
having number_of_accounts > 1;

-- Question 5--
select distinct vendor_name
from vendors
where vendor_id in
	(select distinct vendor_id from invoices)
order by vendor_name;

-- Question 6--
select avg(payment_total) from invoices
where payment_total > 0;

select invoice_number, invoice_total from invoices
where payment_total > 
	(select avg(payment_total) from invoices
	where payment_total > 0)
order by invoice_total desc;

