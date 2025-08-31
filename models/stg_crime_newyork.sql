WITH CTE AS (

    SELECT 
    * 
    FROM {{ source('us_crime', 'URBAN_CRIME_INCIDENT_LOG') }}

 

)


SELECT
* 
FROM CTE