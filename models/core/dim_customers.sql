select
    customer_id,
    first_name,
    last_name,
    signup_date,
    country
from {{ ref('stg_customers') }}
