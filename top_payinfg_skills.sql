


select round(AVG(salary_year_avg),2) as average_salary, skills from skills_job_dim as sj
inner join job_postings_fact as j on j.job_id = sj.job_id
inner join skills_dim as s on sj.skill_id = s.skill_id
where j.job_title_short = 'Data Analyst'
and j.salary_year_avg is not null
group by skills 
order by average_salary desc
--limit 20