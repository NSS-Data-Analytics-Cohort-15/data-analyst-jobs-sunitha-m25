--Q1.How many rows are in the data_analyst_jobs table?
select count(*)
from data_analyst_jobs;
--Answer = 1793

--Q2.Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
select * from data_analyst_jobs
limit 10; 
--Answer = ExxonMobil

--Q3.How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
select count(location)  as count_loc
from data_analyst_jobs
where location = 'TN';
--Answer=21

select location, count(location)  as count_loc
from data_analyst_jobs 
where location = 'TN' or location = 'KY'
group by location;
--Answer = TN(21),KY(6)

--Q4.How many postings in Tennessee have a star rating above 4?
SELECT count(*) AS count_posting
FROM data_analyst_jobs
Where star_rating >=4 AND location='TN';
--Answer=4

--Q5.How many postings in the dataset have a review count between 500 and 1000?
SELECT count(*) AS new_review_count
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
--Answer=151

--Q6.Show the average star rating for companies in each state. 
--The output should show the state as `state` and the average rating for the state as `avg_rating`. 
--Which state shows the highest average rating?
SELECT location AS state,ROUND(avg(star_rating),2)AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY state
ORDER BY avg_rating DESC;
--Answer=NE(4.20)

--Q7.Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs;
--Answer=881

--Q8.How many unique job titles are there for California companies?
select count(distinct(title))
from data_analyst_jobs
where location= 'CA';
--Answer=230

--Q9.Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
SELECT company,review_count,ROUND(avg(star_rating),2) AS new_avg_rating
FROM data_analyst_jobs
GROUP BY company,review_count
HAVING (review_count) > 5000 AND company IS NOT NULL;

SELECT COUNT(DISTINCT company) AS count_company
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT NULL;
--Answer=40

--Q10.Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT company,review_count,ROUND(avg(star_rating),2) AS new_avg_rating
FROM data_analyst_jobs
GROUP BY company,review_count
HAVING (review_count) > 5000 AND company IS NOT NULL
ORDER BY new_avg_rating DESC;
--ANSWER=American Express(4.20 rating)

--Q11.Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
SELECT title
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';

SELECT COUNT (title) AS total_title
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%';
--Answer=157

--Q12.How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
SELECT title,COUNT (title) AS total_title
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%' AND title NOT LIKE '%Analytics%'
GROUP BY title;
--ANSWER=26(common word is Data)

SELECT title,COUNT (title) AS total_title
FROM data_analyst_jobs
WHERE lower(title) NOT LIKE lower('%Analyst%') AND lower(title) NOT LIKE lower('%Analytics%')
GROUP BY title;
--Answer=4(common word is Data)

--Bonus Question.You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
-- - Disregard any postings where the domain is NULL. 
-- - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--  - Which three industries are in the top 3 on this list? How many jobs have been listed for more than 3 weeks for each of --- the top 3?
select domain, count(*) as domain_jobs
from data_analyst_jobs
WHERE SKILL like '%SQL%'
AND days_since_posting > 21
AND domain IS NOT NULL
GROUP BY domain
ORDER BY domain_jobs DESC
LIMIT 4;























































































