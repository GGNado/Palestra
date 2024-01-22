from fastapi import APIRouter, HTTPException, Request
from fastapi.templating import Jinja2Templates
from controller.Database import *

router = APIRouter(
	tags = ['Schede'],
	prefix = '/api/v1.0/palestra/programmazioni/schede'
)

templates = Jinja2Templates (
	directory = 'templates',
	autoescape = False,
	auto_reload = True
)

@router.get('/{id}')
async def getPagina(req: Request, id: int):
	listaSchede = getSchedeProgramma(id)
	listaSchedeSingole = getSchedeSingole(listaSchede)
	return templates.TemplateResponse(
		'schedeUtente.html', {
			'request': req,
			'schedeGenerali': listaSchede,
			'schedeSingole': listaSchedeSingole,
			'idProgrammazione': id
		}
	)
@router.get('/{id}/{idScheda}')
async def getPagina(req: Request, id: int, idScheda: int):
	return templates.TemplateResponse(
		'EserciziUtente.html', {
			'request': req,
			'esercizi': getEserciziDellaScheda(idScheda)
		}
	)
