Create database social_media;
use social_media;

select post_id , count(*) as cnt from social_media
group by post_id
having count(*) > 1;

select post_id , platform , count(*) as cnt from social_media
group by post_id ,platform
having count(*) > 1;

select post_id , platform , content_type , count(*) as cnt from social_media
group by post_id ,platform ,content_type
having count(*) > 1;

select post_id , platform , content_type ,Content_Category,  count(*) as cnt from social_media
group by post_id ,platform ,content_type, Content_Category
having count(*) > 1;

select post_id ,  platform , content_type ,Content_Category, Post_Type ,Region   ,count(*) as cnt from social_media
group by post_id , platform ,content_type, Content_Category , Post_Type ,Region
having count(*) > 1; 

select * from social_media;

select count(*) as total_rows ,
sum(Post_ID is null) ,
sum(Platform is null) ,
sum(Content_Type is null),
sum(Content_Category is null) ,
sum(Post_Type is null ) , 
sum(Region is null),
sum(Longitude is null) ,
sum(Latitude is null) ,
sum(Engagement is null) ,
sum(Views is null),
sum(Likes is null) ,
sum(Shares is null) ,
sum(Comments is null) ,
sum(Engagement_Rate is null) ,
sum(Impressions is null) ,
sum(Video_Views is null) ,
sum(Live_Stream_Views is null) ,
sum(Clicks is null) ,
sum(Click_Through_Rate is null) , 
sum(Main_Hashtag is null) ,
sum(Post_Published_At is null) ,
sum(Post_Date is null) ,
sum(Post_Hour is null) ,
sum(Engagement_Level is null) ,
sum(Day_of_Week is null) ,
sum(`Day Name` is null) ,
sum(WeekEnd is null),
sum(Month is null) ,
sum(Month_Name is null),
sum(Quarter is null) ,
sum(Time_of_Day is null) ,
sum(Total_Interactions is null) ,
sum(Recalculated_Engagement_Rate is null ) ,
sum(`Check` is null) 
from social_media;

select * from social_media;

desc social_media;

select count(*) as total_posts , 
count(distinct(post_id)) as unique_post_ids ,
count(distinct(Platform)) as total_platforms ,
count(distinct(Content_Type)) as total_content_type,
count(distinct(Content_Category)) as total_content_category ,
count(distinct(Post_Type)) as total_post_type ,
count(distinct(Region)) as total_region
from social_media;

select * from social_media
where post_id ='0';

delete from social_media
where post_id ='0'; 

-- Which platform has the highest total views, average views, total engagement, and average engagement?
select platform  , sum(views) as total_views , round(avg(views),2) as avg_views ,
sum(engagement) as total_engagement , round(avg(engagement),2) as avg_engagement from social_media
group by platform
order by total_views desc;

-- Which content type performs better?
select Content_Type , count(*) as no_of_posts , round(avg(views),2) as avg_views , round(avg(likes),2) as avg_likes , round(avg(shares),2) as avg_shares , 
round(avg(comments),2) as avg_comments from social_media
group by content_type
order by avg_views desc;

-- Which content category performs best?
select Content_Category , count(*) as total_posts , round(avg(views),2) as avg_views , round(avg(engagement),2) as avg_engagement , 
round(avg(total_interactions),2) as avg_total_interactions
from social_media
group by content_category
order by avg_engagement desc;


-- Which regions perform best?
select region , count(*) as total_posts , round(avg(views),2) as avg_views , round(avg(engagement),2) as avg_engagement , 
round(avg(total_interactions),2) as avg_total_interactions
from social_media
group by region
order by avg_engagement desc;

-- Which post format performs best?
select Post_Type , count(*) as total_posts , round(avg(views),2) as avg_views , round(avg(engagement),2) as avg_engagement , 
round(avg(total_interactions),2) as avg_total_interactions ,round(avg(Recalculated_Engagement_Rate),2) as avg_recal_eng
from social_media
group by Post_Type
order by avg_recal_eng desc;

-- Which hashtags perform best?
select Main_Hashtag, count(*) as total_posts , round(avg(views),2) as avg_views , round(avg(engagement),2) as avg_engagement , 
round(avg(total_interactions),2) as avg_total_interactions ,round(avg(Recalculated_Engagement_Rate),2) as avg_recal_eng
from social_media
group by Main_Hashtag
order by avg_recal_eng desc;



-- Which day of the week performs best?

select `Day Name` , count(*) as total_posts , round(avg(views),2) as avg_views , round(avg(engagement),2) as avg_engagement , 
round(avg(total_interactions),2) as avg_total_interactions ,round(avg(Recalculated_Engagement_Rate),2) as avg_recal_eng
from social_media
group by `Day Name`
order by avg_recal_eng desc;

-- Which time of day performs best?
select Time_of_Day , count(*) as total_posts , round(avg(views),2) as avg_views , round(avg(engagement),2) as avg_engagement , 
round(avg(total_interactions),2) as avg_total_interactions ,round(avg(Recalculated_Engagement_Rate),2) as avg_recal_eng
from social_media
group by Time_of_Day
order by avg_recal_eng desc;

select * from social_media
-- Monthly performance trend

select date_format(Post_Published_At , '%Y-%m') as month , count(*) as total_posts , sum(views) as total_views , 
round(avg(engagement),2) as avg_engagement , round(avg(Recalculated_Engagement_Rate),2) as avg_recal_enge from social_media
group by date_format(Post_Published_At , '%Y-%m') 
order by avg_recal_enge desc;


desc social_media


SELECT
    Post_Published_At,
    Post_Date,
    COUNT(*) AS total_rows
FROM social_media
GROUP BY Post_Published_At, Post_Date
ORDER BY Post_Published_At
LIMIT 20;


SELECT
    MIN(Post_Published_At) AS min_published_at,
    MAX(Post_Published_At) AS max_published_at,
    MIN(Post_Date) AS min_post_date,
    MAX(Post_Date) AS max_post_date,
    COUNT(*) AS total_rows,
    SUM(Post_Published_At IS NULL) AS missing_published_at,
    SUM(Post_Date IS NULL) AS missing_post_date
FROM social_media;


SELECT
    Post_Published_At,
    STR_TO_DATE(
        REPLACE(Post_Published_At, '.', ':'),
        '%d-%m-%Y %H:%i'
    ) AS converted_published_at,
    Post_Date,
    STR_TO_DATE(
        Post_Date,
        '%d-%m-%Y %H.%i'
    ) AS converted_post_date
FROM social_media
LIMIT 20;

SELECT
    MIN(STR_TO_DATE(
        REPLACE(Post_Published_At, '.', ':'),
        '%d-%m-%Y %H:%i'
    )) AS min_date,
    MAX(STR_TO_DATE(
        REPLACE(Post_Published_At, '.', ':'),
        '%d-%m-%Y %H:%i'
    )) AS max_date,
    SUM(
        STR_TO_DATE(
            REPLACE(Post_Published_At, '.', ':'),
            '%d-%m-%Y %H:%i'
        ) IS NULL
    ) AS invalid_dates
FROM social_media;


SELECT
    Post_Published_At,
    Post_Date,
    STR_TO_DATE(
        Post_Date,
        '%d-%m-%Y'
    ) AS converted_date
FROM social_media
WHERE STR_TO_DATE(
    REPLACE(Post_Published_At, '.', ':'),
    '%d-%m-%Y %H:%i'
) IS NULL
LIMIT 30;


SELECT
    COUNT(*) AS invalid_timestamp_rows,
    SUM(
        STR_TO_DATE(Post_Date, '%d-%m-%Y') IS NULL
    ) AS invalid_post_dates
FROM social_media
WHERE STR_TO_DATE(
    REPLACE(Post_Published_At, '.', ':'),
    '%d-%m-%Y %H:%i'
) IS NULL;

select * from social_media
-- Monthly performance trend

SELECT DATE_FORMAT(STR_TO_DATE(LEFT(Post_Date, 10), '%d-%m-%Y'),'%Y-%m') AS month_label,
    COUNT(*) AS total_posts,
    SUM(Views) AS total_views,
    ROUND(AVG(Engagement), 2) AS avg_engagement,
    ROUND(AVG(Recalculated_Engagement_Rate), 2) AS avg_engagement_rate_pct
FROM social_media
WHERE STR_TO_DATE(LEFT(Post_Date, 10), '%d-%m-%Y') IS NOT NULL
GROUP BY DATE_FORMAT(
    STR_TO_DATE(LEFT(Post_Date, 10), '%d-%m-%Y'),
    '%Y-%m'
)
ORDER BY month_label;


-- Organic vs Sponsored
select Content_Type , count(*) as total_posts , sum(views) as total_views , 
round(avg(engagement),2) as avg_engagement , round(avg(Recalculated_Engagement_Rate),2) as avg_recal_enge from social_media
group by Content_Type
order by avg_recal_enge desc;

select * from social_media;
-- Which platforms perform best in each region?

select Platform , Region ,  count(*) as total_posts , sum(views) as total_views , 
round(avg(engagement),2) as avg_engagement , round(avg(Recalculated_Engagement_Rate),2) as avg_recal_enge from social_media
group by Platform , Region 
order by Region , avg_recal_enge desc;


-- Find the best platform in each region using ROW_NUMBER()

with platform_performance as  (
select Platform , Region ,  count(*) as total_posts , sum(views) as total_views , 
round(avg(engagement),2) as avg_engagement , round(avg(Recalculated_Engagement_Rate),2) as avg_recal_enge from social_media
group by Platform , Region 
),
ranked as (
select Platform  ,Region  , total_posts , total_views ,avg_engagement , avg_recal_enge ,
row_number() over(partition by region order by avg_recal_enge  desc ) as row_rank 
from  platform_performance)
select * from ranked
where row_rank = 1

-- find the top three ranked platforms in each region based on average recalculated engagement rate.
with platform_performance as  (
select Platform , Region ,  count(*) as total_posts , sum(views) as total_views , 
round(avg(engagement),2) as avg_engagement , round(avg(Recalculated_Engagement_Rate),2) as avg_recal_enge from social_media
group by Platform , Region 
),
ranked as (
select Platform  ,Region  , total_posts , total_views ,avg_engagement , avg_recal_enge ,
rank() over(partition by region order by avg_recal_enge  desc ) as rank_no 
from  platform_performance)
select * from ranked
where rank_no <= 3
ORDER BY Region, rank_no;


-- Repeat customers
-- For each social media platform, identify how many posts were published more than once using the same Post_ID
select post_id, count(distinct (platform)) as platform_count from social_media
group by post_id
having platform_count > 1
order by platform_count desc;


-- Which hashtags perform best?
-- Identify hashtags that generate the highest average engagement rate, while checking how many posts use each hashtag.
select Main_Hashtag , count(*) as total_post , round(avg(Recalculated_Engagement_Rate),2) as avg_recal_engagement_rate ,
round(avg(views),2) as avg_views , round(avg(engagement),2) as avg_engagement
from social_media
group by Main_Hashtag 
order by avg_recal_engagement_rate  desc ;

-- Find the top 5 hashtags by average views
select Main_Hashtag , count(*) as total_post , round(avg(Recalculated_Engagement_Rate),2) as avg_recal_engagement_rate ,
round(avg(views),2) as avg_views , round(avg(engagement),2) as avg_engagement
from social_media
group by Main_Hashtag 
order by avg_views desc 
limit 5 ;


-- Compare Organic vs Sponsored content
select Content_Type , count(*) as total_post , round(avg(Recalculated_Engagement_Rate),2) as avg_recal_engagement_rate ,
round(avg(views),2) as avg_views , round(avg(engagement),2) as avg_engagement
from social_media
group by Content_Type
order by avg_recal_engagement_rate desc ;


-- Find the top 3 content categories in each platform
with content_cat as (
select Platform , Content_Category , round(avg(views),2) as avg_views from social_media
group by Platform , Content_Category  ) ,
rank_table as (
select platform , content_category , avg_views ,
rank() over (partition by platform order by avg_views desc) as rank_no 
from content_cat )
select platform , content_category , avg_views , rank_no from rank_table
where rank_no <= 3 ;

-- Month-over-month growth
with mom_growth as (
select date_format(STR_TO_DATE(LEFT(Post_Date, 10), '%d-%m-%Y'), '%Y-%m') as month , sum(views) as total_views from social_media
group by date_format(STR_TO_DATE(LEFT(Post_Date, 10), '%d-%m-%Y'), '%Y-%m')
) ,
previous_month as (
 select month , total_views , 
 lag(total_views) over(order by month) as previous_month_views from mom_growth 
 ) 
 select 
 month , total_views , previous_month_views , 
 round(((total_views - previous_month_views) / previous_month_views ) * 100  ,2) as  mom_growth_pct from previous_month
order by month ;

with mom_growth as (
select date_format(STR_TO_DATE(LEFT(Post_Date, 10), '%d-%m-%Y'), '%Y-%m') as month , sum(views) as total_views from social_media
group by date_format(STR_TO_DATE(LEFT(Post_Date, 10), '%d-%m-%Y'), '%Y-%m')
) ,
previous_month as (
 select month , total_views , 
 lag(total_views) over(order by month) as previous_month_views from mom_growth 
 ) 
 select 
 month , total_views , previous_month_views , 
 round(
 (total_views - previous_month_views) * 100 / nullif(previous_month_views,0) ,2) as  mom_growth_pct from previous_month
order by month ;


-- Find the top 3 posts by engagement rate within each platform.
with rank_table as (
select platform , post_id , content_category ,Recalculated_Engagement_Rate ,
rank() over (partition by platform order by Recalculated_Engagement_Rate desc ) as rank_no
from social_media
)
select * from rank_table
where rank_no <= 3
order by platform , rank_no ;

-- Identify posts with unusually high engagement
-- Business question: For each platform, count how many posts have a recalculated engagement rate of:
-- High: 20% or above
-- Medium: 10% to below 20%
-- Low: Below 10%
select platform , count(*) as total_posts , 
sum(case  when Recalculated_Engagement_Rate < 10 then 1 else  0  end ) as Low_Engagement_Posts ,
sum(case  when Recalculated_Engagement_Rate >= 10  and Recalculated_Engagement_Rate < 20
then 1 else 0 end ) as  Medium_Engagement_Posts ,
sum(case  when Recalculated_Engagement_Rate >= 20 then 1 else 0 end ) as High_Engagement_Posts 
from social_media
group by platform
order by platform ;



select * from social_media;
--  Compare engagement categories by content type
-- Business question: For each Content_Type (Organic and Sponsored), calculate:
-- Total posts
-- Number of high-engagement posts (rate ≥ 20)
-- Percentage of high-engagement posts

select Content_Type , count(*) as total_posts , 
sum( case when Recalculated_Engagement_Rate >= 20 then 1 else 0 end ) as High_Engagement_Posts ,
round(sum( case when Recalculated_Engagement_Rate >= 20 then 1 else 0 end ) / count(*)  * 100.0,2)  as High_Engagement_percentage
from social_media
group by content_type

