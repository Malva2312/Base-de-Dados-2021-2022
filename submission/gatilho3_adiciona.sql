CREATE TRIGGER IF NOT EXISTS MedalUpdate
BEFORE UPDATE ON Medal
FOR EACH ROW
WHEN ((new.gold = 1 AND (new.bronze <> 0 OR new.silver <> 0))
 OR (new.gold > 1) 
 OR (new.silver = 1 AND (new.gold <> 0 OR new.bronze <> 0))
 OR (new.silver > 1)
 OR (new.bronze = 1 AND (new.gold <> 0 OR new.silver <> 0))
 OR (new.bronze > 1))
 AND old.idMedal = new.idMedal
BEGIN
select raise(abort, 'Apenas um dos valores pode ser 1, sendo os restantes 0.');
END;


CREATE TRIGGER IF NOT EXISTS EmptyMedalUpdate
BEFORE UPDATE ON Medal
FOR EACH ROW
WHEN (new.gold = 0 AND new.silver = 0 AND new.bronze = 0)
BEGIN
DELETE FROM Medal WHERE Medal.idMedal = old.idMedal;
DELETE FROM AthleteEarnsMedal WHERE idMedal = old.idMedal;
DELETE FROM CommitteeEarnsMedal WHERE idMedal = old.idMedal;
END;