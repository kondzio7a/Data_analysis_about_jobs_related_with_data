
/*
create table skills as 
with skills as (
select sj.job_id, sj.skill_id, s.skills,s."type" 
from skills_job_dim as sj 
left join skills_dim as s 
on sj.skill_id = s.skill_id) 
select * from skills 
*/

with top_10_paying_skills as (
with table1 as (
select j.job_id,j.job_title_short,j.job_location, c.name, j.job_work_from_home, j.salary_year_avg from job_postings_fact as j 
left join company_dim as c 
on j.company_id = c.company_id
where j.job_title_short like 'Data Analyst' 
and j.job_work_from_home = 'true'
and j.salary_year_avg is not null
order by j.salary_year_avg desc
--limit 10 
)
select t1.*,s.skills from table1 as t1 
left join skills as s 
on t1.job_id = s.job_id
where s.skills is not null 
order by t1.salary_year_avg desc)
select * from top_10_paying_skills 
