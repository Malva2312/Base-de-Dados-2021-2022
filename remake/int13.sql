.mode columns
.headers on
.nullvalue NULL
select date, count(*) as NumberOfBrokenRecords from Record group by date order by count() desc limit 1;