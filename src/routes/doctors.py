from flask import Blueprint, jsonify, request
import uuid

# Entities
from models.entities.Doctor import Doctor

# Models
from models.doctorModel import DoctorsModel


main = Blueprint('doctors_blueprint', __name__)


@main.route('/')
def get_doctors():
    try:
        doctors = DoctorsModel.get_doctors()
        return jsonify(doctors)
    except Exception as ex:
        return jsonify({'message': str(ex)}), 500


@main.route('/<code>')
def get_doctor(code):
    try:
        person = DoctorsModel.get_doctor(code)
        if person is not None:
            return jsonify(person)
        else:
            return jsonify({}), 404
    except Exception as ex:
        return jsonify({'message': str(ex)}), 500


@main.route('/add', methods=['POST'])
def add_doctor():
    try:
        id_doctor = request.json['id_doctor']
        cargo = request.json['cargo']
        id_especialidad = request.json['id_especialidad']
        id_person = request.json['id_person']
        num_colegio = request.json['num_colegio']

        doctor = Doctor(id_doctor, id_especialidad, id_person, num_colegio, cargo)
        affected_rows = DoctorsModel.add_doctor(doctor)

        if affected_rows == 1:
            return jsonify(doctor.id_doctor)
        else:
            return jsonify({'message': "Error on insert " + str(affected_rows)}), 500

    except Exception as ex:
        return jsonify({'message': str(ex)}), 500


@main.route('/update/<id_doctor>', methods=['PUT'])
def update_doctor(id_doctor):
    try:
        id_doctor = id_doctor
        cargo = request.json['cargo']
        id_especialidad = request.json['id_especialidad']
        id_person = request.json['id_person']
        num_colegio = request.json['num_colegio']

        doctor = Doctor(id_doctor, id_especialidad, id_person, num_colegio, cargo)

        affected_rows = DoctorsModel.update_doctor(doctor)

        if affected_rows == 1:
            return jsonify(doctor.id_doctor)
        else:
            return jsonify({'message': "Error on update " + str(affected_rows)}), 500

    except Exception as ex:
        return jsonify({'message': str(ex)}), 500


@main.route('/delete/<code>', methods=['DELETE'])
def delete_person(code):
    try:
        doctor = Doctor(code)

        affected_rows = DoctorsModel.delete_doctor(doctor)

        if affected_rows == 1:
            return jsonify(doctor.id_doctor)
        else:
            return jsonify({'message': "No person deleted"}), 404

    except Exception as ex:
        return jsonify({'message': str(ex)}), 500
