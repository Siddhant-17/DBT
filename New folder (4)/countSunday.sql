/*
Write a procedure to find how many “Sundays” are present between two given dates.
Input: - Date1 and Date2
Output: - 3 Sunday’s
*/

DROP PROCEDURE IF EXISTS countSunday;
DELIMITER %
CREATE PROCEDURE countSunday(date1 DATE,date2 DATE)
BEGIN
	DECLARE sundayNo INT DEFAULT 0;
	tiger:LOOP
		IF DAYNAME(date1) = 'Sunday' THEN
			sundayNo=sundayNo +1;
			date1=date1 + INTERVAL 1 DAY;
		END IF;
		
		
		IF date1 > date2 THEN
			leave tiger;
		END IF;
	END LOOP tiger;

END%
DELIMITER ;