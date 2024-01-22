-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Gen 22, 2024 alle 13:49
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Palestra`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Carichi`
--

CREATE TABLE `Carichi` (
  `ID` int(11) NOT NULL,
  `peso` int(11) DEFAULT NULL,
  `dataInserimento` date DEFAULT NULL,
  `FK_schedaEs` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Esercizi`
--

CREATE TABLE `Esercizi` (
  `ID` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `descrizione` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Esercizi`
--

INSERT INTO `Esercizi` (`ID`, `nome`, `descrizione`) VALUES
(1, 'Panca Piana', 'Esercizio per lo sviluppo dei muscoli pettorali. Si esegue sdraiati su una panca con un bilanciere, abbassando e sollevando il bilanciere.'),
(2, 'Squat', 'Esercizio per lo sviluppo dei muscoli delle gambe. Si esegue con il bilanciere posizionato sulle spalle, piegando le ginocchia e abbassandosi verso il basso.'),
(3, 'Stacchi da Terra', 'Esercizio per la parte bassa della schiena e la parte posteriore delle gambe. Si esegue sollevando un bilanciere da terra.'),
(4, 'Curl Bicipiti', 'Esercizio mirato ai muscoli bicipiti. Si esegue sollevando un peso con il braccio piegato.'),
(5, 'Crunch', 'Esercizio addominale in cui si solleva la parte superiore del corpo dal pavimento.'),
(6, 'Flessioni', 'Esercizio che coinvolge i muscoli pettorali, tricipiti e deltoidi. Si esegue spingendo il corpo verso l\'alto e abbassandosi.'),
(7, 'Affondi', 'Esercizio per le gambe che coinvolge il movimento di avanzamento di una gamba mentre l\'altra rimane indietro.'),
(8, 'Alzate Laterali', 'Esercizio per i deltoidi laterali. Si esegue sollevando i pesi lateralmente con le braccia leggermente piegate.'),
(9, 'Addominali a V', 'Esercizio addominale avanzato che coinvolge il sollevamento simultaneo di gambe e busto.'),
(10, 'Mountain Climbers', 'Esercizio cardiovascolare e addominale che simula il movimento di corsa in posizione orizzontale.'),
(21, 'Spinte manubri 30°', 'Panca a 30°'),
(22, 'Croci ai cavi 30°', 'Panca a 30°'),
(23, 'Dip alla parallele', 'Piglj e sbarr forza'),
(24, 'Alzate Laterali Singole multiflight', 'Metti la pezza sul polso'),
(25, 'Alzate laterali manubrio', 'Fai te'),
(26, 'Wrist curl', 'ABC'),
(27, 'Muscle up', NULL),
(28, 'Rematore', NULL),
(29, 'Trazioni', NULL),
(30, 'Pulley', NULL),
(31, 'Lat machine', NULL),
(32, 'Side pull', NULL),
(33, 'Tirate posteriori', NULL),
(34, 'Scrollate', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `Programmazioni`
--

CREATE TABLE `Programmazioni` (
  `ID` int(11) NOT NULL,
  `FK_utente` int(11) DEFAULT NULL,
  `dataInizio` date NOT NULL,
  `dataFine` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Programmazioni`
--

INSERT INTO `Programmazioni` (`ID`, `FK_utente`, `dataInizio`, `dataFine`) VALUES
(1, 1, '2024-01-20', '2024-05-18'),
(2, 2, '2024-01-17', '2024-01-31');

-- --------------------------------------------------------

--
-- Struttura della tabella `ProgrammazioniSchede`
--

CREATE TABLE `ProgrammazioniSchede` (
  `ID` int(11) NOT NULL,
  `FK_programmazione` int(11) DEFAULT NULL,
  `FK_scheda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ProgrammazioniSchede`
--

INSERT INTO `ProgrammazioniSchede` (`ID`, `FK_programmazione`, `FK_scheda`) VALUES
(7, 1, 5),
(8, 1, 6),
(9, 1, 7),
(10, 1, 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `Schede`
--

CREATE TABLE `Schede` (
  `ID` int(11) NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `settimana_completata` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Schede`
--

INSERT INTO `Schede` (`ID`, `nome`, `settimana_completata`) VALUES
(5, 'Petto + Spalle', 0),
(6, 'Dorso', 0),
(7, 'Gambe', 0),
(8, 'Bicipiti + Tricipiti', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `SchedeEsercizi`
--

CREATE TABLE `SchedeEsercizi` (
  `ID` int(11) NOT NULL,
  `FK_es` int(11) DEFAULT NULL,
  `FK_scheda` int(11) DEFAULT NULL,
  `descrizione` text NOT NULL,
  `reps` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `SchedeEsercizi`
--

INSERT INTO `SchedeEsercizi` (`ID`, `FK_es`, `FK_scheda`, `descrizione`, `reps`) VALUES
(4, 1, 5, 'Rest 3 Fermo 1, S1-S2 buffer 2, S3-S4 buffer 1 e back-off 15%, S5 buffer 2, S6 rpe 7,8,10', 'S1-S2 4x4\nS3 1x3 3x3\nS4 1x2 3x2\nS5 4x3\nS6 1x1'),
(5, 21, 5, 'Rest 2 ', '4x5'),
(6, 22, 5, 'Panca 30°', '4x6'),
(7, 23, 5, 'Rest 2, Se fai 10rep + aumenta zavorra', '4xMAX'),
(8, 24, 5, 'Rest 2', 'S1-2 4x10\nS3-4 4x8\nS5-6 4x6'),
(9, 25, 5, 'Rest 2, Stripping con mezze max controllate', '3x8+8+max'),
(10, 26, 5, 'Rest 1, Cavo basso da seduto con fatgrip', '4x8x8-12-15');

-- --------------------------------------------------------

--
-- Struttura della tabella `Utenti`
--

CREATE TABLE `Utenti` (
  `ID` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Utenti`
--

INSERT INTO `Utenti` (`ID`, `nome`, `cognome`) VALUES
(1, 'Luigi', 'Massa'),
(2, 'Gab', 'Iacca');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Carichi`
--
ALTER TABLE `Carichi`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_schedaEs` (`FK_schedaEs`);

--
-- Indici per le tabelle `Esercizi`
--
ALTER TABLE `Esercizi`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `Programmazioni`
--
ALTER TABLE `Programmazioni`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_utente` (`FK_utente`);

--
-- Indici per le tabelle `ProgrammazioniSchede`
--
ALTER TABLE `ProgrammazioniSchede`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_programmazione` (`FK_programmazione`),
  ADD KEY `FK_scheda` (`FK_scheda`);

--
-- Indici per le tabelle `Schede`
--
ALTER TABLE `Schede`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `SchedeEsercizi`
--
ALTER TABLE `SchedeEsercizi`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_es` (`FK_es`),
  ADD KEY `FK_scheda` (`FK_scheda`);

--
-- Indici per le tabelle `Utenti`
--
ALTER TABLE `Utenti`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Carichi`
--
ALTER TABLE `Carichi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Esercizi`
--
ALTER TABLE `Esercizi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT per la tabella `Programmazioni`
--
ALTER TABLE `Programmazioni`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `ProgrammazioniSchede`
--
ALTER TABLE `ProgrammazioniSchede`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `Schede`
--
ALTER TABLE `Schede`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `SchedeEsercizi`
--
ALTER TABLE `SchedeEsercizi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `Utenti`
--
ALTER TABLE `Utenti`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Carichi`
--
ALTER TABLE `Carichi`
  ADD CONSTRAINT `carichi_ibfk_1` FOREIGN KEY (`FK_schedaEs`) REFERENCES `SchedeEsercizi` (`ID`);

--
-- Limiti per la tabella `Programmazioni`
--
ALTER TABLE `Programmazioni`
  ADD CONSTRAINT `programmazioni_ibfk_1` FOREIGN KEY (`FK_utente`) REFERENCES `Utenti` (`ID`);

--
-- Limiti per la tabella `ProgrammazioniSchede`
--
ALTER TABLE `ProgrammazioniSchede`
  ADD CONSTRAINT `programmazionischede_ibfk_1` FOREIGN KEY (`FK_programmazione`) REFERENCES `Programmazioni` (`ID`),
  ADD CONSTRAINT `programmazionischede_ibfk_2` FOREIGN KEY (`FK_scheda`) REFERENCES `Schede` (`ID`);

--
-- Limiti per la tabella `SchedeEsercizi`
--
ALTER TABLE `SchedeEsercizi`
  ADD CONSTRAINT `schedeesercizi_ibfk_1` FOREIGN KEY (`FK_es`) REFERENCES `Esercizi` (`ID`),
  ADD CONSTRAINT `schedeesercizi_ibfk_2` FOREIGN KEY (`FK_scheda`) REFERENCES `Schede` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
