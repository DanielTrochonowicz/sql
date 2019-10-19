show databases;

use hr;

show tables;

desc jobs;

create database testy;

drop database testy;

select * from employees;

select last_name, first_name, salary from employees;

select last_name as 'Imie' , first_name as 'Nazwisko' from employees;

desc departments;   -- struktura  departments

select * from regions;

select concat(last_name,' ', first_name) from employees;

select first_name from employees  order by first_name;

select last_name from employees  order by last_name desc;

select last_name, salary from employees  order by 2 desc;  -- mozna uzyc tez np nazyw kolumny po ktorej chcemy sortowac (salary) zamiast 2 .

select first_name, last_name, salary from employees  order by 3, 2 desc;

select DISTINCT(last_name) from employees order by 1;

select * from countries;
select department_name from departments;
select hire_date as 'data zatrudnienia' from employees;
select first_name as 'nazwisko pracownika' from employees;

select * from employees where last_name = 'Chen';

select first_name, last_name, hire_date from employees where salary not between 4000 and 12000 order by salary;

select * from employees where employee_id in (100, 102, 105, 107);

select last_name from employees where salary < 3000;

select first_name, last_name from employees where salary between 3000 and 8000;

select distinct job_id from employees;

select first_name, last_name, salary, commission_pct  from employees where last_name like 'M%';

select first_name, last_name from employees where last_name like '%I%' or last_name like '%A%' or  last_name like '%O%';

select first_name, last_name from employees where department_id = '60';

select * from employees where commission_pct is null;

select first_name, last_name from employees where first_name like '_E%';

select distinct department_id from employees;

select first_name, last_name, salary from employees where salary > 9000;

select  first_name, last_name, (salary*1.2) from employees where department_id = '50';

select * from employees where department_id = '60';

select * from  departments where  location_id > 1500;

select * from  locations where city like 'S%';

select  distinct country_name  from countries order by 1;

select last_name as 'Imie', hire_date as 'Data Zatrudnienia', salary as 'Pesja', (salary + 2000) as 'Pensje po podwyżce' from employees;

select * from employees where salary between 6000 and 8000;
select * from employees where salary >= 6000 and salary <=8000;

select department_name from departments where manager_id is null;

select * from employees  order by salary desc;

select * from employees where department_id = 60 order by salary desc;

select * from employees where department_id in (50, 60, 100);

select * from employees where department_id like 50 or  department_id like 60 or department_id like 100;

select * from employees where department_id in (70, 80, 110) and salary not between 5000 and 9000 order by salary ;

select first_name, last_name, hire_date, salary from employees where job_id = 'ST_CLERK' and hire_date not between 1996 and 1998;

select first_name, last_name, hire_date, salary from employees where job_id = 'st_clerk' and extract(year from hire_date) not between '1996' and '1998'; 

select * from employees where manager_id is null;

select distinct first_name from employees order by 1 desc;

select department_name from departments where department_name not like '__O%';

select * from employees where email like '%G' and department_id between 90 and 110;

select department_id from departments where location_id <> 1700;

select first_name from employees where first_name like 'K%' or first_name like 'A%' order by 1;

select first_name, last_name, (salary*1.2) from employees where department_id in(50, 60, 80);

select * from locations where postal_code is null;

select * from departments where location_id > 2000;

select * from locations where city like 'T%' or city like 'B%';

select job_id, min_salary, max_salary from jobs;

select job_id, min_salary, (min_salary*1.1) from jobs where min_salary order by 2;

select job_id, (max_salary - min_salary) as 'ROŻNICA' from jobs where min_salary order by 2;

select distinct location_id from departments;

select state_province from locations order by 1 desc;

select job_title, min_salary, max_salary from jobs where job_title like 'Sale%';

select round(avg(salary),2) from employees where job_id = 'IT_PROG';

select round(avg(salary),2), min(salary), max(salary) from employees;

select sum(salary), round(avg(salary),2), min(salary), max(salary) from employees where employee_id != (select employee_id from employees where manager_id is null);

select job_id, sum(salary)  from employees group by job_id;

select count(employee_id), job_id from employees group by job_id;

select job_id, round(avg(salary),2), count(*) from employees group by job_id having count(*) >= 3;

select first_name, count(employee_id) from employees group by first_name having  count(employee_id) > 1 order by 2;

select department_id, round(avg(salary),2) from  employees group by department_id having avg(salary) > 9000;

select min(salary), max(salary), (max(salary) - min(salary)) as różnicę ,  department_id from employees group by department_id;

select first_name, max(salary), manager_id from employees group by manager_id having manager_id is not null;

select job_id, max(salary) from employees group by job_id order by 1 desc;

select count(employee_id), count(distinct salary) from employees group by department_id;

select round(avg(distinct salary),2) as 'średnią pensja', department_id from employees group by department_id;

select max(salary), department_id from employees where department_id in (50,60,100) group by department_id;

select first_name, min(salary), department_id from employees where first_name not like '%S%' group by department_id;

select min(salary), max(salary), department_id from employees group by department_id having department_id >= 5;

select distinct(department_id) from departments order by department_id;

select min(hire_date), max(hire_date), department_id from employees group by department_id;

select count(employee_id), job_id from employees group by job_id having count(employee_id) >= 10;

select round(avg(distinct salary),2) as 'średnią pensja', job_id, count(*) from employees where year(hire_date) != 2005 group by job_id order by 3;

select first_name, manager_id,  min(salary) from employees group by manager_id order by 3;

select first_name, round(avg(distinct salary),2) as 'średnią pensja', job_id from employees group by job_id having job_id = 'ST_CLERK' or job_id = 'ST_MAN';

select count(department_id) from departments;

select e.first_name, e.last_name, d.department_id, d.department_name
from employees e 
join departments d 
on e.department_id = d.department_id;

select e.first_name, e.last_name, d.department_name, l.city, l.state_province
from employees e 
join departments d 
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where d.department_name = 'IT'; 

select e.first_name, e.last_name, d.department_id, d.department_name 
from employees e
join departments d
on e.department_id = d.department_id
where d.department_id in (80, 40); 

select e.first_name, e.last_name, d.department_name, l.city, l.state_province
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where first_name like '%z%';

select e.first_name, e.last_name, d.department_name 
from employees e
right join departments d
on e.department_id = d.department_id
where e.last_name is null;

select e.first_name, e.last_name, ee.first_name as 'Imie przełożonego', ee.last_name as 'Nazwisko przełożonego'
from employees e
join employees ee
on e.manager_id = ee.employee_id;

select d.department_name, round(avg(salary),2), count(e.employee_id)
from employees e
join departments d
on e.department_id = d.department_id
group by department_name;

select first_name, last_name, department_id from employees where last_name = 'Taylor';

select e.first_name, e.last_name, d.department_id, d.department_name 
from employees e
join departments d 
on e.department_id = d.department_id;

select c.country_name, r.region_name
from countries c
join regions r
on c.region_id = r.region_id;

select l.location_id, l.city, d.department_name
from locations l 
join departments d
on l.location_id = d.location_id;

select max(salary)-min(salary)
from employees e
join departments d
on e.department_id = d.department_id
where d.department_name = 'Finance';

select e.first_name, d.department_name 
from employees e
join departments d
on e.department_id = d.department_id;

select e.first_name, r.region_name 
from employees e
join departments d
on e.department_id = d.department_id
join locations l 
on d.location_id = l.location_id
join countries c
on l.country_id = c.country_id
join regions r
on c.region_id = r.region_id;

-- tworzenie tabeli
create table if not exists books12(
title varchar(200),
author varchar(200),
published date,
isbn int,
category char(100) ,
page_count int,
publisher varchar(10),
price decimal(20,2)
);

-- tworzenie tabeli
create table if not exists books(
books_id int auto_increment,
title varchar(50) not null,
author varchar(50) not null,
published date,
isbn char(17),
category char(17),
page_count int,
publisher varchar(10),
price decimal(10, 2),
primary key(books_id)
)engine = innodb;

alter table books12 change author author varchar(50) not null;
alter table books12 change title title varchar(50) not null;

ALTER TABLE `hr`.`books` add column in_stock int NULL DEFAULT 0 AFTER `price`;





