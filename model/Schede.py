from pydantic import BaseModel

class ProgrammazioniSchede(BaseModel):
	id: int
	FK_programmazione: int
	FK_scheda: int

class Schede(BaseModel):
	id: int
	nome: str
	settimana_completata: int

class Esercizi(BaseModel):
	descrizione: str
	nome: str
	reps: str