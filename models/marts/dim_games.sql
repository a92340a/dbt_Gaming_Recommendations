select
    i.app_id,
    i.title,
    m.app_description,
    i.date_release,
    i.support_win,	
    i.support_mac,
    i.support_linux,
    i.steam_deck,
    p.price_final,
    p.price_original,
    p.discount_ratio,
    p.is_discount,	
    r.rating_category,
    r.positive_ratio,
    r.user_reviews,
    m.app_tags
from {{ ref('stg_games__games_info') }} as i
left join {{ ref('stg_games__games_pricing') }} as p
on i.app_id = p.app_id
left join {{ ref('stg_games__games_rating') }} as r
on i.app_id = r.app_id
left join {{ ref('stg_games__games_metadata') }} as m
on i.app_id = m.app_id
where i.current_flag = "Y" 
