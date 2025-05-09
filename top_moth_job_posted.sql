select extract(month from job_posted_date) as Month,count (extract(Month from job_posted_date)) as count_month
from job_postings_fact 
where extract(year from job_posted_date) = 2023
group by month
order by month 
