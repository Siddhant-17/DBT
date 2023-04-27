DROP PROCEDURE IF EXISTS comma;
DELIMITER ^

CREATE PROCEDURE comma(s varchar(20))

BEGIN

	DECLARE x int DEFAULT 1;
	DECLARE r varchar(20) DEFAULT "";
	
	loop1: LOOP
		
		SET r=concat(r,SUBSTR(s,x,1));
		
		IF x < LENGTH(s) THEN	
		SET r=concat(r,", ");
		END IF;
		SET x=x+1;		
		IF x> LENGTH(s) THEN
			LEAVE loop1;
		END IF;
	
	
	END LOOP loop1;
	SELECT r ;

END ^
DELIMITER ;