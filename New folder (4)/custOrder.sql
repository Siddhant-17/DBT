/*
Write a procedure to accept customer number and 
display all his order.
(Use customers and orders table)
*/

DROP PROCEDURE IF EXISTS custOrder;
DELIMITER %
CREATE PROCEDURE custOrder(customerID INT)
BEGIN
	DECLARE _custID INT DEFAULT 0;
	
	SELECT c.cnum,c.cname,o.onum,o.amt
	FROM customers as c
	JOIN orders as o
	ON c.cnum=o.cnum
	WHERE c.cnum = customerID;
	
	
END %
DELIMITER ;