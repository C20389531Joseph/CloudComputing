from flask import Flask, request, jsonify
import mysql.connector

app = Flask(__name__)

# MySQL Instance configurations
app.config['MYSQL_USER'] = 'root'  # Replace with your MySQL username
app.config['MYSQL_PASSWORD'] = 'Footba11'  # Replace with your MySQL password
app.config['MYSQL_DB'] = 'mydb'  # Replace with your MySQL database name
app.config['MYSQL_HOST'] = 'localhost'  # Replace with your MySQL host


@app.route("/add", methods=['POST'])
def add_student():
    data = request.get_json()
    name = data.get('name')
    email = data.get('email')

    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()
        sql = "INSERT INTO students (studentName, email) VALUES (%s, %s)"
        cursor.execute(sql, (name, email))
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({"message": "Student added successfully"})
    except mysql.connector.Error as err:
        return jsonify({"error": str(err)})

@app.route("/", methods=['GET'])
def get_students():
    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM students")
        students = cursor.fetchall()
        cursor.close()
        conn.close()
        return jsonify({"students": students})
    except mysql.connector.Error as err:
        return jsonify({"error": str(err)})

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)