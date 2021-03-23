-- that uses the stg_payments model and sums the amount of successful payments. 
-- (Remember to use Jinja in this rather than the raw table name)

with payments as (
    select * from {{ ref('stg_payments') }}
),

aggregated as (
    select
    sum(amount) as total_revenue
    
    from payments
    where status = 'success'
)

select * from aggregated