WITH playing_hours AS (
    SELECT 
        app_id,
        APPROX_QUANTILES(hours, 2)[1] AS mean_hours
    FROM {{ ref('stg_recommend__recommendations') }}
    GROUP BY app_id
)
SELECT
    r.user_id,
    r.app_id,
    r.review_id,
    r.review_date AS review_date,
    r.is_recommended,
    r.hours,
    CASE WHEN hours >= mean_hours THEN "dedicated" ELSE "occasional" END AS type_of_player,
    r.num_of_helpful,
    r.num_of_funny,
FROM {{ ref('stg_recommend__recommendations') }} AS r
LEFT JOIN playing_hours AS h
ON r.app_id = h.app_id