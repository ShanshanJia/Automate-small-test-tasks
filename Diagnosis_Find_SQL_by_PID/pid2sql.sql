select sql_text from v$sql
where sql_id in
(
  select sql_id from v$session
  where addr in
    (
        select addr from v$process
        where spid = '5594'
    )
   )