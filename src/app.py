from flask import Flask

from flask_cors import CORS

from config import config


# Routes
from routes import specialities
from routes import persons
from routes import doctors


def page_not_found(error):
    return "<h1>Not found page</h1>", 404


app = Flask(__name__)

if __name__ == '__main__':

    # Blueprints
    app.register_blueprint(specialities.main, url_prefix='/api/specialities')
    app.register_blueprint(persons.main, url_prefix='/api/persons')
    app.register_blueprint(doctors.main, url_prefix='/api/doctors')

    # Gestor de errores
    app.register_error_handler(404, page_not_found)
    app.config.from_object(config['development'])
    app.run()


