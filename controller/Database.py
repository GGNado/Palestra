import mysql.connector as dbms

from model.Programmazioni import Programmazione
from model.Schede import ProgrammazioniSchede
from model.Schede import Schede
from model.Schede import Esercizi
def getConnection():
	return dbms.connect(
		host = 'localhost',
		port = 3306,
		user = 'root',
		password = '',
		database = 'Palestra'
	)

def getProgrammazioniByID(id: int):
	connessione = getConnection()
	if connessione.is_connected():
		QUERY = "SELECT * FROM Programmazioni WHERE ID = %s"
		listaProgrammazioni = []
		cursore = connessione.cursor()
		cursore.execute(QUERY, (id,))
		results = cursore.fetchall()
		for row in results:
			listaProgrammazioni.append(Programmazione(id=int(row[0]), FK_utente=int(row[1]), dataInizio=row[2], dataFine=row[3]))
		cursore.close()
		connessione.close()
		return listaProgrammazioni

def getSchedeProgramma(id: int):
	connessione = getConnection()
	if connessione.is_connected():
		QUERY = "SELECT * FROM ProgrammazioniSchede WHERE FK_programmazione = %s"
		listaSchede = []
		cursore = connessione.cursor()
		cursore.execute(QUERY, (id,))
		results = cursore.fetchall()
		for row in results:
			listaSchede.append(ProgrammazioniSchede(id=int(row[0]), FK_programmazione=int(row[1]), FK_scheda=int(row[2])))
		cursore.close()
		connessione.close()
		return listaSchede

def getSchedeSingole(schede: list):
	connessione = getConnection()
	if connessione.is_connected():
		cursore = connessione.cursor()
		listaSchedeSingole = []
		for s in schede:
			QUERY = "SELECT * FROM Schede WHERE id = %s"

			cursore.execute(QUERY, (s.FK_scheda,))
			results = cursore.fetchall()
			for row in results:
				listaSchedeSingole.append(
					Schede(id=int(row[0]), nome=row[1], settimana_completata=row[2]))
		cursore.close()
		connessione.close()
		return listaSchedeSingole

def getEserciziDellaScheda(id: int):
	connessione = getConnection()
	if connessione.is_connected():
		cursore = connessione.cursor()
		eserciziScheda = []
		QUERY = """
		SELECT SchedeEsercizi.descrizione, Esercizi.nome, SchedeEsercizi.reps
		FROM SchedeEsercizi
         JOIN Esercizi ON SchedeEsercizi.FK_es = Esercizi.id
		WHERE SchedeEsercizi.FK_scheda = %s;
		"""
		cursore.execute(QUERY, (id,))
		results = cursore.fetchall()
		for row in results:
			eserciziScheda.append(
				Esercizi(descrizione=row[0], nome=row[1], reps=row[2]))
		cursore.close()
		connessione.close()
		return eserciziScheda

