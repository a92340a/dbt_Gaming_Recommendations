select
    user_id,
    num_of_games,
    reviews
from {{ ref('stg_users__users') }}