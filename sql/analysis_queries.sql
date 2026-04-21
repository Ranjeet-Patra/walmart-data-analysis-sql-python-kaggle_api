use walmart_db;
RENAME TABLE walmart_clean_data TO walmart;
desc walmart;
Select * from walmart;
-- select count(*) from walmart;
-- Select Max(quantity)as max, Min(quantity)as min from walmart;
-- Select count(distinct Branch) from walmart;

-- ******************--
-- Business Problems
-- ******************--
-- 1. Find different payment method & number of transactions, number of quantity sold

SELECT 
    payment_method,
    COUNT(*) AS no_of_transactions,
    SUM(quantity) AS no_of_quantity_sold
FROM
    walmart
GROUP BY payment_method
ORDER BY no_of_quantity_sold DESC;

-- 2. Identify the highest rated category in each branch, displaying the branch, category, Avg rating

Select * 
from
(
Select
Branch,
category,
round(avg(rating),2) as avg_rating,
rank() over (partition by branch order by avg(rating)desc) as rnk
from walmart
group by
Branch,
category)a
where rnk = 1;

-- 3. Identify the busiest day for each branch based on the number of transaction

Select
branch,
day_name,
no_of_transactions 
from(
Select 
-- Date_format(str_to_date(date, '%d/%m/%y'),'%d/%m/%y') as formated_date,
branch,
dayname(str_to_date(date, '%d/%m/%y')) as day_name,
count(*) as no_of_transactions,
rank() over (partition by branch order by count(*) desc) as rnk
from walmart
Group by 1,2
order by 1,3 desc)a
where rnk = 1;

-- 4. Determine the average , minimum & maximum rating of category for each city. List the city, 
-- average_rating, min_rating & max_rating.

Select
city,
category,
round(avg(rating),2) as avg_rating,
min(rating) as min_rating,
max(rating) as max_rating,
Rank() over (partition by city order by round(avg(rating),2) desc) as rnk
from walmart
group by 1,2
order by city;

-- 5. calculate the total profit for each category by considering total_profit as 
-- (unit_price * quantity * profit_margin). List category & total_profit , ordered from highest to lowest profit.

Select
category,
round(sum(total),2) as total_revenue,
round(sum(total * profit_margin),2) as total_profit
from 
walmart
group by category
order by 2 desc;

-- 6. Determine the most common payment method for each branch.
-- Display Branch and the preferred_payment_method

select 
branch,
payment_method,
total_no_of_transaction from
(
select
branch,
payment_method,
count(*) as total_no_of_transaction,
Rank() over (partition by branch order by count(*) desc) rnk
from walmart
group by 1,2
)a
where rnk = 1;

-- 7. Categorize sales into 3 group Morning, Afternoon, Evening
-- Find out which of the shift and number of invoices

select
branch, 
case 
when hour(CAST(time as Time)) < 12 Then 'Morning'
when hour(CAST(time as Time)) between 12 and 17 Then 'Afternoon'
else 'evening' 
end as day_time,
count(*)
from walmart
group by 1,2
order by 1,3 desc;

-- 8. Identify 5 branch with highest decrease ratio in revenue compare to
-- last year (current year 2023 and last year 2022)
-- rev_decrease_ratio = (last_year_rev - cur_year_rev) / last_year_rev * 100

with revenue_2022 AS
(
select
branch,
sum(total) as revenue
from walmart
where
year(str_to_date(date, '%d/%m/%y')) = 2022
group by 1
),
revenue_2023 AS
(
select
branch,
sum(total) as revenue
from walmart
where
year(str_to_date(date, '%d/%m/%y')) = 2023
group by 1
)
select 
ls.branch,
ls.revenue as last_year_revenue,
cs.revenue as current_year_revenue,
round((ls.revenue - cs.revenue)/ls.revenue * 100,2) as ratio_of_decrease
from
revenue_2022 as ls
join
revenue_2023 as cs
on
ls.branch = cs.branch
where
ls.revenue > cs.revenue
order by 4 desc
limit 5;
 
