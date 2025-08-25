with source as (
    select * from {{ source('ecommerce', 'raw_orders') }}
),

renamed as (
    select
        order_id,
        customer_id,
        cast(order_date as timestamp) as order_ts,
        lower(status) as status,  
        total_amount
    from source
)

select * from renamed
