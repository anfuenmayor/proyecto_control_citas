from utils.DateFormat import DateFormat


class Doctor:

    def __init__(self, id_doctor, id_especialidad=None, id_person=None, num_colegio=None, cargo=None) -> None:
        self.id_doctor = str(id_doctor)
        self.id_especialidad = str(id_especialidad)
        self.id_person = str(id_person)
        self.num_colegio = str(num_colegio)
        self.cargo = str(cargo)

    def to_JSON(self):

        return {
            'id_doctor': self.id_doctor,
            'id_especialidad': self.id_especialidad,
            'id_person': self.id_person,
            'num_colegio': self.num_colegio,
            'cargo': self.cargo
        }
