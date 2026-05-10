with source as (
    select * from {{ source('fintech_raw', 'transactions') }}
),

renamed as (
    select
        Time        as transaction_time,
        Amount      as transaction_amount,
        Class       as is_fraud,
        V1, V2, V3, V4, V5,
        V6, V7, V8, V9, V10,
        V11, V12, V13, V14, V15,
        V16, V17, V18, V19, V20,
        V21, V22, V23, V24, V25,
        V26, V27, V28
    from source
)

select * from renamed