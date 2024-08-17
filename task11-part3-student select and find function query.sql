--create select and find function

select * from student
	
create or replace function student_data(sid int)
returns varchar as $$
declare 
output varchar;
sum_marks int;
begin
select sum(student_marks) into sum_marks from student_marks where s_id=sid;
if sum_marks<=50 then output:='average';
else output:='highest';
end if;
return output;
end;
$$ language plpgsql;

select sum(marks) , student_id from student group by student_id

select *, marks_criteria(marks) from student








