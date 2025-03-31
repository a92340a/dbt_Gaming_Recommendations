select
    user_id,
    products AS num_of_games,
    reviews
from {{ source('users', 'users') }}