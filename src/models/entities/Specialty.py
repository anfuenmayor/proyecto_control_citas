from utils.DateFormat import DateFormat


class Specialty:

    def __init__(self, id, nombre=None) -> None:
        self.id = str(id)
        self.nombre = str(nombre)

    def to_JSON(self):

        return {
            'id': self.id,
            'nombre': self.nombre
        }
