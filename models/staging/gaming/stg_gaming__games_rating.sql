select
    app_id,
    rating,
    positive_ratio,
    user_reviews,
from {{ source('gaming', 'games_rating') }} 