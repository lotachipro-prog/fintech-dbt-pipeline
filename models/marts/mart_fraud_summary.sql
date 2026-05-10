with enriched as (
    select * from {{ ref('int_transactions_enriched') }}
),

summary as (
    select
        amount_category,
        count(*)                                    as total_transactions,
        sum(case when is_fraud = 1 then 1 else 0 end)  as total_fraud,
        round(avg(transaction_amount), 2)           as avg_transaction_amount,
        round(sum(transaction_amount), 2)           as total_volume,
        round(
            100.0 * sum(case when is_fraud = 1 then 1 else 0 end) / count(*),
            4
        )                                           as fraud_rate_pct
    from enriched
    group by amount_category
)

select * from summary