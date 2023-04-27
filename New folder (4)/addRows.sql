DROP PROCEDURE IF EXISTS addRows;
DELIMITER %
CREATE PROCEDURE addRows()
BEGIN
	DECLARE id INT DEFAULT 1;
	DECLARE evenMessage VARCHAR(30) DEFAULT "";
	DECLARE oddMessage VARCHAR(30) DEFAULT "";
	DECLARE _limit INT DEFAULT 0;
	
	SET evenMessage:=" is Even";
	SET oddMessage:=" is Odd";
	
	TRUNCATE r;
	TIGER:LOOP
		
		IF id MOD 2=0 THEN
			INSERT INTO r VALUES (id,concat(ID,evenMessage));
		ELSE
			INSERT INTO r VALUES (id,concat(ID,oddMessage));
		END IF;
		
		SET _limit = _limit + 1;
		SET id = id + 1;
		
		
		IF _limit > 9 THEN
			LEAVE TIGER;
		END IF;
	END LOOP TIGER;
END %
DELIMITER ;