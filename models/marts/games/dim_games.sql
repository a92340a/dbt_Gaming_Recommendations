SELECT
    i.app_id,
    i.title,
    m.app_description,
    i.date_release,
    i.support_win,	
    i.support_mac,
    i.support_linux,
    CASE WHEN CAST(i.support_win AS INT) + CAST(i.support_mac AS INT) + CAST(i.support_linux AS INT) >= 2 THEN true ELSE false END AS is_cross_platform,
    i.steam_deck,
    p.price_final,
    p.price_original,
    p.discount_ratio,
    p.is_discount,	
    r.rating_category,
    r.positive_ratio,
    r.user_reviews,
    m.app_tags
FROM {{ ref('stg_games__games_info') }} AS i
LEFT JOIN {{ ref('stg_games__games_pricing') }} AS p
ON i.app_id = p.app_id
LEFT JOIN {{ ref('stg_games__games_rating') }} AS r
ON i.app_id = r.app_id
LEFT JOIN {{ ref('stg_games__games_metadata') }} AS m
ON i.app_id = m.app_id
WHERE i.current_flag = "Y" 
