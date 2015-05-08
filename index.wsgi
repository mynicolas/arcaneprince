import sae
from arcaneprince import wsgi

application = sae.create_wsgi_app(wsgi.application)