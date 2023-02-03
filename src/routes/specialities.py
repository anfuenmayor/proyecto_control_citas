from flask import Blueprint, jsonify, request
import uuid

# Entities
from models.entities.Specialty import Specialty

# Models
from models.specialitiesModel import SpecialtiesModel


main = Blueprint('specialities_blueprint', __name__)


@main.route('/')
def get_specialities():
    try:
        especialidades = SpecialtiesModel.get_specialities()
        return jsonify(especialidades)
    except Exception as ex:
        return jsonify({'message': str(ex)}), 500


@main.route('/<id>')
def get_specialty(code):
    try:
        especialidad = SpecialtiesModel.get_specialty(code)
        if especialidad is not None:
            return jsonify(especialidad)
        else:
            return jsonify({}), 404
    except Exception as ex:
        return jsonify({'message': str(ex)}), 500


@main.route('/add', methods=['POST'])
def add_specialty():
    try:
        code = request.json['id']
        name = request.json['nombre']

        specialty = Specialty(code, name)

        affected_rows = SpecialtiesModel.add_specialty(specialty)

        if affected_rows == 1:
            return jsonify(specialty.id)
        else:
            return jsonify({'message': "Error on insert " + str(affected_rows)}), 500

    except Exception as ex:
        return jsonify({'message': str(ex)}), 500


@main.route('/update/<code>', methods=['PUT'])
def update_specialty(code):
    try:
        name = request.json['nombre']

        specialty = Specialty(code, name)

        affected_rows = SpecialtiesModel.update_specialty(specialty)

        if affected_rows == 1:
            return jsonify(specialty.id)
        else:
            return jsonify({'message': "Error on update " + str(affected_rows)}), 500

    except Exception as ex:
        return jsonify({'message': str(ex)}), 500


@main.route('/delete/<code>', methods=['DELETE'])
def delete_specialty(code):
    try:
        specialty = Specialty(code)

        affected_rows = SpecialtiesModel.delete_specialty(specialty)

        if affected_rows == 1:
            return jsonify(specialty.id)
        else:
            return jsonify({'message': "No movie deleted"}), 404

    except Exception as ex:
        return jsonify({'message': str(ex)}), 500
