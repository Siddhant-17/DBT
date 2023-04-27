DROP PROCEDURE IF EXISTS reverse;

DELIMITER %

CREATE PROCEDURE reverse (s varchar(100))

BEGIN
	
	DECLARE x int DEFAULT 0;
	DECLARE r varchar(100) DEFAULT "";
	set x = LENGTH(s);
	
	loop1:LOOP
		
		SET r = CONCAT(r,SUBSTR(s,x,1));
		SET x:=x-1;		
		IF x < 1 THEN 
			LEAVE loop1;
		END IF;
	
	END LOOP loop1;
	SELECT r;
	


END %
DELIMITER ;


