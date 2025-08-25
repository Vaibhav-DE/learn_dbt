with customers as (
    select * from {{ ref('dim_customers') }}
),

orders as (
    select * from {{ ref('fact_orders') }}
)

select
    c.customer_id,
    c.first_name,
    c.last_name,
    c.country,
    c.signup_ts,

    count(distinct o.order_id) as total_orders,
    sum(o.total_amount) as total_order_value,
    sum(o.payment_amount) as total_paid,
    min(o.order_ts) as first_order_ts,
    max(o.order_ts) as last_order_ts,

    -- Lifetime Value (LTV)
    sum(o.payment_amount) as customer_ltv

from customers c
left join orders o using (customer_id)
group by
    c.customer_id,
    c.first_name,
    c.last_name,
    c.country,
    c.signup_ts
