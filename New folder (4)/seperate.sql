DROP PROCEDURE IF EXISTS seperate;

DELIMITER %

CREATE PROCEDURE seperate(s varchar(100))
BEGIN

	DECLARE numStr varchar(50) DEFAULT "";
	DECLARE strStr varchar(50) DEFAULT "";
	
	DECLARE x INT DEFAULT 1;
	
	
	loop1: LOOP
	
		IF SUBSTR(s,x,1) in ('1', '2', '3', '4', '5', '6', '7', '8', '9', '0') THEN
			SET numStr= CONCAT(numStr,SUBSTR(s,x,1));
		ELSE
			SET strStr=CONCAT(strStr,SUBSTR(s,x,1));
		END IF;
		
		SET x:=x+1;
	
	IF x > LENGTH(s) THEN
		LEAVE loop1;
	END IF;	
	END LOOP loop1;	
	
	SELECT numStr;
	SELECT strStr;

END %
DELIMITER ;
