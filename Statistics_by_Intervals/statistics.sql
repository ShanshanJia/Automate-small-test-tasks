drop function stat_by_intervals();
create function stat_by_intervals() returns integer as $$ 
declare
init_table_num integer := 20120112; 
init_date date := '2012-01-12'; 
end_date date := '2012-01-30'; 
record_stat record;
begin
while init_date <= end_date
loop
	declare
	init_time timestamp := to_timestamp(init_date::text,'YYYY-MM-DD HH:MM:SS');
	end_time timestamp := init_time + interval '2 hour';
	begin
	while init_time < to_timestamp(end_date::text,'YYYY-MM-DD HH:MM:SS') + interval '1 day'
	loop
		for record_stat in execute 'select count(*) from schema_name.table_'||init_table_num||' where (SELECT TIMESTAMP WITHOUT TIME ZONE ''epoch'' + (tstamp/1000000) * INTERVAL ''1 second'') >= '''||init_time||''' and (SELECT TIMESTAMP WITHOUT TIME ZONE ''epoch'' + (tstamp/1000000) * INTERVAL ''1 second'') < '''||end_time||'''' loop
			raise info 'date%_statistics_%',init_time,record_stat;
			end loop;
		init_time := init_time + interval '2 hour';
		end_time := end_time + interval '2 hour';
	end loop;
	end;
	init_table_num := cast(init_table_num::integer+1 as text); 
	init_date := init_date + integer '1';
end loop;
return 1; 
end;
$$ language plpgsql; 
select * from stat_by_intervals();
