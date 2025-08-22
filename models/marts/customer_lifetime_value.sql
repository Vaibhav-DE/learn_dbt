select
    customer_id,
    sum(total_amount) as lifetime_value,
    count(order_id) as total_orders,
    min(order_date) as first_order_date,
    max(order_date) as last_order_date
from {{ ref('fact_orders') }}
group by customer_id
