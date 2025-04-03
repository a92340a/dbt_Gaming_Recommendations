-- Slowly change dimension 
select 
    app_id,
    description AS app_description,
    tags AS app_tags,
from {{ source('games', 'games_metadata') }}
