WITH CTE AS (

select 
t.*,
w.*
from {{ ref('trip_fact') }} t
left join {{ ref('daily_weather') }} w
on t.TRIP_DATE = w.daily_weather


)


select 
* 
FROM CTE
-- ORDER BY TRIP_DATE