-- Question 2
use ap;
select vendor_name, vendor_state from vendors
where vendor_state = 'CA' or vendor_state = 'Outside CA'
order by vendor_name;

-- Question 3
use ex;
select department_name, 
CONCAT(first_name, " ", last_name) as employee_name
from departments
inner join employees
using(department_number)
order by department_name, last_name, first_name;

-- Question 4
use ap;
select vendor_name,
invoice_date, invoice_number,
concat('#', invoice_sequence) as inv_sequence,
concat(line_item_amount) as li_amount
from ap.vendors v
join ap.vendors i 
on v.vendor_id = i.vendor_id
join ap.invoice_line_items l 
on i.invoice_id = l.invoice_id
where vendor_name = 'Wells Fargo Bank'
order by inv_sequence;

-- Question 5
use ex;
select d.department_number, department_name, employee_id
from departments d
left join employees e
on d.department_number = e.department_number
where e.employee_id is null;

-- Question 6
use ap;
select invoice_number, vendor_name, line_item_description, line_item_amount
from ap.vendors
join ap.invoices using (vendor_id)
join ap.invoice_line_items line_items using (invoice_id)
order by invoice_number;