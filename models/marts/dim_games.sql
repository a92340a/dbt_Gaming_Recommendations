select
    i.app_id,
    i.title,
    i.date_release,
    i.support_win,	
    i.support_mac,
    i.support_linux,
    i.steam_deck,
    p.price_final,
    p.price_original,
    p.discount,	
    r.rating,
    r.positive_ratio,
    r.user_reviews,
    m.desciption,
    m.tags
    count(m.tags) as num_of_tags,
from {{ ref('stg_gaming__games_info') }} as i
left join {{ ref('stg_gaming__games_pricing') }} as p
on i.app_id = p.app_id
left join {{ ref('stg_gaming__games_rating') }} as r
on i.app_id = r.app_id
left join {{ ref('stg_gaming__games_metadata') }} as m
on i.app_id = m.app_id
group by i.app_id