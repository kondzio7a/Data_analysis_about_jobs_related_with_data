select regexp_replace(job_via, '^via\s+','') as Portal_with_offers, count(regexp_replace(job_via, '^via\\s+','')) as succesfull_application_count
from job_postings_fact
group by Portal_with_offers
order by succesfull_application_count desc
--limit 10
