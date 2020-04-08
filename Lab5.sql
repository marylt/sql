use ap;

-- Question 2--
select distinct vendor_name, vendor_state
from vendors
join invoices
on vendors.vendor_id = invoices.vendor_id
where invoices.invoice_id in
	(select invoice_line_items.invoice_id
    from invoice_line_items
    where line_item_amount > '3000.00')
order by vendor_name;

-- Question 3--
select vendor_name as 'Vendor Name', 
invoice_number as 'Invoice Number', 
(cast(invoice_date as datetime)) as 'Invoice Date/Time',
concat('$',format(invoice_total, 2)) as 'Invoice Total'
from invoices i
inner join vendors v
on i.vendor_id = v.vendor_id
where invoice_date = 
	(select max(invoice_date)
	from invoices
	where vendor_id = i.vendor_id)
order by vendor_name;

-- Question 4--
select upper(vendor_name) as 'Vendor Name',
	replace(replace(
    replace(vendor_phone, '(' , ''),
    ')', '.'), 
    '-', '.') as 'Vendor Phone',
date_format(invoice_date, '%M %d %Y') as 'Latest Invoice'
from vendors v
inner join invoices i
on i.vendor_id = v.vendor_id
where invoice_date = 
	(select max(invoice_date)
    from invoices
    where vendor_id = i.vendor_id)
order by vendor_name;