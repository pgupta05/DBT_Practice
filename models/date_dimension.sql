WITH cte AS (
    SELECT 
        TO_TIMESTAMP(started_at) AS STARTED_AT,
        DATE(TO_TIMESTAMP(started_at)) AS DATE_STARTED_AT,
        HOUR(TO_TIMESTAMP(started_at)) AS HOUR_STARTED_AT,
        MINUTE(TO_TIMESTAMP(started_at))  AS MINUTE_STARTED_AT,
        DAYNAME(TO_TIMESTAMP(started_at)) AS DAY_OF_WEEK,
        {{ get_day_type('started_at') }} AS RESULT_FROM_MACRO,
        {{ get_session('started_at') }} AS SESSION_FROM_MACRO,
        CASE
        WHEN DAYNAME(TO_TIMESTAMP(started_at)) in ('Sat','Sun')
        THEN 'Weekend'
        ELSE 'BusinessDay'
        END AS DAY_TYPE,
        CASE
        WHEN MONTH(TO_TIMESTAMP(started_at)) IN (12,1,2)
        THEN 'Winter'
        WHEN MONTH(TO_TIMESTAMP(started_at)) IN (3,4,5)
        THEN 'Spring'
        WHEN MONTH(TO_TIMESTAMP(started_at)) IN (6,7,8)
        THEN 'Summer'
        WHEN MONTH(TO_TIMESTAMP(started_at)) IN (9,10,11)
        THEN 'Autumn'
        END AS SESSION



    FROM {{ source('demo', 'bike') }}
    WHERE started_at != 'started_at'
)

SELECT *
FROM cte