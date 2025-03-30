select
    app_id,
    price_final,
    price_original,
    discount,
from {{ source('gaming', 'games_pricing') }} 