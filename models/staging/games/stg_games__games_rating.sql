select
    app_id,
    rating AS rating_category,
    positive_ratio,
    user_reviews,
from {{ source('games', 'games_rating') }} 