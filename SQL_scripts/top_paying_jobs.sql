
/*
create table skills as 
with skills as (
select sj.job_id, sj.skill_id, s.skills,s."type" 
from skills_job_dim as sj 
left join skills_dim as s 
on sj.skill_id = s.skill_id) 
select * from skills 

create table job_skills as (
select j.*, s.skill_id, s.skills, s."type" from (select sj.job_id, sj.skill_id, s.skills,s."type" 
from skills_job_dim as sj 
left join skills_dim as s 
on sj.skill_id = s.skill_id) as s
left join job_postings_fact as j 
on j.job_id = s.job_id)
*/

select j.job_id,j.job_title_short,j.job_location, c.name, j.job_work_from_home, j.salary_year_avg from job_postings_fact as j 
left join company_dim as c 
on j.company_id = c.company_id
where j.job_title_short like 'Data Analyst' 
and j.job_work_from_home = 'true'
and j.salary_year_avg is not null
order by j.salary_year_avg desc
--limit 10 