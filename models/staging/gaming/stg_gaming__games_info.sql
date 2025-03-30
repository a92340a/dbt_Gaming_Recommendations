select
    app_id,
    title,
    date_release,
    win as support_win,	
    mac as support_mac,
    linux as support_linux,
    steam_deck
from {{ source('gaming', 'games_info') }} 

