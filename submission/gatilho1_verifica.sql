.print ''

.print 'Antes de Eliminar o desporto de id 159.'
.print ''
.print 'Existe um desporto com id 159 que é o futebol.'
SELECT * FROM Sport WHERE idSport = 159;

.print ''

.print 'Existem 46 treinadores a treinar o desporto de id 159.'
SELECT count (*) AS 'Coaches.idSport = 159'
FROM Coaches
WHERE Coaches.idSport = 159;

.print ''

.print 'Existe 1 modalidade coletiva cujo id de desporto é 159.'
SELECT count (*) AS 'CollectiveDiscipline.idSport = 159'
FROM CollectiveDiscipline
WHERE CollectiveDiscipline.idSport = 159;

.print ''

.print 'O desporto de id 159 tem as suas competições hospedadas em 7 lugares diferentes.'
SELECT count (*) AS 'CompetitionLocation.idSport = 159'
FROM CompetitionLocation
WHERE CompetitionLocation.idCompetition IN (SELECT idSport from Competition WHERE idSport = 159);;

.print ''

.print 'O desporto de id 159 tem 1 competição.'
SELECT count (*) AS 'Competition.idSport = 159'
FROM Competition
WHERE Competition.idSport = 159;

.print ''

.print ''

DELETE FROM Sport WHERE idSport = 159;

.print ''
.print 'Eliminando o desporto de id 159.'
.print ''


.print 'Existiam 46 treinadores a treinar o desporto de id 159.'
.print 'Agora existem:
SELECT count (*) AS 'Coaches.idSport = 159'
FROM Coaches
WHERE Coaches.idSport = 159;

.print ''

.print 'Existia 1 modalidade coletiva cujo id de desporto é 159.'
.print 'Agora existe:'
SELECT count (*) AS 'CollectiveDiscipline.idSport = 159'
FROM CollectiveDiscipline
WHERE CollectiveDiscipline.idSport = 159;

.print ''

.print 'O desporto de id 159 tinha as suas competições hospedadas em 7 lugares diferentes.'
.print 'Agora tem em:'
SELECT count (*) AS 'CompetitionLocation.idSport = 159'
FROM CompetitionLocation
WHERE CompetitionLocation.idCompetition IN (SELECT idSport from Competition WHERE idSport = 159);;

.print ''

.print 'O desporto de id 159 tinha 1 competição.'
.print 'Agora tem:'
SELECT count (*) AS 'Competition.idSport = 159'
FROM Competition
WHERE Competition.idSport = 159;