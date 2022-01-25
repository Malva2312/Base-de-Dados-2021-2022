.mode columns
.headers on
.nullvalue NULL
select 2022 - round(avg(birthYear), 2) as AverageGoldMedalistAge from Participant where exists (select * from Participant, AthleteEarnsMedal where Participant.idParticipant = AthleteEarnsMedal.idParticipant) and birthYear != '';