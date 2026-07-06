create or refresh streaming table prod.prod.customers 
comment 'this is sdc type 2';

create flow applying_changse 
as auto cdc into prod.prod.customers
from stream dev.silver.customers
keys (customer_id)
sequence by updated_at
stored as scd type 2;



-- lets create materialized table joining order and customer and group by 


create or refresh materialized view prod.prod.customer_orders as 
select customer_id, count(*) as total_orders, sum(total) as total_revenue
from prod.prod.customers c join dev.silver.orders o on c.customer_id = o.customer_id