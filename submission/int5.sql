.mode columns
.headers on
.nullvalue NULL
select sportName, cast(julianday(max(endDate)) - julianday(min(startDate)) as int) as eventDuration from Competition, Sport WHERE Sport.idSport = Competition.idSport GROUP BY Sport.sportName ORDER BY cast(julianday(max(endDate)) - julianday(min(startDate)) as int) DESC, julianday(min(startDate));