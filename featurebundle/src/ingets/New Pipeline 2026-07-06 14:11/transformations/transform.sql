-- lets read file and push it into dev tables 


create or refresh streaming table dev.silver.customers 
(
    constraint valid_customer expect( customer_id is not null)
)
comment 'this is cleaned data'
as
select customer_id,
name,
email,
updated_at
from stream dev.bronz.customers;



---create or refresh streaming table dev.silver.customers 
create or refresh streaming table dev.silver.orders 
(
    constraint valid_order expect( order_id is not null)
)
comment 'this is cleaned data'
as
select order_id, customer_id,
amount,
order_date,
status
from stream dev.bronz.orders;
