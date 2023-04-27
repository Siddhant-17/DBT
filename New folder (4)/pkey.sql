drop trigger if exists pkey;

DELIMITER $
create trigger pkey before insert on DATA
for each ROW
BEGIN
	IF new.id is null THEN
		SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = " Primary key cannot have null value";
	ELSE 
		IF new.id in (select data.id from data) THEN
		SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = "Primary key must have Unique Value";
		END IF;
	END IF;
END $
DELIMITER ;
