{{
    config(
        materialized = 'incremental',
        unique_key = 'category_id'
    )
}}
-- materialized = 'ephermal'
-- materialized = 'table'

select * from {{source('sources','categories')}}