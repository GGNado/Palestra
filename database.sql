DROP DATABASE IF EXISTS Palestra;
CREATE DATABASE Palestra;
USE Palestra;
CREATE TABLE Utenti (
    ID int PRIMARY KEY AUTO_INCREMENT,
    nome varchar(30) not null,
    cognome varchar(30) not null
);

CREATE TABLE Esercizi (
    ID int PRIMARY KEY AUTO_INCREMENT,
    nome varchar(60) not null,
    descrizione text
);
CREATE TABLE Programmazioni (
                                ID int PRIMARY KEY AUTO_INCREMENT,
                                FK_utente int,
                                dataInizio DATE not null,
                                dataFine DATE not null,
                                FOREIGN KEY (FK_utente) REFERENCES Utenti(ID)
);
CREATE TABLE Schede (
    ID int PRIMARY KEY AUTO_INCREMENT,
    FK_Programmazione int,
    nome varchar(20),
    settimana_completata boolean DEFAULT 0,
    FOREIGN KEY (FK_Programmazione) REFERENCES Programmazioni(ID)
);

CREATE TABLE SchedeEsercizi (
    ID int AUTO_INCREMENT PRIMARY KEY,
    FK_es int,
    FK_scheda int,
    descrizione varchar(255) not null,
    FOREIGN KEY (FK_es) REFERENCES Esercizi(ID),
    FOREIGN KEY (FK_scheda) REFERENCES Schede(ID)
);



CREATE TABLE ProgrammazioniSchede (
    ID int PRIMARY KEY AUTO_INCREMENT,
    FK_programmazione int,
    FK_scheda int,
    FOREIGN KEY (FK_programmazione) REFERENCES Programmazioni(ID),
    FOREIGN KEY (FK_scheda) REFERENCES Schede(ID)
);

CREATE TABLE Carichi (
    ID int PRIMARY KEY AUTO_INCREMENT,
    dataInserimento DATE,
    FK_es int,
    FK_scheda int,
    FOREIGN KEY (FK_es) REFERENCES Esercizi(ID),
    FOREIGN KEY (FK_scheda) REFERENCES Schede(ID)
);
