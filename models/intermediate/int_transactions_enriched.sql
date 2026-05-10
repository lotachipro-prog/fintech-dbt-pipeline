with stg as (
    select * from {{ ref('stg_transactions') }}
),

enriched as (
    select
        transaction_time,
        transaction_amount,
        is_fraud,

        -- Categorise transaction size
        case
            when transaction_amount < 10    then 'small'
            when transaction_amount < 100   then 'medium'
            when transaction_amount < 1000  then 'large'
            else 'very_large'
        end as amount_category,

        -- Flag high risk
        case
            when is_fraud = 1 then true
            else false
        end as is_high_risk

    from stg
)

select * from enriched