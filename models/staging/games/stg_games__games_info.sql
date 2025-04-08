WITH tmp AS (
    SELECT
        app_id,
        title,
        date_release,
        win as support_win,	
        mac as support_mac,
        linux as support_linux,
        steam_deck,
        "2025-03-31" AS start_date,
        NULL AS end_date
    FROM {{ source('games', 'games_info') }} 
)
SELECT 
    *,
    CASE WHEN end_date IS NULL THEN "Y" ELSE "N" END AS current_flag
FROM tmp
