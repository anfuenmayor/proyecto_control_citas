import re
from database.db import get_connection
from .entities.Doctor import Doctor


class DoctorsModel:

    @classmethod
    def get_doctors(self):
        try:
            connection = get_connection()
            doctors = []

            with connection.cursor() as cursor:
                cursor.execute('SELECT id_doctor, id_especialidad, id_person, num_colegio, cargo FROM doctor')
                resultset = cursor.fetchall()

                for row in resultset:
                    doctor = Doctor(row[0], row[1], row[2], row[3], row[4])
                    doctors.append(doctor.to_JSON())

            connection.close()
            return doctors
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_doctor(self, id):
        try:
            connection = get_connection()

            with connection.cursor() as cursor:
                cursor.execute('SELECT id_doctor, id_especialidad, id_person, num_colegio, cargo FROM'
                               ' doctor WHERE id_doctor = %s', (id,))
                row = cursor.fetchone()

                doctor = None
                if row is not None:
                    data = Doctor(row[0], row[1], row[2], row[3], row[4])
                    doctor = data.to_JSON()

            connection.close()
            return doctor
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def add_doctor(self, doctor):
        try:
            connection = get_connection()
            #id_especialidad = "'" + doctor.id_especialidad + "'"
            id_especialidad = int(doctor.id_especialidad)
            id_person = int(doctor.id_person)
            #num_colegio = "'" + doctor.num_colegio + "'"
            num_colegio = doctor.num_colegio
            cargo = "'" + doctor.cargo + "'"

            if len(cargo) > 20:
                return "El cargo excede la longitud de 20 caracteres"
            if len(num_colegio) > 30:
                return "El num de colegio excede la longitud de 30 caracteres"
            with connection.cursor() as cursor:
                sql = 'INSERT INTO public.doctor( id_especialidad, id_person, num_colegio, cargo) ' \
                      'VALUES ({0}, {1}, {2}, {3})'.format(id_especialidad, id_person, num_colegio, cargo)
                cursor.execute(sql)
                affected_rows = cursor.rowcount
                connection.commit()

            connection.close()
            return affected_rows
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def update_doctor(self, doctor):
        try:
            connection = get_connection()
            doctor_id = "'" + doctor.id_doctor + "'"
            id_especialidad = "'" + doctor.id_especialidad + "'"
            id_person = "'" + doctor.id_person + "'"
            num_colegio = "'" + doctor.num_colegio + "'"
            cargo = "'" + doctor.cargo + "'"
            with connection.cursor() as cursor:
                cursor.execute('UPDATE public.doctor SET id_especialidad={}, id_person= {}, '
                               ' num_colegio= {}, cargo= {}  '
                               'WHERE id_doctor={}'.format(id_especialidad, id_person, num_colegio, cargo, doctor_id))
                affected_rows = cursor.rowcount
                connection.commit()

            connection.close()
            return affected_rows
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def delete_doctor(self, doctor):
        try:
            connection = get_connection()

            with connection.cursor() as cursor:
                cursor.execute("DELETE FROM doctor WHERE id_doctor = %s", (doctor.id_doctor,))
                affected_rows = cursor.rowcount
                connection.commit()

            connection.close()
            return affected_rows
        except Exception as ex:
            raise Exception(ex)
