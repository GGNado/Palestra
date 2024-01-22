import uvicorn
import jinja2
import httptools
from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates

from controller.ProgrammazioniRotte import router as programmazioniRotte
from controller.SchedeRotte import router as schedaRotte

webapp = FastAPI(
	title = 'Palestra Programmazioni',
	decription = 'Tener traccia delle programmazioni'
)

templates = Jinja2Templates (
	directory = 'templates',
	autoescape = False,
	auto_reload = True
)

webapp.mount(
	'/static',
	app = StaticFiles(directory = 'static'),
	name = 'static'
)

@webapp.get('/', response_class = HTMLResponse)
async def root(req: Request):
	return templates.TemplateResponse(
		'root.html', {
			'request': req,
		}
	)

webapp.include_router(programmazioniRotte)
webapp.include_router(schedaRotte)

if __name__ == '__main__':
	uvicorn.run(
		'main:webapp',
		host = '0.0.0.0',
		port = 3000,
		# use_colors = False,
		http = 'httptools',
		reload = True
	)