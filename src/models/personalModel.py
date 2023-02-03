import re
from database.db import get_connection
from .entities.Person import Person


class PersonsModel:

    @classmethod
    def get_persons(self):
        try:
            connection = get_connection()
            persons = []

            with connection.cursor() as cursor:
                cursor.execute('SELECT user_id, rut, nombre, apellido, domicilio, email, telefono FROM personal')
                resultset = cursor.fetchall()

                for row in resultset:
                    person = Person(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
                    persons.append(person.to_JSON())

            connection.close()
            return persons
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_person(self, id):
        try:
            connection = get_connection()

            with connection.cursor() as cursor:
                cursor.execute('SELECT user_id, rut, nombre, apellido, domicilio, email, telefono FROM'
                               ' personal WHERE user_id = %s', (id,))
                row = cursor.fetchone()

                persona = None
                if row is not None:
                    data = Person(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
                    persona = data.to_JSON()

            connection.close()
            return persona
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def add_person(self, person):
        try:
            connection = get_connection()
            #  user_id, rut, nombre, apellido, domicilio, email, telefono
            rut = "'" + person.rut + "'"
            nombre = "'" + person.name + "'"
            apellido = "'" + person.surname + "'"
            domicilio = "'" + person.address + "'"
            email = "'" + person.email + "'"
            telefono = "'" + person.phone + "'"
            if len(rut) > 20:
                return "Rut excede la longitud de 20 caracteres"
            if len(nombre) > 40:
                return "Nombre excede la longitud de 40 caracteres"
            if len(apellido) > 30:
                return "Apellidos excede la longitud de 30 caracteres"
            with connection.cursor() as cursor:

                cursor.execute('INSERT INTO public.personal (rut, nombre, apellido,'
                               ' domicilio, email, telefono)VALUES ({},{},{},{},{},{})'.format(rut, nombre, apellido,
                                                                                          domicilio,
                                                                                          email, telefono))
                affected_rows = cursor.rowcount
                connection.commit()

            connection.close()
            return affected_rows
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def update_person(self, person):
        try:
            connection = get_connection()
            code = person.user_id
            rut = "'" + person.rut + "'"
            nombre = "'" + person.name + "'"
            apellido = "'" + person.surname + "'"
            domicilio = "'" + person.address + "'"
            email = "'" + person.email + "'"
            telefono = "'" + person.phone + "'"
            with connection.cursor() as cursor:
                cursor.execute('UPDATE public.personal SET rut={}, nombre= {}, '
                               ' apellido= {}, domicilio= {} , email= {}, telefono= {}  '
                               'WHERE user_id={}'.format(rut, nombre, apellido, domicilio, email, telefono, code))
                affected_rows = cursor.rowcount
                connection.commit()

            connection.close()
            return affected_rows
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def delete_person(self, person):
        try:
            connection = get_connection()

            with connection.cursor() as cursor:
                cursor.execute("DELETE FROM personal WHERE user_id = %s", (person.user_id,))
                affected_rows = cursor.rowcount
                connection.commit()

            connection.close()
            return affected_rows
        except Exception as ex:
            raise Exception(ex)
