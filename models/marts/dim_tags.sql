SELECT 
    app_id, 
    t AS tag
FROM {{ ref('stg_games__games_metadata') }}, unnest(app_tags) as t
