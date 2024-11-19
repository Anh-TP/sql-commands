-- DELETE vs DROP vs TRUNCATE
-- access to these queries may be limited to certain users only

use bootcamp_2023;
show tables;
select * from students1;

-- DELETE ROWS / GROUP OF ROWS --
-- is only possible with delete
delete from students1 where id = 009;


-- DELETE ALL TABLE DATA --
-- the table structure will be unaffected
-- cannot add a 'where' clause in the truncate statement
delete from students1;
truncate students1;


-- DELETE TABLE --
-- will delete entire table structure as well as data, both will be gone forever
-- however if a foreign key exists, it will not let you drop the table until the FK is removed
drop table students1;

desc students1;

