
drop procedure if exists addUser;
delimiter $
create procedure addUser(_name varchar(40),_pwd varchar(40),_email varchar(40))
BEGIN
	create table if not exists login(username varchar(40),password varchar(40),email varchar(40));
	insert into login values(_name,_pwd,_email);
end $
delimiter ;

drop procedure if exists checkUser;
delimiter $
create procedure checkUser(_email varchar(40))
BEGIN
	declare count int default 0;
	create table if not exists login(username varchar(40),password varchar(40),email varchar(40));
	create table if not exists log(id int auto_increment, curr_time time, curr_date date,message varchar(150));
	select count(email) into count from login where email=_email;
	if count >= 1 THEN
		select username,password from login;
	ELSE
		select "User not found";
		insert into log(curr_date,curr_time,message) values(curtime(),curdate(),concat(_email," was searched "));
	end if;
end $
delimiter ;

drop procedure if exists getQualification;
delimiter $
create procedure getQualification(_id int)
BEGIN
	declare count int default 0;
	select count(id) into count from student where id=_id;
	if count > 0 then
		select * from student where id=1;
		select * from student_qualifications where studentid=1;
	ELSE
		select "Student not found...";
	end if;
	
end $
delimiter ;

drop procedure if exists addStudent;
delimiter $
create procedure addStudent(_first varchar(45),_last varchar(45),_dob date, _email varchar(128),_number varchar(10),_address varchar(128))
BEGIN
	declare _id int default 0;
	declare _id_p int default 0;
	declare _id_a int default 0;
	select max(id)+1 into _id from student;
	select max(id)+1 into _id_p from student_phone;
	select max(id)+1 into _id_a from student_address;
	insert into student values(_id,_first,_last,_dob,_email);
	if _id != 0 then
		insert into student_phone values(_id_p,_id,_number,1);
		insert into student_address values(_id_a,_id,_address);
	end if;
end $
delimiter ;

drop procedure if exists addQualification;
delimiter $
create procedure addQualification(_id int,_name varchar(128),_college varchar(128),_uni varchar(128),_marks varchar(45),_year int)
BEGIN
	declare c int default 0;
	declare _id_q int default 0;
	select count(id) into c from student where id=_id;
	select max(id)+1 into _id_q from student_qualifications;
	if c > 0 then
		insert into student_qualifications values(_id_q,_id,_name,_college,_uni,_marks,_year);
		select "Record inserted";
	ELSE
		select "Student not found";
	end if;
end $
delimiter ;
