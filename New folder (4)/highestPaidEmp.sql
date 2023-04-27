DROP PROCEDURE IF EXISTS higestPaidEmp;

DELIMITER %
CREATE PROCEDURE higestPaidEmp()
BEGIN
	DECLARE _empno INT;
	DECLARE _ename VARCHAR(20);	
	DECLARE _deptno INT ;
	DECLARE _sal INT ;
	DECLARE tiger CURSOR FOR SELECT empno,ename,deptno,sal FROM EMP ORDER BY sal DESC LIMIT 5;
	DECLARE EXIT HANDLER FOR NOT FOUND SELECT "No More Records";
	OPEN tiger;
		monkey:LOOP
			FETCH tiger INTO _empno,_ename,_deptno,_sal;
			SELECT _empno,_ename,_deptno,_sal;
		END LOOP monkey;
	CLOSE tiger;
END %
DELIMITER ;