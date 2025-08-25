with source as (
    select * from {{ source('ecommerce', 'raw_payments') }}
),

renamed as (
    select
        payment_id,
        order_id,
        cast(payment_date as timestamp) as payment_ts,
        amount,
        lower(method) as payment_method
    from source
)

select * from renamed
