-- Answer 1--
use om;
select concat(customer_last_name, ", ", customer_first_name) as 'Customer Name', 
concat("Contact #: ", left(customer_phone,3), "-", mid(customer_phone,4,3), "-", right(customer_phone,4)) as 'Customer Contact Number',
concat(customer_address, ", ", customer_city, ", ", customer_state, ", ", customer_zip) as 'Customer Address'
from customers
where customer_last_name > 'B' and customer_last_name < 'F'
order by customer_last_name;

-- Answer 2 --
use om;
select concat(order_id) as 'Order ID', 
concat(customer_first_name, " ", customer_last_name) as 'Customer Name', 
order_date, 
concat(ifnull(shipped_date, 'Not Yet Shipped')) as 'shipped_date'
from customers
join orders
using(customer_id)
where order_id >= 773
order by order_id;

-- Answer 3 --
use ap;
select concat(vendors.vendor_name) as 'Vendor Name', 
concat(vendor_contacts.first_name, " ", vendor_contacts.last_name) as 'Contact Full Name', 
concat(invoices.invoice_id) as 'Invoice ID', 
concat(invoices.invoice_total - invoices.payment_total - invoices.credit_total) as 'Balance Due'
from vendor_contacts
left join vendors using(vendor_id)
left join invoices using(vendor_id)
order by vendor_name, (invoices.invoice_total - invoices.payment_total - invoices.credit_total);

--  Answer 4 --
use ap;
select terms.terms_description, vendors.vendor_state, vendors.vendor_name, 
vendors.vendor_id
from vendors
inner join terms
on vendors.default_terms_id = terms.terms_id
where vendor_state > 'N' and vendor_state < 'R'
order by terms_description, vendor_state, vendor_id, vendor_name;