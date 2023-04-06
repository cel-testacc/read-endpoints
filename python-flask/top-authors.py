import os
from flask import Flask, jsonify
from flask_mysqldb import MySQL
from flask_cors import CORS

app = Flask(__name__)
app.config['MYSQL_USER'] = os.getenv('DBUSER')
app.config['MYSQL_DB'] = os.getenv('DBSQLENDPOINTS')
app.config['MYSQL_HOST'] = os.getenv('DBHOST')
app.config['MYSQL_PASSWORD'] = os.getenv('DBPASS')
mysql = MySQL(app)
CORS(app)


@app.route('/')
def hello_world():
    return 'Hello, world!'

@app.route('/authors', methods=['GET'])
def get_books():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM authors')
    authors = cur.fetchall()
    cur.close()
    return jsonify(authors)

if __name__ == '__main__':
    app.run(debug=True)
