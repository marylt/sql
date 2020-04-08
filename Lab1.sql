-- Question 2: 
-- 7 tables

-- Question 3:
-- 9 columns

-- Question 4:
-- varchar

-- Question 5:
use om;
select customer_last_name, customer_first_name
from customers
where customer_state = 'DC';

-- Question 6:
use ap;
select vendor_name, vendor_city
from vendors
where vendor_state = "CA"
order by vendor_city, vendor_name;

-- Question 7:
use ap;
select invoice_number, payment_date, payment_total
from invoices
where payment_date is null;

-- Question 8:
use om;
select distinct artist
from items 
order by artist ASC;

-- Question 9:
use ex;
select concat(customer_last_name, " ", customer_first_name) as "Full Name"
from Customers;

-- Question 10:
use ap;
select invoice_number, payment_date, invoice_due_date, credit_total
from invoices
where credit_total > 0.00 and payment_date > invoice_due_date;
