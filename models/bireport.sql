{{
    config(
        materialized= 'table',
        pre_hook=["
            begin;
            lock table {{target.schema}}.bireport;
        "],
        post_hook= ["
            commit;
            GRANT USAGE ON SCHEMA {{target.schema}} TO GROUP bi_users;
            GRANT SELECT ON TABLE {{target.schema}}.bireport TO GROUP bi_users;
       "]
    )
}}


select 
    *
from {{ref('joins')}}

