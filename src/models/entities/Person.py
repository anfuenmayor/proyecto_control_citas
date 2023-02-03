from utils.DateFormat import DateFormat


class Person:

    def __init__(self, user_id, rut=None, name=None, surname=None, address=None, email=None, phone=None) -> None:
        self.user_id = str(user_id)
        self.rut = str(rut)
        self.name = str(name)
        self.surname = str(surname)
        self.address = str(address)
        self.email = str(email)
        self.phone = str(phone)

    def to_JSON(self):

        return {
            'user_id': self.user_id,
            'rut': self.rut,
            'name': self.name,
            'surname': self.surname,
            'address': self.address,
            'email': self.email,
            'phone': self.phone
        }
