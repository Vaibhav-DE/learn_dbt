with orders as (
    select * from {{ ref('stg_orders') }}
),

customers as (
    select * from {{ ref('stg_customers') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
)

select
    o.order_id,
    o.customer_id,
    c.first_name,
    c.last_name,
    c.country,
    o.order_ts,
    o.status,
    o.total_amount,
    p.payment_id,
    p.payment_ts,
    p.amount as payment_amount,
    p.payment_method
from orders o
left join customers c using (customer_id)
left join payments p using (order_id)
