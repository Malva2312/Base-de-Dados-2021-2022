CREATE TRIGGER IF NOT EXISTS ParticipantAdittion
BEFORE INSERT ON Participant
FOR EACH ROW
WHEN new.idParticipant < (select max(idParticipant) from Participant) 
OR new.abbreviation not in (select abbreviation from OlympicCommittee)
BEGIN
select raise(abort, 'Ou o id dado não é válido (é menor que o maior id) ou a abreviatura não faz parte da lista de comités olímpicos.');
END;
