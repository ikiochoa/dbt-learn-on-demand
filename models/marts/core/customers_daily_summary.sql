with final as (
    select 

        {{ dbt_utils.surrogate_key(['customer_id','order_date']) }} as id, -- creates a unique key
        customer_id, 
        order_date, 
        count(*) as total_orders

    from {{ ref('stg_orders' )}}

    group by 1,2,3
)

select * from final 