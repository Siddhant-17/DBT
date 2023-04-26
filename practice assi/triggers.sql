drop trigger if exists insertStudent;
delimiter $
create trigger insertStudent after insert on student for each ROW
begin 
	insert into dac60_campus.log values(default,curtime(),curdate(),concat("Record inserted successfully for id : ",new.id));
end $
delimiter ;

drop trigger if exists insertDuplicate;
delimiter $
create trigger insertDuplicate after insert on student for each ROW
begin
	declare _id int;
	select max(id)+1 into _id from student_log;
	insert into dac60_campus.student_log values(ifnull(_id,1),new.namefirst,new.namelast,new.dob,new.emailid);
end $
delimiter ;

drop trigger if exists updateDuplicate;
delimiter $
create trigger updateDuplicate after update on student for each ROW
begin
	declare _id int;
	select max(id)+1 into _id from student_log;
	insert into dac60_campus.student_log values(ifnull(_id,1),new.namefirst,new.namelast,new.dob,new.emailid);
end $
delimiter ;

drop trigger if exists deleteDuplicate;
delimiter $
create trigger deleteDuplicate after delete on student for each ROW
begin
	declare _id int;
	select max(id)+1 into _id from student_log;
	insert into dac60_campus.student_log values(ifnull(_id,1),old.namefirst,old.namelast,old.dob,old.emailid);
end $
delimiter ;

drop trigger if exists holiday;
delimiter $
create trigger holiday after insert on student for each ROW
begin
	if dayname(curdate()) = 'Sunday' THEN
		SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'Invalid Day, Record cannot be inserted';
	end if;
end $
delimiter ;