CREATE TRIGGER IF NOT EXISTS SportElimination
BEFORE DELETE ON Sport
FOR EACH ROW
BEGIN
DELETE FROM Coaches WHERE Coaches.idSport = old.idSport;
DELETE FROM ParticipatesIn WHERE ParticipatesIn.idSport = old.idSport;
DELETE FROM Record WHERE Record.idSport = old.idSport;
DELETE FROM IndividualDiscipline WHERE IndividualDiscipline.idSport = old.idSport;
DELETE FROM CollectiveDiscipline WHERE CollectiveDiscipline.idSport = old.idSport;
DELETE FROM CompetitionLocation WHERE CompetitionLocation.idCompetition IN (SELECT idSport from Competition WHERE idSport = old.idSport);
DELETE FROM Competition WHERE Competition.idSport = old.idSport;
END;
