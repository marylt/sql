/*Question 1*/
USE forestgleninn;
create or replace view FirstQuestion
(guest_name, check_in_date, check_out_date) as
select concat(last_name, ', ', first_name) as 'Guest Name',
date_format(check_in_date, '%W, %M, %d, %Y') as 'Check-in Date',
date_format(check_out_date, '%W, %M, %d, %Y') as 'Check-in Date'
from reservations r join guests g
on r.guest_id = g.guest_id
where (date_format(check_in_date, '%w') <=5 and date_format(check_out_date, '%w')=0) and datediff(check_out_date, check_in_date) < 7
order by check_in_date, date_format(check_in_date, '%w'), last_name, first_name; 




/*Question 2*/
use forestgleninn;
create or replace view SecondQuestion
(guest_name, Number_of_room, check_in_date, check_out_date, reserve_length, Price_room) as 
select concat(last_name, ', ', first_name) as "Guest Name",
room_number,
date_format(check_in_date, '%W, %M %m, %Y') as 'Check-in Date',
date_format(check_out_date, '%W, %M, %m, %Y') as 'Check-out Date',
datediff(check_out_date, check_in_date) as 'Reserve Day', 
concat('$', base_price) as 'Price Room' 
from guests inner join reservations using(guest_id)
	join rooms using(room_id)
    join room_types using(room_type_id)
    where datediff(check_out_date, check_in_date) > 3
    order by datediff(check_out_date, check_in_date) desc, last_name, first_name;
    
    
    
    
/* Question 3 */
USE ForestGlenInn;
DROP PROCEDURE IF EXISTS CalcRoomPrice; 
DELIMITER //
CREATE FUNCTION CalcRoomPrice(
room_type_code_param VARCHAR(10),
checkin_date_param DATE,
checkout_date_param DATE
)
RETURNS DECIMAL(6,2)
BEGIN
	DECLARE base_price_var DECIMAL(6,2), price_var INT;
	SET price_var = 0;
    SELECT DateDiff(room_type_code_param,checkout_date_param,checkin_date_param) into length_of_stay;
	SELECT base_price INTO price_price_var FROM room_type WHERE room_type_code = room_type_code_param;
		SET price_var = base_price_var;
		IF length_of_stay > 10  THEN
        SET price_var= price_var - (base_price_var*(15/100)) * length_of_stay;
  
		ELSEIF length_of_stay> 5 THEN
		SET price_var=price_var -(base_price_var *(10/100)) * length_of_stay;
        END IF;
	price_var = price_var*length_of_stay_param;
	RETURN(price_var);    
END
DELIMITER //;
select CalcRoomPrice('queen','2018-05-01','2018-05-21');




/* Question 4 */
USE ForestGlenInn;
DROP PROCEDURE IF EXISTS Set_VIP_status;
DELIMITER //
CREATE PROCEDURE Set_VIP_status
(
    /* one input parameters for guest ID  */
	guest_id_param INT
)
BEGIN
	DECLARE sql_error INT DEFAULT FALSE;
	DECLARE num_stays_var INT;
	DECLARE VIP_status_var VARCHAR(10);
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;
    SET VIP_status_var = 'Not a VIP';
	SELECT COUNT(guest_id) INTO num_stays_var FROM reservations WHERE guest_id = guest_id_param;
	IF num_stays_var > 7 THEN
    SET VIP_status_var = 'GOLD';
    ELSEIF num_stays_var between 5 and 7 THEN
    SET VIP_status_var='SILVER';
    ELSEIF num_stays_var < 3 THEN
    SET VIP_status_var = 'BRONZE';
	END IF;
	START TRANSACTION;  
	UPDATE guests SET VIP_status = VIP_status_var WHERE guest_id = guest_id_param; 
	IF sql_error = FALSE THEN
		COMMIT;
	ELSE
		ROLLBACK;
	END IF;
END//
DELIMITER ;
CALL set_VIP_status(1);
CALL set_VIP_status(2);
CALL set_VIP_status(3);
CALL set_VIP_status(4);
CALL set_VIP_status(5);
CALL set_VIP_status(6);