USE ForestGlenInn;
DROP PROCEDURE IF EXISTS Set_VIP_status;
DELIMITER //
CREATE PROCEDURE Set_VIP_status
(
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