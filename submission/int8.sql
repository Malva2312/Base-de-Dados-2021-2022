.mode columns
.headers on
.nullvalue NULL
select distinct name, date from Record, Participant WHERE Record.idParticipant = Participant.idParticipant AND Record.date <= (SELECT min(date) from Record) ORDER BY date, name;