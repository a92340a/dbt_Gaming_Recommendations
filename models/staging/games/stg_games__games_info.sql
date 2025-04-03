select
    app_id,
    title,
    date_release,
    win as support_win,	
    mac as support_mac,
    linux as support_linux,
    steam_deck,
    "2025-03-31" AS start_date,
    NULL AS end_date,
    "Y" AS current_flag
from {{ source('games', 'games_info') }} 

