PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Ceremony(idCeremony INT PRIMARY KEY, date DATE, time TIME);
CREATE TABLE OlympicComitte(abbreviation CHAR(3) PRIMARY KEY, name TEXT, logo TEXT, recognitionDate DATE);
CREATE TABLE AttendesCeremony(OlympicCommitteeAbbreviation CHAR(3) NOT NULL,
idCeremony INT NOT NULL,
FOREIGN KEY(idCeremony) REFERENCES Ceremony(idCeremony),
FOREIGN KEY(OlympicCommitteeAbbreviation) REFERENCES OlympicComitte(abbreviation));
CREATE TABLE Participant( idParticipant INT PRIMARY KEY, abbreviation CHAR(3) NOT NULL, name TEXT, birthYear INT,
FOREIGN KEY(abbreviation) REFERENCES OlympicComitte(abbreviation));
CREATE TABLE Athlete(idParticipant INT PRIMARY KEY, firstOlympicGames TEXT, gameParticipations INT, pastGOLDmedals INT, pastSILVERmedals INT, pastBRONZEmedals INT,
FOREIGN KEY(idParticipant) REFERENCES Participant(idParticipant));
CREATE TABLE Coach( idParticipant INT PRIMARY KEY, name TEXT,
FOREIGN KEY(idParticipant) REFERENCES Participant(idParticipant));
CREATE TABLE Sport(idSport INT PRIMARY KEY, sportName TEXT);
CREATE TABLE Coaches(idParticipant INT PRIMARY KEY, idSport INT,
FOREIGN KEY(idParticipant) REFERENCES Participant(idParticipant),
FOREIGN KEY(idSport) REFERENCES Sport(idSport));
CREATE TABLE ParticipatesIn(idParticipant INT PRIMARY KEY, idSport INT,
FOREIGN KEY(idParticipant) REFERENCES Participant(idParticipant),
FOREIGN KEY(idSport) REFERENCES Sport(idSport));
CREATE TABLE Record(idRecord INT PRIMARY KEY, idParticipant INT NOT NULL, idSport INT NOT NULL, recordType TEXT, round TEXT, date DATE, 
FOREIGN KEY(idSport) REFERENCES Sport(idSport), 
FOREIGN KEY(idParticipant) REFERENCES Participant(idParticipant));
CREATE TABLE BreaksRecord(idRecord INT PRIMARY KEY, idParticipant INT NOT  NULL,
FOREIGN KEY(idParticipant) REFERENCES Participant(idParticipant),
FOREIGN KEY(idRecord) REFERENCES Record(idRecord));
CREATE TABLE IndividualDiscipline(idSport INT NOT NULL, sportName TEXT NOT NULL, disciplineName TEXT NOT NULL, permittedGender VARCHAR(5),
FOREIGN KEY(idSport) REFERENCES Sport(idSport),
FOREIGN KEY(sportName) REFERENCES Sport(sportName));
CREATE TABLE CollectiveDiscipline(idSport INT NOT NULL, sportName TEXT NOT NULL, disciplineName TEXT NOT NULL, permittedGender VARCHAR(5),
FOREIGN KEY(idSport) REFERENCES Sport(idSport),
FOREIGN KEY(sportName) REFERENCES Sport(sportName));
CREATE TABLE Competition(idCompetition INT PRIMARY KEY, idSport INT NOT NULL, startDate DATE, endDate DATE,
FOREIGN KEY(idSport) REFERENCES Sport(idSport));
CREATE TABLE CompetitionLocation(idCompetition INT NOT NULL, idLocation INT NOT NULL,
FOREIGN KEY(idCompetition) REFERENCES Competition(idCompetition),
FOREIGN KEY(idLocation) REFERENCES Location(idLocation));
CREATE TABLE Location(idLocation INT PRIMARY KEY, city TEXT NOT NULL, capacity INT);
CREATE TABLE Medal(idMedal INT PRIMARY KEY, gold INT, silver INT, bronze INT);
CREATE TABLE AtlheteEarnsMedal(idMedal INT, idParticipant INT PRIMARY KEY,
FOREIGN KEY(idMedal) REFERENCES Medal(idMedal),
FOREIGN KEY(idParticipant) REFERENCES Participant(idParticipant));
CREATE TABLE CommitteeEarnsMedal(idMedal INT, abbreviation CHAR(3) PRIMARY KEY,  
FOREIGN KEY(abbreviation) REFERENCES OlympicComitte(abbreviation),
FOREIGN KEY(idMedal) REFERENCES Medal(idMedal));
COMMIT;
