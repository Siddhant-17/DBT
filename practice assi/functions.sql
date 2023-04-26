drop function if exists sumSalary;
delimiter $
create function sumSalary(_deptno int) returns FLOAT
deterministic
BEGIN
	declare sum int default 0;
	select sum(sal) into sum from emp where deptno=_deptno;
	return sum;
end $
delimiter ;

drop function if exists autoNumber;
delimiter $
create function autoNumber() returns int
deterministic
BEGIN
	declare max int default 0;
	select max(studentid)+1 into max from student_new;
	return ifnull(max,1);
end $
delimiter ;

drop function if exists getLoginInfo;
delimiter $
create function getLoginInfo(_email varchar(128)) returns varchar(200)
deterministic
BEGIN
	declare info varchar(200);
	select concat("Username : ",username," Password : ",password) into info from login where email=_email;
	return ifnull(info,"Employee not exists");
end $
delimiter ;

drop function if exists sumMarks;
delimiter $
create function sumMarks(_id int) returns float
deterministic
BEGIN
	declare sum float;
	select sum(marks) into sum from student_qualifications where studentId=_id;
	return ifnull(sum,0);
end $
delimiter ;