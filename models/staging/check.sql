select *
from {{ source('ecommerce', 'raw_orders') }}
order by order_id



