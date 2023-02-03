from flask import Blueprint, jsonify, request
import uuid

# Entities
from models.entities.Person import Person

# Models
from models.personalModel import PersonsModel


main = Blueprint('persons_blueprint', __name__)


@main.route('/')
def get_persons():
    try:
        persons = PersonsModel.get_persons()
        return jsonify(persons)
    except Exception as ex:
        return jsonify({'message': str(ex)}), 500


@main.route('/<code>')
def get_person(code):
    try:
        person = PersonsModel.get_person(code)
        if person is not None:
            return jsonify(person)
        else:
            return jsonify({}), 404
    except Exception as ex:
        return jsonify({'message': str(ex)}), 500


@main.route('/add', methods=['POST'])
def add_person():
    try:
        user_id = request.json['user_id']
        rut = request.json['rut']
        name = request.json['nombre']
        surname = request.json['apellido']
        address = request.json['domicilio']
        email = request.json['email']
        phone = request.json['telefono']

        person = Person(user_id, rut, name, surname, address, email, phone)

        affected_rows = PersonsModel.add_person(person)

        if affected_rows == 1:
            return jsonify(person.user_id)
        else:
            return jsonify({'message': "Error on insert " + str(affected_rows)}), 500

    except Exception as ex:
        return jsonify({'message': str(ex)}), 500


@main.route('/update/<code>', methods=['PUT'])
def update_person(code):
    try:
        rut = request.json['rut']
        name = request.json['nombre']
        surname = request.json['apellido']
        address = request.json['domicilio']
        email = request.json['email']
        phone = request.json['telefono']
        person = Person(code, rut, name, surname, address, email, phone)

        affected_rows = PersonsModel.update_person(person)

        if affected_rows == 1:
            return jsonify(person.user_id)
        else:
            return jsonify({'message': "Error on update " + str(affected_rows)}), 500

    except Exception as ex:
        return jsonify({'message': str(ex)}), 500


@main.route('/delete/<code>', methods=['DELETE'])
def delete_person(code):
    try:
        person = Person(code)

        affected_rows = PersonsModel.delete_person(person)

        if affected_rows == 1:
            return jsonify(person.user_id)
        else:
            return jsonify({'message': "No person deleted"}), 404

    except Exception as ex:
        return jsonify({'message': str(ex)}), 500
