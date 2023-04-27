DROP PROCEDURE IF EXISTS wSep;

DELIMITER $

CREATE PROCEDURE wSep()
BEGIN
	
	
	DECLARE _ename VARCHAR(40) DEFAULT '';
	DECLARE _username VARCHAR(40) DEFAULT '';
	
	DECLARE nikhil 
	CURSOR FOR select ename,`user name` from emp; 
	OPEN nikhil ;
		vishal: LOOP
			FETCH nikhil INTO _ename,_username ;
			
			IF _username LIKE '% %' THEN
				
				BEGIN
				
				DECLARE le INT DEFAULT LENGTH(_username);
				DECLARE x INT DEFAULT 0;
				DECLARE firstn VARCHAR(40) DEFAULT '';
				DECLARE lastn VARCHAR(40) DEFAULT '';
					jeremy:LOOP
						SET x= x+1;
						IF substr(_username,x,1) = ' ' THEN						
						LEAVE jeremy;						
						END IF;					
					END LOOP jeremy;
					
					SET firstn = SUBSTR(_username,1,x-1);
					SET lastn = SUBSTR(_username,x+1,LENGTH(_username));
						
					SELECT _ename,_username,firstn,lastn;
				
				END;
			
			ELSE
				SELECT _ename,_username ,_username as first,'' as last;
			END IF;
		
		END LOOP vishal;
	CLOSE nikhil;
	 

END $
DELIMITER ;



