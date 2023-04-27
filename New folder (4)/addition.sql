DELIMITER $

CREATE FUNCTION addition(num1 int, num2 int) RETURNs INT
BEGIN

	RETURN num1+num2;

END $
DELIMITER ;