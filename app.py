import os
import json

from flask import Flask, request
from flask.ext.sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.debug = True

services = os.environ.get('VCAP_SERVICES', None)
if services:
    postgres = json.loads(services)['postgresql-9.1'][0]['credentials']
    app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://{0}:{1}@{2}/{3}".format(
        postgres['user'],
        postgres['password'],
        postgres['host'],
        postgres['name']
    )
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////tmp/test.db'

db = SQLAlchemy(app)

class Message(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    body = db.Column(db.String(140))
    phone = db.Column(db.String(120))
    rink_id = db.Column(db.Integer)

    def __init__(self, body, phone):
        self.body = body
        self.phone = phone

    def __repr__(self):
        return '<Message %r:%r>' % (self.phone, self.body)

@app.route('/')
def hello_world():
    return 'HomeIce - data collector'

@app.route('/incoming/', methods=['POST'])
def incoming():
    body = request.form['Body']
    phone = request.form['From']

    message = Message(body, phone)
    db.session.add(message)
    db.session.commit()

    return ''

port = os.getenv('VCAP_APP_PORT', '5000')
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=int(port))
