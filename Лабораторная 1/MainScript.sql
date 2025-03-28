DROP TABLE Appointnment;
DROP TABLE ClientsInClinic;
DROP TABLE PetsInClinic;
DROP TABLE MedicamentsInClinic;
DROP TABLE DoctorsInCLinic;
DROP TABLE ClinicsInCity;
DROP TABLE Location;

CREATE TABLE Location(
    LocationId SERIAL PRIMARY KEY,
    Name TEXT
);

CREATE TABLE ClinicsInCity(
    ClinicId SERIAL PRIMARY KEY,
    Name TEXT,
    City TEXT,
    District TEXT,
    LocationId INTEGER REFERENCES Location(LocationId)
);

CREATE TABLE MedicamentsInClinic(
    MedicamentId SERIAL PRIMARY KEY,
    Name TEXT,
    AmountAtWareHouse INTEGER,
    ClinicId INTEGER REFERENCES ClinicsInCity(ClinicId)
);

CREATE TABLE DoctorsInClinic(
    DoctorID SERIAL PRIMARY KEY,
    FIO TEXT UNIQUE,
    IsBusyNow BOOLEAN,
    IsOnVocation BOOLEAN,
    WorkInThisClinic INTEGER REFERENCES ClinicsInCity(CLinicId)
);

CREATE TABLE PetsInClinic(
    PetId SERIAL PRIMARY KEY,
    Name TEXT,
    Type TEXT NOT NULL
);

CREATE TABLE ClientsInClinic(
    ClientId SERIAL PRIMARY KEY,
    FIO TEXT UNIQUE,
    DateOfBirth DATE
);

CREATE TABLE Appointnment(
    AppointnmentId SERIAL PRIMARY KEY,
    ClientId INTEGER REFERENCES ClientsInClinic(ClientId) NOT NULL CHECK( ClientId > 0),
    DoctorId INTEGER REFERENCES DoctorsInClinic(DoctorId) NOT NULL CHECK( DoctorId > 0),
    PetId INTEGER REFERENCES PetsInClinic(PetId),
    ClinicId INTEGER REFERENCES ClinicsInCity(ClinicId) NOT NULL CHECK( ClinicId > 0),
    DateOfAppointment DATE
);

-- 1 без сериала
INSERT INTO Location(Name) VALUES ('Sloblovka');
INSERT INTO Location(Name) VALUES ('Morkovka');

-- 4 без сериала
INSERT INTO ClinicsInCity(Name, City, District, LocationId) VALUES ('Clinic1', 'Saint-Petersburg', 'Primorsky', 1);
INSERT INTO ClinicsInCity(Name, City, District, LocationId) VALUES ('Clinic2', 'Saint-Petersburg', 'Moskovsky', 2);

-- 2 без сериала
INSERT INTO MedicamentsInClinic(Name, AmountAtWareHouse, ClinicId) VALUES ('Fosfat Natriya', 16,1);
INSERT INTO MedicamentsInClinic(Name, AmountAtWareHouse, ClinicId) VALUES ('Metadon', 25,1);
INSERT INTO MedicamentsInClinic(Name, AmountAtWareHouse,ClinicId) VALUES ('Efir', 1,2);

-- 4 без сериала
INSERT INTO DoctorsInClinic(FIO, IsBusyNow, IsOnVocation, WorkInThisClinic) VALUES ('Ivan Ivanov', false, false, 1);
INSERT INTO DoctorsInClinic(FIO, IsBusyNow, IsOnVocation, WorkInThisClinic) VALUES ('Alex Alexandrov', true, false, 2);

-- 2 без сериала
INSERT INTO PetsInClinic(name, type) VALUES ('BOBA', 'BIG ABOBA');
INSERT INTO PetsInClinic(name, type) VALUES ('BIBA', 'BIG BIBA');
INSERT INTO PetsInClinic(name, type) VALUES ('CANZAL', 'PUDEL');

-- 2 без сериала, я удалил возраст, он не нужен
INSERT INTO ClientsInClinic(FIO, DateOfBirth) VALUES ('Romanov Stepan Olegovich', '1995-05-21');
INSERT INTO ClientsInClinic(FIO, DateOfBirth) VALUES ('Gorshelev Kirill Valerevics', '2006-05-18');

INSERT INTO Appointnment(ClientId, DoctorId, PetId, ClinicId, DateOfAppointment) VALUES (1, 2,1, 1, '2025-03-27');
INSERT INTO Appointnment(ClientId, DoctorId, PetId, ClinicId, DateOfAppointment) VALUES (2, 1,2, 2, '2025-03-25');

-- абоба

SELECT * FROM Appointnment;
SELECT * FROM ClientsInClinic;
SELECT * FROM PetsInClinic;
SELECT * FROM DoctorsInCLinic;
SELECT * FROM MedicamentsInClinic;
SELECT * FROM Location;
SELECT * FROM ClinicsInCity;
