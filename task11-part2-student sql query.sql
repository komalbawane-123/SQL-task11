-------2.create function on your own data-------

select * from student

----age<13 preteen, age<20 teenager else younger
	
create or replace function age_criteria(age int)
returns varchar as $$
declare
age_status varchar;
begin
case
when age<13 then age_status:='preteen';
when age<20 then age_status:='teenager';
else age_status:='younger';
end case;
return age_status;
end
$$ language plpgsql;

select *, age_criteria(age) from student

---2) Check marks<45 minimum marks, marks<60 average else highest---

create or replace function marks_criteria(marks int)
returns varchar as $$
declare
marks_status varchar;
begin
case
when marks<45 then marks_status:='minimum marks';
when marks<60 then marks_status:='average';
else marks_status:='highest';
end case;
return marks_status;
end
$$ language plpgsql;

select *, marks_criteria(marks) from student



