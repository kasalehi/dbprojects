-- lets read file and push it into dev tables 


create or refresh streaming table dev.silver.customers 
comment 'this is cleaned data'
(
    constraint valid_customer expect( customer_id is not null)
)
as
select customer_id,
name,
email,
updated_at
from stream dev.bronz.customers 



---create or refresh streaming table dev.silver.customers 
create or refresh streaming table dev.silver.orders 
comment 'this is cleaned data'
(
    constraint valid_order expect( order_id is not null)
)
as
select order_id, customer_id,
amount,
order_date,
status
from stream dev.bronz.orders