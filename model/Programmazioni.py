from datetime import datetime
from pydantic import BaseModel

class Programmazione(BaseModel):
	id: int
	FK_utente: int
	dataInizio: datetime
	dataFine: datetime
