
select s.skills, count(s.skills) as demand_skills from skills_job_dim as sj
inner join job_postings_fact as j on j.job_id = sj.job_id
inner join skills_dim as s on sj.skill_id = s.skill_id
where
job_title_short = 'Data Analyst' 
and job_work_from_home = True and 
s.skills is not null
group by s.skills
order by demand_skills desc
--limit 10

