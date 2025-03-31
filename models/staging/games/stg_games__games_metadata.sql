-- Slowly change dimension 
select 
    app_id,
    description,
    tags,
    "2025-03-31" AS start_date,
    NULL AS end_date,
    "Y" AS current_flag
from {{ source('games', 'games_metadata') }} 
group by app_id, description, tags