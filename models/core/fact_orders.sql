select
    o.order_id,
    o.customer_id,
    c.country,
    o.order_date,
    o.status,
    o.total_amount
from {{ ref('stg_orders') }} o
left join {{ ref('stg_customers') }} c
  on o.customer_id = c.customer_id
