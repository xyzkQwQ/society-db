-- Compléter ce fichier avec vos réponses.
-- glhf!

1 SELECT * 
    FROM employee e 
    JOIN department d 
    ON e.department_id = d.id 

2 select department_id, name, last_name
    from employee e 
    join department d
    on e.department_id = d.id;

3 select last_name
    from employee e 
    join department d 
    on e.department_id = d.id
    where name = 'distribution';
-- Attention à la casse : préférer : WHERE LOWER(d.name) = 'distribution' ou WHERE d.name ILIKE 'distribution'  pour PostgreSQL

4 select e1.last_name AS "Employeur", e2.last_name AS "Employé", e1.salary AS "Employeur", e2.salary AS "Employé"
    from employee e1
    join employee e2
    on e1.id = e2.superior_id
    where e1.salary < e2.salary;

5 select name
from employee
where department_id IN (
    select id
    from department
    where name = 'finance'
);
-- idem attention à la casse

-- La colonne s'appelle last_name, pas name

6 select name, title
from employee
where title = (
    select title
    from employee
    where name = 'Amartakaldire'
);

7 select name, salary, department_id
from employee
where salary > ANY (
    select salary
    from employee
    where department_id = 31
)
order by department_id, salary;


8 select name, salary, department_id
from employee
where salary > ALL (
    select salary
    from employee
    where department_id = 31
)
order by department_id, salary;


9 select name, title
from employee
where department_id = 31
and title in (
    select title
    from employee
    where department_id = 32
);

10 select name, title
from employee
where department_id = 31
and title not in (
    select title
    from employee
    where department_id = 32
);

11 select name, title, salary
from employee
where (title, salary) = (
    select title, salary
    from employee
    where name = 'Fairant'
);

12 select d.id, d.name, e.name
from department d
left join employee e
on d.id = e.department_id
order by d.id;


13 select AVG(salary)
from employee
where  title = 'secrétaire';
-- WHERE title = 'secrétaire' → préférer LIKE ou ILIKE pour la casse

14 select title, COUNT(*)
from employee
group by title;

15 select d.region, AVG(e.salary), SUM(e.salary)
from employee e
join department d
on e.department_id = d.id
group by d.region;

16 select department_id
from employee
group by department_id
having COUNT(*) >= 3;

17 select SUBSTRING(name, 1, 1) AS initiale, COUNT(*)
from employee
group by SUBSTRING(name, 1, 1)
having COUNT(*) >= 3;
-- SUBSTRING(string, start_position, length) : start_position: This is an integer that specifies where in the string you want to extract the substring. If start_position equals zero, the substring starts at the first character of the string. The start_position can be only positive. Note that in other database systems such as MySQL the SUBSTRING() function can accept a negative start_position.
-- length: This is a positive integer that determines the number of characters that you want to extract 

18 select
    MAX(salary) AS max_salary,
    MIN(salary) AS min_salary,
    MAX(salary) - MIN(salary) AS ecart
from employee;

19
select COUNT(DISTINCT title)
from employee;

20 select title, COUNT(*)
from employee
group by title;

21 select d.name, COUNT(e.id)
from department d
left join employee e
on d.id = e.department_id
group by d.name;

22 select title, AVG(salary)
from employee
group by title
having AVG(salary) > (
    select AVG(salary)
    from employee
    where title = 'Représentant'
);

23 select 
    COUNT(salary) AS nb_salaires,
    COUNT(commission) AS nb_commissions
from employee;```
