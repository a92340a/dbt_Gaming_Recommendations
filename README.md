# Game Recommendations on Steam

## Purpose
To find the gaming recommendation insights, building a data transformation pipeline with dbt.

## Data Source
The source from [Kaggle dataset](https://www.kaggle.com/datasets/antonkozyriev/game-recommendations-on-steam) is restructured by this project to mimic the OLTP (Online Transactional Processing) database.
Overall, it contains detailed information about games, user profiles and over 41 million user recommendations (reviews) from a Steam Store.
```
Sources
├── games
│   ├── games_info
│   ├── games_metadata
│   ├── games_pricing
│   ├── games_rating
├── recommend
│   ├── recommendations
├── users
│   ├── users
```

## Data Pipeline and Lineage Overview 
You can know more about the pipeline flow of ETL (Extract, Transform, Load) which follows the recommendation of dbt's offical documents about modular data modeling technique.
![game_logical_erd](snapshots/games_logical_ERD.png)

## Data Warehouse Modeling
The following model designed with Star Schema (Kimball) methodalogy includes dimension tables: `dim_users`, `dim_games` and fact table `fct_recommendations`.
- `dim_users`: a table of user profiles' public information, such as the number of purchased products and reviews published.
- `dim_games`: a table of games (or add-ons) information on ratings, pricing in US dollars $, release date, descriptions, tags, etc.
- `fct_recommendations`: a table of user reviews which reveal whether the user recommends a product. The table represents a many-many relation between a game entity and a user entity.

## How it works
Try running the following commands:
- dbt run
- dbt test
- dbt build
- dbt docs generate: [dbt docs](https://lu917.us1.dbt.com/accounts/70471823449893/develop/70471823706679/docs/index.html#!/source/source.gaming.games.games_info)



