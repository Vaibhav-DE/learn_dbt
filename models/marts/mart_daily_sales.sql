with orders as (
    select * from {{ ref('fact_orders') }}
)

select
    date(order_ts) as order_date,
    count(distinct order_id) as total_orders,
    sum(total_amount) as total_order_value,
    sum(payment_amount) as total_paid,
    count(distinct customer_id) as unique_customers
from orders
group by order_date
order by order_date
