select   
case
   when position(',' in search_location) > 0 then 
      trim(SPLIT_PART(search_location, ',', 2))  -- po przecinku (czyli kraj)
    else 
    search_location
end as location ,
count(case
   when position(',' in search_location) > 0 then 
      trim(SPLIT_PART(search_location, ',', 2))  -- po przecinku (czyli kraj)
    else 
    search_location
end) as count_location
from job_postings_fact
group by location
order by count_location desc 
--limit 10