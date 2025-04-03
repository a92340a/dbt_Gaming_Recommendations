select
    user_id,
    app_id,
    review_id,
    date AS review_date,
    is_recommended,
    hours,
    helpful AS num_of_helpful,
    funny AS num_of_funny,
from {{ source('recommend', 'recommendations') }}