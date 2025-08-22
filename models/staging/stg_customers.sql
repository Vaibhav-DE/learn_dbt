select
    customer_id,
    first_name,
    last_name,
    cast(signup_date as timestamp) as signup_date,
    country
from {{ source('ecommerce', 'raw_customer') }}
