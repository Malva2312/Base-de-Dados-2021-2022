.mode columns
.headers on
.nullvalue NULL
select Participant.name from Athlete, Participant where Athlete.idParticipant = Participant.idParticipant and Athlete.idParticipant in (select idParticipant from AthleteEarnsMedal WHERE idMedal in (select idMedal from Medal WHERE gold <> 0)) and firstOlympicGames = 'Tokyo 2020';