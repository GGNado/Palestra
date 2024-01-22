from fastapi import APIRouter, HTTPException, Request
from fastapi.templating import Jinja2Templates
from controller.Database import *

router = APIRouter(
	tags = ['Programmazioni'],
	prefix = '/api/v1.0/palestra/programmazioni'
)

templates = Jinja2Templates (
	directory = 'templates',
	autoescape = False,
	auto_reload = True
)

@router.get('/{id}')
async def getPagina(req: Request, id: int):
	return templates.TemplateResponse(
		'programmazioniUtente.html', {
			'request': req,
			'programmazioni': getProgrammazioniByID(id)
		}
	)
