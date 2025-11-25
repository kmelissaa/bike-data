
SELECT * FROM bike_share_yr_0;

SELECT * FROM bike_share_yr_0
UNION
SELECT * FROM bike_share_yr_1;

SELECT * FROM cost_table;

USE bike_data;

WITH cte AS 
(SELECT * FROM bike_share_yr_0
UNION
SELECT * FROM bike_share_yr_1)
SELECT * FROM cte;

WITH cte AS 
(SELECT * FROM bike_share_yr_0
UNION
SELECT * FROM bike_share_yr_1)
SELECT dteday,season,a.yr,weekday,hr, rider_type, riders, price, COGS, 
	riders*price AS revenue, riders*price - COGS AS profit
FROM cte a
left join cost_table b on a.yr = b.yr;