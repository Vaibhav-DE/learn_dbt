with source as (
    select * from {{ source('ecommerce', 'raw_customer') }}
),

renamed as (
    select
        customer_id,
        first_name,
        last_name,
        cast(signup_date as timestamp) as signup_ts,
        country
    from source
)

select * from renamed
