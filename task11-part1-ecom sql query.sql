-------1.create 5 function on ecom---

select * from sales

select product_id, sum(sales) from sales group by product_id

select product_id, sales,
    case
       When sales < 200 Then 'Better Selling'
       When sales between 100 and 1000 Then  'Good Selling'
       When sales between 1000 and 2000 Then 'Best selling'
     Else  'Not good selling'
    End 
from sales

-- 1) Check sales<1000 low sale else high sale

create or replace function checksales (sales double precision)
returns varchar as $$
declare
output varchar;
begin
if sales <1000 then output:='low sale';
else output:='high sale' cost;
end if;
return output;
end
$$ language plpgsql

select *, checksales(sales) from sales

-- 2) quantity<5 low quantity else high quantity

create or replace function checkquantity (quantity int)
returns varchar as $$
declare
output varchar;
begin
if quantity <5 then output:='low quan';
else output:='high quan';
end if;
return output;
end
$$ language plpgsql

select *, checkquantity(quantity) from sales

-- 3) age<50 adult, age<70 senior else super senior

select * from customer

create or replace function age_criteria(age int)
returns varchar as $$
declare
age_status varchar;
begin
case
when age<50 then age_status:='adult';
when age<70 then age_status:='senior';
else age_status:='super senior';
end case;
return age_status;
end
$$ language plpgsql;

select *, age_criteria(age) from customer

---3) profit>0 good profit else no profit

select * from sales

create or replace function checkprofit(profit double precision)
returns varchar as $$
declare
output varchar;
begin
if profit>0 then output:='good profit';
else output:='no profit';
end if;
return output;
end
$$ language plpgsql;

select *, checkprofit(profit) from sales

---4)if Los Angeles found then united state otherwise from india

select * from customer

create or replace function CheckState (state varchar)
returns varchar as $$
declare 
output varchar;
begin 
if state = 'Los Angeles'  then output:=' from the united state ';    
else output:='from the india' ;
end if ;
return output;
end
$$ language plpgsql;

select CheckState('New York City')

---5) check total sales per product

select * from sales

create or replace function get_total(productId varchar)
returns varchar as $$
declare 
SumOfSales float;
SumOfQuantity float ;
begin 
select sum(sales) as "sumofsales", sum(quantity) as "sumofquantity" into sumOfSales, sumOfQuantity from sales 
where product_id = productId;
return SumOfSales;
end
$$ Language plpgsql;

select product_id, sales, get_total(product_id) from sales


