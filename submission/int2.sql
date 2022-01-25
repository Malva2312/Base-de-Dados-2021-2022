.mode columns
.headers on
.nullvalue NULL
select OlympicCommittee.abbreviation, count(*) as numberOfAthletes from OlympicCommittee, Participant, Athlete where (Participant.abbreviation = OlympicCommittee.abbreviation and Participant.idParticipant = Athlete.idParticipant) group by OlympicCommittee.abbreviation;