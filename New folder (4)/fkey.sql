DROP TRIGGER IF EXISTS fkey;

DELIMITER %
CREATE TRIGGER fkey BEFORE INSERT ON DATA3
FOR EACH ROW
BEGIN
	IF new.NUMBER IS NULL THEN
		SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'Foreign Key cannot be NUll';
	ELSE
		IF NEW.NUMBER  not in (SELECT data.id from data) THEN
			SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'Foreign Key does not match with Primary Key';
		END IF;
	END IF;
END %
DELIMITER ;

