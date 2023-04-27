drop procedure if exists sepl;

delimiter $
create procedure sepl(s varchar(40))
begin
	declare le int default length(s);
	declare x int default 1;
	declare small varchar(40) default '';
	declare capital varchar(40) default '';
	nikhil: loop
		if cast(substr(s, x, 1) as binary) regexp binary '[A-Z]' then
			set capital = concat(capital, substr(s, x, 1));
		else
			set small = concat(small, substr(s, x, 1));
		end if;
		set x = x + 1;
		if x > le THEN
			leave nikhil;
		end if;
	end loop nikhil;
	select capital as cap;
	select small as sma;
end $
delimiter ;