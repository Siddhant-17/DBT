/*
Create the following table named (emp10, emp20, and emp30) 
which have the same structure of emp table.
Write a procedure to split employee records from emp table according to their department numbers
and insert those records in the appropriate table using cursor.
*/

DROP PROCEDURE IF EXISTS seperateEmp;
DELIMITER %
CREATE PROCEDURE seperateEmp()
BEGIN
	DECLARE _EMPNO INT;
	DECLARE _ENAME VARCHAR(12);
	DECLARE _GENDER CHAR(1);
	DECLARE _JOB VARCHAR(20);
	DECLARE _MGR INT;
	DECLARE _HIREDATE DATE;
	DECLARE _SAL INT;
	DECLARE _COMM INT;
	DECLARE _DEPTNO INT;
	DECLARE _BONUSID INT;
	DECLARE _USER_NAME VARCHAR(20);
	DECLARE _PWD VARCHAR(20);
	DECLARE _PHONE VARCHAR(40);
	DECLARE _isActive TINYINT(1);
	
	DECLARE tiger CURSOR FOR SELECT * FROM EMP;
	DECLARE EXIT HANDLER FOR NOT FOUND SELECT "ALL RECORD INSTERTED" AS MESSAGE;
	DECLARE EXIT HANDLER FOR 1062 SELECT "Data Already Exists";
	
	OPEN tiger;
	
		monkey:LOOP			
			FETCH tiger INTO _EMPNO,_ENAME,_GENDER,_JOB,_MGR,_HIREDATE,_SAL,_COMM,_DEPTNO,_BONUSID,_USER_NAME,_PWD,_PHONE,_isActive;
			IF _DEPTNO = 10 THEN
				INSERT INTO emp10 VALUES(_EMPNO,_ENAME,_GENDER,_JOB,_MGR,_HIREDATE,_SAL,_COMM,_DEPTNO,_BONUSID,_USER_NAME,_PWD,_PHONE,_isActive);				
			END IF;
			
			IF _DEPTNO = 20 THEN
				INSERT INTO emp20 VALUES(_EMPNO,_ENAME,_GENDER,_JOB,_MGR,_HIREDATE,_SAL,_COMM,_DEPTNO,_BONUSID,_USER_NAME,_PWD,_PHONE,_isActive);				
			END IF;
			
			IF _DEPTNO = 30 THEN
				INSERT INTO emp30 VALUES(_EMPNO,_ENAME,_GENDER,_JOB,_MGR,_HIREDATE,_SAL,_COMM,_DEPTNO,_BONUSID,_USER_NAME,_PWD,_PHONE,_isActive);				
			END IF;
			
			
		END LOOP monkey;
	CLOSE tiger;
	
END %
DELIMITER ;



