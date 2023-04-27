DROP PROCEDURE IF EXISTS newLine;

delimiter %

create procedure newLine(in s varchar(10))
begin

	DECLARE x int DEFAULT 1;
	DECLARE l int DEFAULT 0;
	set l = LENGTH(s);
		
	loop1:LOOP	
	SELECT SUBSTR(s,x,1);
	IF x = l then
		LEAVE loop1;	
	end IF;
	
	SET x= x+1;
	
	END LOOP loop1;
	
	
end %
delimiter ;