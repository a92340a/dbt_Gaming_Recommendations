select 
    app_id,
    desciption,
    tags
from {{ source('gaming', 'games_metadata') }} 