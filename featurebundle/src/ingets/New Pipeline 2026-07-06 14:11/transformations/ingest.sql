

-- lets read file and push it into dev tables 


create or refresh streaming table dev.bronz.orders
as
select *,
_metadata.file_path as file_path,
_metadata.file_modification_time as file_modification_time
from stream read_files('/Volumes/dev/dev/raw/orders/',
format=>'csv',
header=>true,
pipelines.reset=>false
)

--lets read customers data 


create or refresh streaming table dev.bronz.customers
as
select *,
_metadata.file_path as file_path,
_metadata.file_modification_time as file_modification_time
from stream read_files('/Volumes/dev/dev/raw/customers/',
format=>'csv',
header=>true,
pipelines.reset=>false
)