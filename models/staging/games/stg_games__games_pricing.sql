select
    app_id,
    price_final,
    price_original,
    discount AS discount_ratio,
    CASE WHEN discount = 0 THEN false ELSE true END AS is_discount
from {{ source('games', 'games_pricing') }} 