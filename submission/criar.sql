DROP TABLE IF EXISTS Ceremony;
CREATE TABLE Ceremony(idCeremony INT PRIMARY KEY, date DATE NOT NULL, time TIME NOT NULL);
DROP TABLE IF EXISTS OlympicCommittee;
CREATE TABLE OlympicCommittee(abbreviation CHAR(3) PRIMARY KEY, title TEXT NOT NULL UNIQUE, logo TEXT NOT NULL UNIQUE, recognitionDate DATE);
DROP TABLE IF EXISTS AttendesCeremony;
CREATE TABLE AttendesCeremony(idCeremony INT NOT NULL,
OlympicCommitteeAbbreviation CHAR(3) NOT NULL,
FOREIGN KEY(idCeremony) REFERENCES Ceremony(idCeremony),
FOREIGN KEY(OlympicCommitteeAbbreviation) REFERENCES OlympicCommittee(abbreviation));
DROP TABLE IF EXISTS Participant;
CREATE TABLE Participant( idParticipant INT PRIMARY KEY, abbreviation CHAR(3) NOT NULL, name TEXT NOT NULL, birthYear INT,
FOREIGN KEY(abbreviation) REFERENCES OlympicCommittee(abbreviation));
DROP TABLE IF EXISTS Athlete;
CREATE TABLE Athlete(idParticipant INT PRIMARY KEY, firstOlympicGames TEXT, gameParticipations INT, pastGOLDmedals INT NOT NULL, pastSILVERmedals INT NOT NULL, pastBRONZEmedals INT NOT NULL,
FOREIGN KEY(idParticipant) REFERENCES Participant(idParticipant));
DROP TABLE IF EXISTS Coach;
CREATE TABLE Coach( idParticipant INT PRIMARY KEY,
FOREIGN KEY(idParticipant) REFERENCES Participant(idParticipant));
DROP TABLE IF EXISTS Sport;
CREATE TABLE Sport(idSport INT PRIMARY KEY, sportName TEXT NOT NULL);
DROP TABLE IF EXISTS Coaches;
CREATE TABLE Coaches(idParticipant INT NOT NULL, idSport INT NOT NULL,
FOREIGN KEY(idParticipant) REFERENCES Participant(idParticipant),
FOREIGN KEY(idSport) REFERENCES Sport(idSport));
DROP TABLE IF EXISTS ParticipatesIn;
CREATE TABLE ParticipatesIn(idParticipant INT NOT NULL, idSport INT NOT NULL,
FOREIGN KEY(idParticipant) REFERENCES Participant(idParticipant),
FOREIGN KEY(idSport) REFERENCES Sport(idSport));
DROP TABLE IF EXISTS Record;
CREATE TABLE Record(idParticipant INT NOT NULL, idSport INT NOT NULL, recordType TEXT NOT NULL, round TEXT NOT NULL, date DATE NOT NULL,
FOREIGN KEY(idSport) REFERENCES Sport(idSport),
FOREIGN KEY(idParticipant) REFERENCES Participant(idParticipant));
DROP TABLE IF EXISTS IndividualDiscipline;
CREATE TABLE IndividualDiscipline(idSport INT NOT NULL,  disciplineName TEXT NOT NULL, permittedGender VARCHAR(5),
FOREIGN KEY(idSport) REFERENCES Sport(idSport));
DROP TABLE IF EXISTS CollectiveDiscipline;
CREATE TABLE CollectiveDiscipline(idSport INT NOT NULL,  disciplineName TEXT NOT NULL, permittedGender VARCHAR(5),
FOREIGN KEY(idSport) REFERENCES Sport(idSport));
DROP TABLE IF EXISTS Competition;
CREATE TABLE Competition(idSport INT PRIMARY KEY, startDate DATE, endDate DATE,
FOREIGN KEY(idSport) REFERENCES Sport(idSport));
DROP TABLE IF EXISTS CompetitionLocation;
CREATE TABLE CompetitionLocation(idCompetition INT NOT NULL, idLocation INT NOT NULL,
FOREIGN KEY(idCompetition) REFERENCES Competition(idSport),
FOREIGN KEY(idLocation) REFERENCES Location(idLocation));
DROP TABLE IF EXISTS Location;
CREATE TABLE Location(idLocation INT PRIMARY KEY, name TEXT NOT NULL, capacity INT);
DROP TABLE IF EXISTS Medal;
CREATE TABLE Medal(idMedal INT PRIMARY KEY, gold INT, silver INT, bronze INT,
CHECK(gold + silver + bronze = 1));
DROP TABLE IF EXISTS AthleteEarnsMedal;
CREATE TABLE AthleteEarnsMedal(idMedal INT NOT NULL, idParticipant INT NOT NULL,
FOREIGN KEY(idMedal) REFERENCES Medal(idMedal),
FOREIGN KEY(idParticipant) REFERENCES Participant(idParticipant));
DROP TABLE IF EXISTS CommitteeEarnsMedal;
CREATE TABLE CommitteeEarnsMedal(idMedal INT NOT NULL, abbreviation CHAR(3) NOT NULL,
FOREIGN KEY(abbreviation) REFERENCES OlympicCommittee(abbreviation),
FOREIGN KEY(idMedal) REFERENCES Medal(idMedal));