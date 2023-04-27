/*
drop procedure if exists pattern;
delimiter $
create procedure pattern()
BEGIN
	select concat(left(ename,1), '(', substr(ename,2,length(ename)) ,') is [',job, ']') from emp;
end $
delimiter ;


drop procedure if exists countDVS;
delimiter $
create procedure countDVS(s varchar(40))
BEGIN
	declare d int default 0;
	declare v int default 0;
	declare space int default 0;
	declare len int default 1;
	vishal: LOOP
		if substr(s,len,1) regexp '[0-9]' THEN
			set d = d + 1;
		end if;
		if substr(s,len,1) regexp '[ ]' THEN
			set space = space + 1;
		end if;
		if substr(s,len,1) regexp '[aeiou]' THEN
			set v = v + 1;
		end if;
		set len = len + 1;
		if len > length(s) then 
			leave vishal;
		end if;
	end loop vishal;
	select d;
	select v;
	select space;
end $
delimiter ;


drop procedure if exists onlyL;
delimiter $
create procedure onlyL(s varchar(40))
BEGIN
	declare len int default 1;
	declare str varchar(40) default '';
	vishal: LOOP
		if substr(s,len,1) regexp '[A-Za-z]' THEN
			set str = concat(str, substr(s,len,1));
		end if;
		set len = len + 1;
		if len > length(s) then 
			leave vishal;
		end if;
	end loop vishal;
	select str;
end $
delimiter ;

*/

drop function if exists f1;
delimiter $
create function f1(x int) returns int
BEGIN
	declare y int;
	set y = 0;
	return 3;
end $
delimiter ;