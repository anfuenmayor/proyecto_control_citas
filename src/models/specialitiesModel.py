import re
from database.db import get_connection
from .entities.Specialty import Specialty


class SpecialtiesModel:

    @classmethod
    def get_specialities(self):
        try:
            connection = get_connection()
            especialidades = []

            with connection.cursor() as cursor:
                cursor.execute('SELECT especialidades.Codigo, especialidades.Nombre FROM especialidades')
                resultset = cursor.fetchall()

                for row in resultset:
                    specialty = Specialty(row[0], row[1])
                    especialidades.append(specialty.to_JSON())

            connection.close()
            return especialidades
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_specialty(self, id):
        try:
            connection = get_connection()

            with connection.cursor() as cursor:
                cursor.execute('SELECT Codigo,Nombre FROM'
                               ' especialidades WHERE Codigo = %s', (id,))
                row = cursor.fetchone()

                especialidades = None
                if row != None:
                    specialities = Specialty(row[0], row[1])
                    especialidades = specialities.to_JSON()

            connection.close()
            return especialidades
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def add_specialty(self, specialty):
        try:
            connection = get_connection()
            nombre = "'" + specialty.nombre + "'"
            if len(nombre) > 255:
                return "Nombre excede la longitud de 255 caracteres"
            with connection.cursor() as cursor:
                cursor.execute('INSERT INTO public.especialidades( nombre)VALUES ({})'.format(nombre))
                affected_rows = cursor.rowcount
                connection.commit()

            connection.close()
            return affected_rows
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def update_specialty(self, specialty):
        try:
            connection = get_connection()
            code = specialty.id
            name = "'" + specialty.nombre + "'"
            with connection.cursor() as cursor:
                cursor.execute('UPDATE public.especialidades SET nombre= {} '
                               'WHERE codigo={}'.format(name, code))
                affected_rows = cursor.rowcount
                connection.commit()

            connection.close()
            return affected_rows
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def delete_specialty(self, especialidad):
        try:
            connection = get_connection()

            with connection.cursor() as cursor:
                cursor.execute("DELETE FROM especialidades WHERE codigo = %s", (especialidad.id,))
                affected_rows = cursor.rowcount
                connection.commit()

            connection.close()
            return affected_rows
        except Exception as ex:
            raise Exception(ex)
