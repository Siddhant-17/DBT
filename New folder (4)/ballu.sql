drop trigger if exists check1;
drop trigger if exists check2;


delimiter $
create trigger check1 before insert on data
for each row
begin
	insert into data2 values(new.id,new.name,curtime(),curdate(),user(),'INSERTED');
end $
delimiter ;




delimiter $
create trigger check2 after delete on data
for each row
begin
	insert into data2 values(old.id,old.name,curtime(),curdate(),user(),'DELETED');
end $
delimiter ;