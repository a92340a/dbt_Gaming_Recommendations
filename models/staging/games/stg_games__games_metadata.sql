select 
    app_id,
    description,
    tags,
    count(tags) as num_of_tags
from {{ source('games', 'games_metadata') }} 
group by app_id, description, tags