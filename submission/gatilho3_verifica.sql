.print ''

.print 'Primeiramente verificamos a existência da medalha de id 984.'
.print ''

.print 'Interrogando a tabela Medal onde idMedal = 984 obtemos:'

SELECT * FROM Medal WHERE idMedal = 984;

.print ''

.print 'Interrogando a tabela AthleteEarnsMedal onde idMedal = 984 obtemos:'

SELECT * FROM AthleteEarnsMedal WHERE idMedal = 984;

.print ''

.print 'Interrogando a tabela CommitteeEarnsMedal onde idMedal = 984 obtemos:'

SELECT * FROM CommitteeEarnsMedal WHERE idMedal = 984;

.print ''

.print 'Após verificar a existência da medalha de id 984, atualizamos a mesma para gold = 3, silver = 0, bronze = 0, o que não é possível pois nenhuma medalha conta por 3.'
.print 'Resultando:'

UPDATE Medal SET gold = 3, silver = 0, silver = 0 WHERE idMedal = 984;

.print ''
.print 'Desta vez atualizamos a medalha para gold = 1, silver = 1, bronze = 0, que, pela mesma lógica, não é possível pois uma medalha não pode ser tanto de ouro como de prata ao mesmo tempo.'
.print 'Resultando:'

UPDATE Medal SET gold = 1, silver = 1, bronze = 0 WHERE idMedal = 984;

.print ''
.print 'Após estas tentativas, atualizamos a medalha, que préviamente era de ouro para prata, ou seja, gold = 0, silver = 1, bronze = 0, o que, é possível.'
UPDATE Medal SET gold = 0, silver = 1, bronze = 0 WHERE idMedal = 984;
.print 'Não dá erro, portanto, verificando a medalha obtemos:'

SELECT * FROM Medal WHERE idMedal = 984;

.print ''
.print 'Verificamos que, de facto, a medalha agora é de prata.'

.print ''
.print 'Agora, atualizando para gold = 0, silver=0, bronze = 0 a medalha deixa de ter valor, portanto deve ser eliminada.'

UPDATE Medal SET gold = 0, silver = 0, bronze = 0 WHERE idMedal = 984; 

.print 'Após a atualização, verifico se a medalha ainda existe, o que implica verificar se ainda está registada nas tabelas AthleteEarnsMedal, visto que nenhum atleta obtém algo inexistente, e CommitteeEarnsMedal pelo mesmo motivo.'

.print ''

.print 'Primeiramente verificamos a existência da medalha de id 984.'
.print ''

.print 'Interrogando a tabela Medal onde idMedal = 984 obtemos:'

SELECT * FROM Medal WHERE idMedal = 984;

.print ''

.print 'Interrogando a tabela AthleteEarnsMedal onde idMedal = 984 obtemos:'

SELECT * FROM AthleteEarnsMedal WHERE idMedal = 984;

.print ''

.print 'Interrogando a tabela CommitteeEarnsMedal onde idMedal = 984 obtemos:'

SELECT * FROM CommitteeEarnsMedal WHERE idMedal = 984;

.print ''

.print 'Concluindo que a medalha de id 984 foi eliminada.'


/*
.print 'Ao tentar inserir um novo participante chamado Afonso Abreu com o id 7000, abbreviation "POR" e birthYear 2002'
INSERT INTO Participant VALUES(7000,'POR','Afonso Abreu',2002);
.print 'Verificamos que de facto ele existe nos Participants'
select * from Participant where idParticipant = 7000;

.print ''

.print 'No entanto ao tentar inserir um novo participante chamado João Malva com o id 7, abbreviation "POR" e birthYear 2002'
INSERT INTO Participant VALUES(6999,'POR','João Malva',2002);
.print 'Verificamos que dá erro visto que já existe um participante com esse id:'
select * from Participant where idParticipant = 7;

.print ''

.print 'Também ao tentar inserir um novo participante chamado André Ávila com o id 7001, abbreviation "PTR" e birthYear 2002'
INSERT INTO Participant VALUES(7001,'PTR','André Ávila',2002);
.print 'Verificamos que dá erro pois embora não exista nenhum participante com id 7001, "PTR" não faz parte dos comités olímpicos'
*/