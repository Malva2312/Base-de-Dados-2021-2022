.mode columns
.headers on
.nullvalue NULL
select name, sum(CASE WHEN gold <> 0 THEN gold ELSE 0 END) as gold, sum(CASE WHEN silver <> 0 THEN silver ELSE 0 END) as silver, sum(CASE WHEN bronze <> 0 THEN bronze ELSE 0 END) as bronze from Participant, Medal, AthleteEarnsMedal WHERE Participant.idParticipant = AthleteEarnsMedal.idParticipant AND  AthleteEarnsMedal.idMedal = Medal.idMedal GROUP BY Participant.idParticipant ORDER BY sum(CASE WHEN gold <> 0 THEN gold ELSE 0 END) DESC, sum(CASE WHEN silver <> 0 THEN silver ELSE 0 END) DESC, sum(CASE WHEN bronze <> 0 THEN bronze else 0 END) DESC;