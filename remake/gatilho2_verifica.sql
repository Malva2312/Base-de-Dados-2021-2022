.print ''

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
