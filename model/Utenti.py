from pydantic import BaseModel

class Utente(BaseModel):
	id: int
	firstname: str
	lastname: str