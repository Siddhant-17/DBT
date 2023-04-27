drop procedure if exists pro1;
delimiter $
create procedure pro1()
begin
      declare _empno,_sal,_deptno int;
	  declare _ename,_job varchar(40);
	  declare _hiredate date;
	  
	  declare c1 cursor for select empno,ename,job,hiredate,sal,deptno from emp;
	  
	  open c1;
	    lb1:loop
		         fetch c1 into _empno,_ename,_job,_hiredate,_sal,_deptno;
				 select _empno,_ename,_job,_hiredate,_sal,_deptno;
	    end loop lb1;
	  close c1;
end $
delimiter ;	  