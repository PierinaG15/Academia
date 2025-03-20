# app.py
from flask import Flask, render_template, request, redirect, url_for
import pymysql
import db

app = Flask(__name__)

# Configuración de la conexión a MySQL
connection = db.get_connection()


@app.route('/')
def index():
    # Obtener todos los alumnos
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM estudiantes")
        alumnos = cursor.fetchall()
    return render_template('index.html', alumnos=alumnos)

@app.route('/agregar', methods=['GET', 'POST'])
def agregar():
    if request.method == 'POST':
        nombre = request.form['nombre']
        apellido = request.form['apellido']
        
        with connection.cursor() as cursor:
            cursor.execute("INSERT INTO alumnos (nombre, apellido) VALUES (%s, %s)", (nombre, apellido))
            connection.commit()
        
        return redirect(url_for('index'))
    return render_template('agregar.html')

@app.route('/agregar_calificacion/<int:alumno_id>', methods=['GET', 'POST'])
def agregar_calificacion(alumno_id):
    if request.method == 'POST':
        asignatura_id = request.form['asignatura_id']
        calificacion = request.form['calificacion']
        
        with connection.cursor() as cursor:
            cursor.execute("INSERT INTO calificaciones (calificacion, alumno_id, asignatura_id) VALUES (%s, %s, %s)", 
                           (calificacion, alumno_id, asignatura_id))
            connection.commit()
        
        return redirect(url_for('index'))
    
    # Obtener asignaturas
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM asignaturas")
        asignaturas = cursor.fetchall()

    return render_template('calificacion.html', alumno_id=alumno_id, asignaturas=asignaturas)

if __name__ == '__main__':
    app.run(debug=True, port=80)